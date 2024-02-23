from Crypto.Cipher import AES
from Crypto.Util.Padding import pad,unpad
from Crypto.Util.number import long_to_bytes

BS = 16

iv = bytes.fromhex('b073cde698add06254eaeb244010d4e0')
ct = bytes.fromhex('01d1b45894543cdf2711ab84c7ab0701f5974cac2775f7004966a46eff0183e114f1aad563e4bd61a27e5efe1e7e41af468c8286559028c6af6d6e77c90f2169')

for i in range(2**8,2**16):
	key = pad(long_to_bytes(i),BS)
	cipher = AES.new(key, AES.MODE_CBC, iv)
	pt = cipher.decrypt(ct)
	if b'ACTCTF' in pt:
		print(key.hex())
		print(unpad(pt,64).decode())
		break
