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

echo "\n\n    Hi! Enter here type of check:\n\t\033[33;1m-full \033[0m- full test;"
echo "\t\033[33;1m-clean \033[0m- check-n-\033[31;1mdelete\033[0m test;"
echo "\t\033[33;1m-s \033[0m- stress test;"
echo "\t\033[33;1m-k \033[0m- kill tmp files;"
echo "\n\t\033[33;1mOptional:\033[0m"
echo "\t\033[33;1m-n \033[0m- check norme test;"
echo "\t\033[33;1m-c \033[0m- check list test;"
echo "\t\033[33;1m-v \033[0m- valid checker;"
echo "\t\033[33;1m-l \033[0m- valgring test;"
echo "\t\033[33;1m-p \033[0m- 3 + 5 + 100 + 500 test"
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
	echo "\n\nТы \033[31;1mУБИЛ\033[0m вспомогательные файлы чекера!\n"
	exit 0
fi

if [ $op == "-n" ]
then
	sh ps_check/ps_norme.sh
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

if [ $op == "-l" ]
then
	sh ps_check/ps_valgrind.sh
	exit 0
fi

if [ $op == "-p" ]
then
	sh ps_check/ps_simple.sh
	exit 0
fi

if [ $op == "-v" ]
then
	sh ps_check/ps_valid.sh
	exit 0
fi

if [ $op == "-full" ]
then
	sh ps_check/ps_norme.sh
	sh ps_check/ps_valid.sh
	sh ps_check/ps_correction.sh
	sh ps_check/ps_simple.sh
	sh ps_check/ps_valgrind.sh
	exit 0
fi

if [ $op == "-clean" ]
then
	echo "\n\n\t Are u sure? Its check your program and \033[31;1mMOMENTALLY KILL\033[0m all checker files!"
	echo "type [y or n]: " | tr -d "\n"
	read op
	if [ $op == "y" ]
	then
		sh ps_check/ps_norme.sh
		sh ps_check/ps_valid.sh
		sh ps_check/ps_correction.sh
		sh ps_check/ps_simple.sh
		sh ps_check/ps_valgrind.sh

		rm log_checker.txt > tmp.ps
		make fclean
		make kill
		rm tmp.ps
	else
		clear
		echo "\nТы ничего не сделал \033[32;1m:)\033[0m\n"
	fi
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