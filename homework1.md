*作业须知：请特别注意截止时间，老师会在教学系统里多设定一周，以防止因系统不稳定而导致有的同学未能及时提交，请同学们务必提早一周提交。超过截止时间将不再收取作业，请不要通过**Email**发送作业。*

 1.用命令完成以下功能（写出对应的命令，要求命令尽可能简单[能一行命令完成的尽量一行命令完成, 不能使用课上教的Shell脚本或者编程方法]）

a)将当前目录下所有文件备份并压缩成tar.gz，如果成功再将备份拷贝到/backup目录下。

```
tar -zcvf tar.gz . && cp tar.gz /backup/
```
b) 将上述备份压缩后的文件解压到原来的目录。
```
tar -xzvf tar.gz
```
c) 将当前目录下所有后缀为.html的文件的后缀改为.htm。
```
rename 's/\.html/\.htm/' *.html
```
d）将当前目录下所有子目录下以a开头的.cpp文件改名为以b开头的.c文件。
```
find . -name "a*.cpp" -exec rename 's/(.*\/)a([^\/]*)\.cpp$/$1b$2\.c/' {} \;
```

2.自己查阅Linux相关书籍资料，学习并完成以下作业题：

a) 请简要叙述DOS/Windows中的文本文件，UNIX/Linux中的文本文件以及Mac中的文本文件有何不同之处，并给出至少一种你认为较为实用的转换方案。(需要两两给出转换方案)

```
Difference:
DOS/Windows uses a pair of CR and LF characters to terminate lines. UNIX/Linux uses an LF character only. MacOS X also uses a single LF character, but the classic Mac operating system (MacOS 9 and below) used a single CR character for line breaks. 
EDIT: in other format CR and LF:
\n is ASCII 0x0A, Line Feed (LF)
\r is ASCII 0x0D, Carriage return (CR)
```

```
Conversion:
1.vim
vim file.txt
:setfileformat=unix/dos/mac
:wq

2.dos2unix/unix2dos
In normal mode line breaks are converted from DOS to Unix and vice versa. Mac line breaks are not converted.
In Mac mode line breaks are converted from Mac to Unix and vice versa. DOS line breaks are not changed.
To run in Mac mode use the command-line option "-c mac" or use the commands "mac2unix" or "unix2mac". 

3.flip(recommended)
Usage: flip [-t|-u|-d|-m] filename[s]
   Converts ASCII files between Unix, MS-DOS/Windows, or Macintosh newline formats
   Options:
      -u  =  convert file(s) to Unix newline format (newline)
      -d  =  convert file(s) to MS-DOS/Windows newline format (linefeed + newline)
      -m  =  convert file(s) to Macintosh newline format (linefeed)
      -t  =  display current file type, no file modifications

4.Perl
DOS2UNIX：perl -p -e ‘s/\r$//’< dosfile.txt > unixfile.txt
UNIX2DOS：perl -p -e ‘s/$/\r/’< unixfile.txt > dosfile.txt
Mac2Unix：perl -p -e 's/\r/\n/g'  < macfile.txt > unixfile.txt
Unix2Mac：perl -p -e 's/\n/\r/g' < unixfile.txt > macfile.txt

Also can use command tr or sed...
```

b) 请查阅Linux系统中/etc/fstab文件各字段功能，并对你自己安装的Linux系统中/etc/fstab的各个字段做出解释。

安装的Linux系统中/etc/fstab文件：

```
# /etc/fstab: static file system information.
#
# Use 'blkid' to print the universally unique identifier for a
# device; this may be used with UUID= as a more robust way to name devices
# that works even if disks are added and removed. See fstab(5).
#
# <file system> <mount point>   <type>  <options>       <dump>  <pass>
# / was on /dev/sda1 during installation
UUID=d8e7e226-f566-4c5a-829a-b94740bc0a4d /               ext4    errors=remount-ro 0       1
# swap was on /dev/sda5 during installation
UUID=2897e378-1494-47fb-a7b1-5bcb5da97b2e none            swap    sw              0       0
/dev/fd0        /media/floppy0  auto    rw,user,noauto,exec,utf8 0       0
```

各个字段的解释/功能：

| 字段          | 解释/功能                                                    |
| ------------- | ------------------------------------------------------------ |
| <file system> | 设备名或者设备UUID号                                         |
| <mount point> | Linux系统为设备或分区设定的挂载点                            |
| <type>        | Linux系统为设备或分区指定的文件系统格式                      |
| <options>     | 挂载参数（auto/noauto,user/nouser,exec/noexec,ro,rw,sync/async,defaults） |
| <dump>        | 转储选项:dump选项检查文件系统并用一个数字来决定该文件系统是否需要备份。如果它是0，dump将会忽略该文件系统，不做备份。 |
| <pass>        | 文件系统检查选项:fsck选项通过检验第6项中的数字来决定以何种顺序检查文件系统，如果它是0，fsck将不检查该文件系统。根文件系统（“/”）的默认值为1，其他文件系统可以为2-9。 |

c) 用命令行实现： 从光盘制作一个.iso文件，如果成功将光盘弹出。

```
dd if=/dev/cdrom of=cdrom.iso && eject
```


**附加题：**

假设当前Linux系统的目录/tmp/gsl下的文件结构如下图所示，其中有很多Makefile分散在各个子目录下(但并非每个子目录都存在Makefile，例如block目录下就没有)。

```
|-- INSTALL
|-- Makefile
|-- NEWS
|-- ...
|-- blas
|   |-- ChangeLog
|   |-- Makefile
|   |-- TODO
|   |-- blas.c
|   |-- ...
|-- block
|   |-- ChangeLog
|   |-- block.c
|-- bspline
|   |-- Makefile
|   |-- ...
|-- ...
```

要求将这些Makefile拷贝到目录/home/usrname/gsl的对应子目录下(假设/home/usrname/gsl下已经存在blas，bspline等子目录)，使得拷贝后/home/usrname/gsl下的文件如下图所示：

```
|-- Makefile
|-- blas
|   |-- Makefile
|-- bspline
|   |-- Makefile
|-- ...
```

 *要求：该要求实际上是可以用一行命令完成的，难度较高。同学们实际做作业时，允许使用两到三行命令，但不允许使用任何编程实现(即不允许Shell脚本的循环，分支等控制流程，可以使用管道)。

*提示：利用find，sed和sh命令。

```
find /tmp/gsl -name "Makefile" -exec printf "cp %s&%s\n" {} {} \;|sed 's/&\/tmp/ \/home\/usrname/'|xargs -d\n -n1 sh -c
```

