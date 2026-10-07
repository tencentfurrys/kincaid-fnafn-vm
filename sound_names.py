import struct, json
from pathlib import Path

# Sound index -> name, from data.win's SOND chunk (same walk the SPRT/OBJT/ROOM
# parsers use). Resolves every runtime sound id the YYC codegen passes to
# audio_play_sound / audio_play_sound_single helpers (sound id = SOND index).
# Proven by 100% semantic fit in Obj_Jumpscare/Create: 24=Snd_Jumpscare_Bonnie_1
# with SPRT 77 Spr_Jumpscare_Bonnie_1, 42=Snd_Jumpscare_Chica_1 with SPRT 44,
# 39=Snd_Jumpscare_Foxy with SPRT 8, 9=Snd_Jumpscare_Mangle with SPRT 93,
# plus Alarm 54=Snd_Jumpscare_Freddy.
raw = Path('fnafn/binaries/data.win').read_bytes()
chunks = {}
off = 8
while off + 8 <= len(raw):
    ident = raw[off:off+4]
    size = struct.unpack_from('<I', raw, off+4)[0]
    if not all(32 <= b < 127 for b in ident):
        break
    chunks[ident.decode()] = (off+8, size)
    off += 8 + size
    if size % 2: off += 1

def cstr(abs_off):
    end = raw.index(b'\0', abs_off)
    return raw[abs_off:end].decode('utf-8', 'replace')

s_off, s_size = chunks['SOND']
count = struct.unpack_from('<I', raw, s_off)[0]
ptrs = [struct.unpack_from('<I', raw, s_off + 4 + 4*i)[0] for i in range(count)]
out = [{'index': i, 'name': cstr(struct.unpack_from('<I', raw, p)[0])} for i, p in enumerate(ptrs)]
for s in out:
    print('sound %(index)3d = %(name)r' % s)
Path('sound_names.json').write_text(json.dumps(out, indent=1), encoding='utf-8')
print('wrote sound_names.json (%d sounds)' % len(out))
