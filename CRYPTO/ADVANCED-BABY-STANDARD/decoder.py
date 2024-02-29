from Crypto.Cipher import AES
from Crypto.Util.Padding import pad,unpad
from Crypto.Util.number import long_to_bytes

BS = 16

iv = bytes.fromhex('a45e45f3aed018b451841ae91866e7ff')
ct = bytes.fromhex('14f49d8f4bcfda2dabd56be2d024399b12f519144758a7fca35a0c095aff5716f867f699529d81cee7b97fccb8874e9aff1a2fa42cf480b5bebb6214e2e6c03281ba1b29a67052614dc38bc4fd6a80b7c42eb35ffb5fbcb005c66013547121e0bf51926f0bcba2536c80bd46a43c9a7d2e6d9e5c1d27b9be705ece0be3bd371b')

for i in range(2**8,2**16):
	key = pad(long_to_bytes(i),BS)
	cipher = AES.new(key, AES.MODE_CBC, iv)
	pt = cipher.decrypt(ct)
	if b'ACT_CTF' in pt:
		print(key.hex())
		print(unpad(pt,64).decode())
		break
