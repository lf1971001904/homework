#! /bin/bash

#判断文件夹是否存在
folder="/data/myfolder"
file="test.CSV"
sucessnumber=5
failernumber=4
sucessinfo="lf"
failerinfo="ltt"
if [ $UID -ne 0 ]
then
        echo -e "\e[1;31mmust to be root for exce shell\e[0m"
        exit
fi
if [ ! -d $folder ]
then 
	mkdir -p $folder && echo -e "\e[1;32m文件夹创建成功\e[0m"
else
	echo -e "\e[1;31m文件夹已经存在!\e[0m"
fi
if [ ! -e $folder/$file ]
then
	touch $folder/$file && echo -e "\e[1;32m文件已经创建!\e[0m"
else
	echo -e "\e[1;31m文件已经存在，请重新命名!\e[0m"
	exit
fi

for ((i=1;i<=$sucessnumber;i++))
do

	echo "$sucessinfo" >> $folder/$file

done

for ((i=1;i<=$failernumber;i++))
do
	echo "$failerinfo" >> $folder/$file
done

echo -e "\e[1;32m成功写入$[$sucessnumber+$failernumber]条数据!\e[0m"







