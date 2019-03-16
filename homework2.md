*作业须知：请特别注意截止时间，老师会在教学系统里多设定一周，以防止因系统不稳定而导致有的同学未能及时提交，请同学们务必提早一周提交。超过截止时间将不再收取作业，请不要通过**Email**发送作业。*

 

Shell脚本编写：

 

1． 编写一个shell脚本显示HOME、PATH、SHLVL、LOGNAME变量的值。

sysVariables.sh:

```
#!/bin/sh

#显示HOME变量
echo $HOME
#显示PATH变量
echo $PATH
#显示SHLVL变量
echo $SHLVL
#显示LOGNAME变量
echo $LOGNAME
```
2．用while语句重写下列Shell脚本程序，以实现相同的功能：

```
#!/bin/sh

clear

select item in Continue Finish

do

case "$item" in

        Continue) ;;

        Finish) break ;;

        *) echo "Wrong choice! Please select again!" ;;

esac

done
```

用while语句重写:

```
#!/bin/sh

clear

echo "1) Continue"
echo "2) Finish"
echo -n "#? "

while read choice
do
	case $choice in
		1)echo -n "#? ";;
		2)break;;
		*)echo "Wrong choice! Please select again!"
		  echo -n "#? ";;
	esac
done
```

3.编写一个shell脚本，显示Fibonacci数列的前10个数字。(Fibonacci数列: a[i+2]=a[i+1]+a[i], a[1]=0, a[2]=1, i>=1)

```
#!/bin/bash
#
#Print the top 10 number of Fibonacci array
#
echo "Fibonacci Array:"
a_2=0
a_1=1
a=1
for ((i=1;i<=10;i++))
do
	if [ $i -eq 1 ];then
		echo "a[1]=$a_2"
	elif [ $i -eq 2 ];then
		echo "a[2]=$a_1"
	else
		echo "a[$i]=$a"
		a_2=$a_1
		a_1=$a
		a=$((a_1+a_2))
	fi
done
```

