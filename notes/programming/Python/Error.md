# Python Error

## `ModuleNotFoundError: No module named '_ctypes'`
> 没有安装外部函数库(`libffi`)的开发链接库软件包

```bash
# > ubuntu
$ apt-get install libffi-dev
# > centos
$ yum install libffi-devel -y
```

## `ModuleNotFoundError: No module named '_lzma'`
> 没有安装(`lzma-dev` - LZMA 压缩是一种数据压缩算法)的开发链接库软件包 

```bash
# > ubuntu
$ apt-get install liblzma-dev -y
# > centos
$ yum install xz-devel -y
$ yum install python-backports-lzma -y
```