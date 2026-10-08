# -*- mode: python -*-

a = Analysis(['ahmed_scanner.py'],
             pathex=['.'],
             hiddenimports=['yara', 'psutil', 'rfc5424logging', 'netaddr'],
             hookspath=None,
             runtime_hooks=None)
pyz = PYZ(a.pure)

a.datas = list({tuple(map(str.upper, t)) for t in a.datas})

exe = EXE(pyz,
          a.scripts,
          a.binaries,
          a.zipfiles,
          a.datas,
          name='ahmed_scanner.exe',
          debug=False,
          strip=None,
          upx=False,
          console=True , icon='ahmed_scanner.ico')