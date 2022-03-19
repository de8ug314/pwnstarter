from pwn import *
host=''#like: 127.0.0.1:80

context.log_level='DEBUG'
#here are options

mode_type=0   #to choose the mode:0 for local, others for remoteness

elf=ELF('{}'.format(bin_name))
if mode_type==0:
    p=process('{}'.format(bin_name))
else:
    ip=host.split(':')[0]
    port=host.split(':')[1]
    p=remote(ip,int(port))
cv=lambda x:p.recv(x)
cvl=lambda :p.recvline()
cvn=lambda x:p.recvuntil(x)
sd=lambda x:p.send(x)
sdl=lambda x:p.sendline(x)
sdla=lambda s,d:p.sendlineafter(s,d)
ita=lambda :p.interactive()
lg=lambda x:log.success(x)
def debug(command=''):
    gdb.attach(p,command)
    pause()
