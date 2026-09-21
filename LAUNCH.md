# Запуск: IMX219 → HDMI Out на Zybo Z7-20

Софт лежит в `sw/src/`. Текущий Vivado-проект `zybo_z7_imx219` захватывает камеру в DDR, но **HDMI в BD ещё нет**. Сначала допишите железо, потом соберите Vitis.

Перед любой правкой регистров камеры смотрите:

`doc_imx219/pdf/IMX219_datasheet/IMX219_datasheet.md`

(это же правило в `CONTEXT.md` и `.cursor/rules/imx219-datasheet.mdc`)

---

## 0. Что должно быть на столе

- Zybo Z7-20
- Raspberry Pi Camera v2 (IMX219) в разъём **Pcam**
- Монитор HDMI, кабель в разъём **HDMI OUT** (не HDMI IN)
- Vivado **2025.2** (проект уже на нём) и Vitis 2025.2
- USB UART (разъём PROG/UART) — 115200 8N1

---

## 1. Board files Digilent

`vivado-boards-master` нужен Vivado, не компилятору C.

1. Скопируйте `vivado-boards-master/new/board_files` в  
   `<Vivado>/data/boards/board_files`  
   или в Vivado: **Tools → Settings → Board Repository** → укажите  
   `vivado-boards-master/new/board_files`
2. Перезапустите Vivado.

Для HDMI TX ещё нужен IP **rgb2dvi**:

```
git clone https://github.com/Digilent/vivado-library.git
```

В Vivado: **Settings → IP → Repository** → добавьте `vivado-library`.

---

## 2. Дописать HDMI в Block Design

Откройте `zybo_z7_imx219/zybo_z7_imx219.xpr`.

Сейчас в BD:

`IMX219 → MIPI CSI-2 RX → VDMA S2MM → DDR`

Нужно:

```
CSI-2 RX (RAW10, 2 lane, 912 Mbps)   ← уже есть
    → v_demosaic (Bayer GBRG, 1920×1080)
    → axi_vdma  S2MM → DDR
DDR → axi_vdma  MM2S
    → v_axi4s_vid_out + v_tc (1080p60)
    → rgb2dvi → HDMI Out
```

### 2.1 VDMA

Откройте `axi_vdma_0`:

- включите **MM2S** (сейчас `c_include_mm2s = 0`)
- Frame Buffers = 3
- Stream Data Width = **24** (RGB888 после demosaic)
- Memory Map Data Width = 64 (можно оставить)

Подключите `M_AXI_MM2S` к HP0 (через тот же SMC / interconnect).  
`M_AXIS_MM2S` → вход `v_axi4s_vid_out`.

### 2.2 Demosaic

Добавьте **Sensor Demosaic** (`v_demosaic`):

- Max Columns/Rows: 1920 / 1080
- Samples per clock: 1
- Max Data Width: 10 (вход RAW10)

Соединение: `CSI-2 RX video_out` → `demosaic s_axis_video` → `VDMA S_AXIS_S2MM`.

AXI-Lite demosaic → GP0 (автоматически через Connection Automation).

### 2.3 HDMI pixel clock 148.5 MHz

Добавьте **Clocking Wizard** (второй выход или новый IP):

- вход: `FCLK_CLK1` 100 MHz
- выход: **148.5 MHz** (`clk_out_hdmi`)

Этот такт идёт на:

- `v_tc` / `v_axi4s_vid_out` (vid_io_out_clk)
- `rgb2dvi` PixelClk

`rgb2dvi` ещё нужен SerialClk = **5×** pixel = 742.5 MHz. В rgb2dvi включите внутренний MMCM (`kGenerateSerialClk = true`), тогда SerialClk генерируется из PixelClk.

### 2.4 VTC + AXI4-Stream to Video Out

- **v_tc**: Generation only, 1080p60 (или Generic, тайминг задаст софт)
- **v_axi4s_vid_out**: Video Format RGB, 24 bit  
  `vtg_ce` / `vid_io_out` связать с v_tc по гайду Xilinx PG044  
  `locked` / `overflow` можно повесить на ILA или оставить висящими

Типовые связи:

- VDMA `M_AXIS_MM2S` → `v_axi4s_vid_out.video_in`
- `v_tc.vtiming_out` → `v_axi4s_vid_out.vtiming_in`
- `v_axi4s_vid_out.vtg_ce` → `v_tc.gen_clken`
- `v_axi4s_vid_out.vid_io_out` (RGB + hsync/vsync/de) → `rgb2dvi.RGB`

### 2.5 rgb2dvi

- RefClk 200 MHz: можно взять `FCLK_CLK0` (уже 200 MHz для D-PHY)
- PixelClk: 148.5 MHz
- TMDS вывести наружу (Make External)

Имена портов должны совпасть с `constrs/hdmi_out.xdc`  
(`TMDS_Clk_p/n`, `TMDS_Data_p/n[2:0]`). Если Digilent board interface `hdmi_out` доступен — лучше **Make Connection** к board interface, тогда XDC не нужен.

### 2.6 Constraints

**Add Sources → Constraints** → `constrs/hdmi_out.xdc`  
(только после того, как порты HDMI есть в wrapper).

Камерный `pcam.xdc` уже в проекте — не трогайте.

### 2.7 Сборка FPGA

1. Validate Design
2. Generate Bitstream
3. **File → Export → Export Hardware** (включая bitstream)  
   получите `design_1_wrapper.xsa`

---

## 3. Vitis — приложение

1. Vitis 2025.2 → Create Platform from `design_1_wrapper.xsa` (standalone, PS7 Cortex-A9)
2. Create Application → Empty C Application (или Hello World, потом замените `helloworld.c`)
3. Скопируйте в `src` приложения:

```
sw/src/main.c
sw/src/imx219.c
sw/src/imx219.h
sw/src/pipeline.c
sw/src/pipeline.h
sw/src/parameters.h
```

Не добавляйте `sw/src/optional/main_i2c_test.c` в тот же проект (второй `main`).

4. Если компилятор не находит `XPAR_*_DEVICE_ID` — откройте сгенерированный `xparameters.h` и поправьте алиасы в `parameters.h`.
5. Если нет `XV_demosaic_Set_HwReg_*` — в драйвере HLS имена могут быть `XV_demosaic_Set_width` / `Set_height` / `Set_bayer_phase`. Поправьте `pipeline.c`.
6. BSP: stdin/stdout = **UART1**, 115200.
7. Build.

### Только проверка камеры (текущий bitstream без HDMI)

Соберите приложение из:

- `imx219.c` / `imx219.h` / `parameters.h`
- `optional/main_i2c_test.c` вместо `main.c` и `pipeline.c`

В UART должно быть: `IMX219 MODEL_ID 0x0219 OK`.

---

## 4. Прошить и запустить

1. Zybo: джампер загрузки **JTAG**
2. Камера в Pcam, монитор в **HDMI OUT**
3. Подключите USB UART + JTAG
4. В Vitis: **Run → Run Configurations → System Project Debug (GDB)**  
   или **Program FPGA** + **Run**
5. Терминал (PuTTY / Tera Term): COM-порт Zybo, **115200 8N1**

Ожидаемый лог:

```
Zybo Z7  IMX219 1080p  ->  HDMI Out
IMX219 MODEL_ID 0x0219 OK
IMX219 1080p RAW10 2-lane programmed (still in standby)
CSI-2 RX: 2-lane RAW10 enabled
Demosaic: 1920x1080 GBRG
VTC: 1080p60 generator
VDMA: S2MM+MM2S 1920x1080 RGB888, 3 frames @ 0x10000000
Streaming. HDMI should show the camera.
```

На мониторе — живое изображение 1080p.

---

## 5. Если не завелось

| Симптом | Что проверить |
|---------|----------------|
| `IMX219 not responding` | Шлейф Pcam, питание камеры, XCLR на G20, I2C F19/F20, адрес `0x10` |
| `Unexpected MODEL_ID` | Repeated Start: без `XIICPS_REP_START_OPTION` read врёт (даташит §3-1-2) |
| Chip ID ок, HDMI чёрный | MM2S выключен; нет 148.5 MHz; rgb2dvi не тот порт; кабель в HDMI IN |
| Цвета «плывут» / фиолетовые | Bayer phase: даташит p.89 = **GBRG** (`2`). Смените на 0/1/3 в `parameters.h` |
| Картинка рвётся | VDMA stride не 5760; stream width не 24; D-cache (софт уже делает `Xil_DCacheDisable`) |
| CSI lock fail | `0x0114=0x01` до `0x0100=1`; line rate 912; 2 lane; XVCLK 24 MHz на G19 |
| Зелёный/серый кадр | Выдержка `0x015A/015B` и gain `0x0157` (см. даташит p.56–58) |

Порядок из даташита (p.77–78, p.47):

1. XCLR Low→High, подождать ≥6 ms  
2. I2C: chip id  
3. `0x0100=0`, soft reset, lanes / PLL / crop / RAW10  
4. Включить CSI RX, demosaic, VTC, VDMA  
5. **Потом** `0x0100=1`

---

## 6. Файлы

| Путь | Назначение |
|------|------------|
| `CONTEXT.md` | Обязательно читать даташит перед кодом |
| `.cursor/rules/imx219-datasheet.mdc` | То же правило для агента |
| `sw/src/*` | Программа Vitis |
| `constrs/hdmi_out.xdc` | Пины HDMI Out |
| `zybo_z7_imx219` | Vivado-проект |
| `vivado-boards-master` | Board files, не C |
