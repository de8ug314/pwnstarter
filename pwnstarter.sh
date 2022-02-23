#!/bin/sh
if [ $# -eq 0 ];
then
    echo "please -h for help"
    exit 0
fi

target='exp.py'
if [ -f "$target" ];then
	echo "There has been a $target.Do you want to contine?[enter]"
	read state
	if [ $state="\n" ]
		then
		echo "Now,making new $target"
	else
		exit 0
	fi
fi
echo "start to pwn!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!"
cp $this_path/Template/template.py ./$target
while getopts ":l:r:c:b:iah" opt
do
    case $opt in
        b)  real=`realpath $OPTARG` 
            sed -e 4a\bin_name=\'$real\' -i $target
            ;;
        l)  real=`realpath $OPTARG` 
            sed -e 4a\libc=ELF\(\'$real\'\) -i $target
            ;;
        r)  sed -e 4a\host=\'$OPTARG\' -i $target
            ;;
        i)  sed -e 4a\context.arch=\'i386\' -i $target
            ;;
        a)  sed -e 4a\context.arch=\'amd64\' -i $target
            ;; 
        h)  cat<<EOF
            usage: pwn 
            -b choose the binary file
            -l choose the libc file
            -r get the ip and port,formated like 127.0.0.1:80
            -c use the tool to edit the exp after it has been created,tools like:code,vim,etc..
            -i mode of i386
            -a mode of amd64
            -h to read this
EOF
            ;;
        c)  $OPTARG $target
            ;;
    esac
done
