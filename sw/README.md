# Vitis sources

Проверка драйвера без платы (из корня репозитория):

```
.\check.cmd
```

Скопируйте файлы из `src/` в application project. Полная инструкция: [`../LAUNCH.md`](../LAUNCH.md).

`src/optional/main_i2c_test.c` — только probe chip id, не кладите в один проект с `main.c`.
