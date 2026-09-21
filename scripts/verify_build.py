"""Reject an old PL image before JTAG; record exact artifacts and inputs."""
import hashlib
import json
from pathlib import Path
import re
import zipfile

ROOT=Path(__file__).resolve().parents[1]
def sha(data): return hashlib.sha256(data).hexdigest()

def main():
    hw=ROOT/'zybo_z7_imx219'
    bit=hw/'zybo_z7_imx219.runs/impl_1/design_1_wrapper.bit'
    xsa=hw/'design_1_wrapper.xsa'
    with zipfile.ZipFile(xsa) as z:
        hwh='\n'.join(z.read(n).decode() for n in z.namelist() if n.endswith('.hwh'))
        for name in ('raw_vdma','raw_switch','axis_isp_0'):
            if name not in hwh: raise RuntimeError(f'XSA lacks {name}: rebuild FPGA and BSP first')
        bits=[n for n in z.namelist() if n.endswith('.bit')]
        if len(bits)!=1 or sha(z.read(bits[0]))!=sha(bit.read_bytes()):
            raise RuntimeError('XSA and bitstream mismatch')
    bsp=ROOT/'vitis_hdmi_ws/zybo_hdmi_plat/ps7_cortexa9_0/standalone_domain/bsp/ps7_cortexa9_0/include/xparameters.h'
    bt=bsp.read_text(encoding='utf-8', errors='replace')
    params=(ROOT/'sw/src/parameters.h').read_text(encoding='utf-8', errors='replace')
    if not (('RAW_VDMA' in bt and 'RAW_SWITCH' in bt) or
            ('RAW_VDMA_BASE' in params and 'RAW_SWITCH_BASE' in params)):
        raise RuntimeError('BSP is stale: rebuild from new XSA')
    files=[bit,xsa,bsp]+list((ROOT/'sw/src').glob('*.c'))+list((ROOT/'sw/src').glob('*.h'))
    files+=list((ROOT/'src').glob('*.v'))+[ROOT/'src/isp_srgb.mem']
    files += [ROOT/'vitis_hdmi_ws/cam_hdmi/Debug'/n for n in ('cam_hdmi.elf','cam_hdmi.bin')]
    meta=json.loads((ROOT/'pic/HDMI_test_format.json').read_text())
    for name,expected in meta['sha256'].items():
        p=ROOT/'pic'/name
        if sha(p.read_bytes())!=expected: raise RuntimeError(f'Asset checksum mismatch: {name}')
        files.append(p)
    stamp=re.search(r'#define BUILD_STAMP (0x[0-9A-Fa-f]+)',(ROOT/'sw/src/main.c').read_text()).group(1)
    result={'build':stamp,'files':{str(p.relative_to(ROOT)):sha(p.read_bytes()) for p in files}}
    (ROOT/'scripts/build_manifest.json').write_text(json.dumps(result,indent=2)+'\n')
    print(f'BUILD {stamp}: matching bitstream/XSA, new BSP, asset hashes verified')

if __name__=='__main__': main()
