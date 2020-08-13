rm log_checker.txt

echo "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
clear

if [ -e ./Makefile ]
then
	clear
else
	clear
	echo "No \033[31;1mMakefile!\033[0m!"
	exit 0
fi

echo "\n\n    Hi! Enter here type of check:\n\t\033[33;1m-u \033[0m- common check;"
echo "\t\033[33;1m-s \033[0m- stress test;"
echo "\t\033[33;1m-k \033[0m- kill checker;"
echo "\n\033[33;1mOptional:\033[0m"
echo "\t\033[33;1m-n \033[0m- check norme test;"
echo "\t\033[33;1m-c \033[0m- check list test;"
echo "\t\033[33;1m-v \033[0m- valid checker;"
echo "\t\033[33;1m-leak \033[0m- valgring test;"
echo "\t\033[33;1m-num \033[0m- 3 + 5 + 100 + 500 test"
echo "type here: " | tr -d "\n"
read op

clear

echo "|"$op"|" > tmp.ps

num=$(cat tmp.ps | tr -d "\n");

if [ $num == "||" ]
then
	rm tmp.ps
	echo "\nТы ничего не сделал \033[33;1m:(\033[0m\n"
	exit 0
fi

if [ $op == "-k" ]
then
	rm log_checker.txt
	rm tmp.log
	make fclean
	rm erandal
	rm tmp.log
	rm tmp.ps
	clear
	echo "\n\nТы \033[31;1mУБИЛ\033[0m все файлы чекера!\n"
	exit 0
fi

if [ $op == "-n" ]
then
	sh ps_norme.sh
	exit 0
fi

make fclean >> log_checker.txt
make push_swap >> log_checker.txt
make checker >> log_checker.txt

if [ -e ./push_swap ]
then
	if [ -e ./checker ]
	then
		clear
	else
		echo "No \033[31;1mMakefile!\033[0m!"
		exit 0
	fi
else
	echo "No \033[31;1mMakefile!\033[0m!"
	exit 0
fi

if [ $op == "-c" ]
then
	sh ps_check/ps_correction.sh
	exit 0
fi

if [ $op == "-leak" ]
then
	sh ps_check/ps_valgrind.sh
	exit 0
fi

if [ $op == "-num" ]
then
	sh ps_check/ps_simple.sh
	exit 0
fi

if [ $op == "-v" ]
then
	sh ps_check/ps_valid.sh
	exit 0
fi

if [ $op == "-u" ]
then
	sh ps_norme.sh
	sh ps_check/ps_valid.sh
	sh ps_check/ps_correction.sh
	sh ps_check/ps_simple.sh
	sh ps_check/ps_valgrind.sh
	exit 0
fi

if [ $op == "-s" ]
then
	sh ps_check/ps_stress.sh
	exit 0
fi

echo 
rm tmp.ps
echo "\nТы ничего не сделал \033[33;1m:(\033[0m\n"
exit 0

make clean