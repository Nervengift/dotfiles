#!/usr/bin/env python3
import sys
import socket
client = socket.socket(socket.AF_UNIX, socket.SOCK_STREAM)
client.connect("/tmp/rofi_notification_daemon")
client.sendall(bytes("num",'utf-8'))

val = client.recv(32)
val = val.decode('utf-8')
l = val.split('\n',2)
num_all = int(l[0])
num_urgent = int(l[1])
if num_all > 0:
    print(str(num_all))
else:
    print()
