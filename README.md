# pwnstarter
make it easier to start to pwn

**Installation**:
run 
```shell
    ./install.sh
```
after installation,uninstall.sh will be created here.Run it if you'd like to remove pwnstarter

**Usage**: 
```shell
            -b choose the binary file
            -l choose the libc file
            -r get the ip and port,formated like 127.0.0.1:80
            -c use the tool to edit the exp after it has been created,tools like:code,vim,etc..
            -i mode of i386
            -a mode of amd64
            -h to read this
```            
ef: pwnstarter -i -b pwn -l libc-2.23.so -r 127.0.0.1:80 -c vim

if you have any idea for more functions,please contact me

default template:
```python
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
sdl=lambda x:p.sendline(x)
sdla=lambda s,d:p.sendlineafter(s,d)
ita=lambda :p.interactive()
lg=lambda x:log.success(x)
def debug(command=''):
    gdb.attach(p,command)
    pause()
```
