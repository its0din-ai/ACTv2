from Crypto.Cipher import AES
from Crypto.Util.Padding import pad
from secret import FLAG # Format flag ACTCTF{.*}
KY = 2
BS = 16
key = pad(open("/dev/urandom","rb").read(KY), BS)
iv =  open("/dev/urandom","rb").read(BS)
cp = AES.new(key, AES.MODE_CBC, iv)
ct = cp.encrypt(pad(FLAG, 64))
print(f"""\n+----------\n| KEY     : <redacted>\n| IV      : {iv.hex()}\n| CIPHER  : {ct.hex()}\n+----------\n\n""")