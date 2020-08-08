make fclean
make push_swap
make checker

rm log_checker.txt

clear
echo "\n\n    Hi! Enter here type of check:\n\t\033[33;1m-u \033[0m- common check;\n\t\033[33;1m-s \033[0m- stress test;"
echo "\t\033[33;1m-k \033[0m- kill checker;"
echo "type here: " | tr -d "\n"
read op

if [ $op == "-u" ]
then

clear
echo "\033[33;1m author: \033[0m" | tr -d "\n"
cat -e author

echo "\n\t\033[33;1m Norme check:\033[0m" | tr -d "\n"
echo "\n\tNorme check: \n" >> log_checker.txt
norminette * > tmp.ps
num=$(cat tmp.ps | grep "Error" | wc -l | tr -d "[ \t]");
rm -rf tmp.ps
if (( num == 0 ))
then
	echo "\033[37;1;42m ✓\033[0m"
else
	echo "\033[37;1;41m ×\033[0m"
fi

echo "\n\t\033[33;1m Valid check: \033[0m"
echo "\n\tValid check: \n" >> log_checker.txt
echo "\033[1m[e_char:]\t[w_num:]\t[mx_int:]\t[uc_comm:]\033[0m"
for (( count=1; count<3; count++ ))
do
	ARG='0 1 2 3 4 5 end'
	err=$(./push_swap $ARG | tr -d "\n")
	if [ $err == "Error" ]
	then
		echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
		echo "[ " $ARG " ] - OK!" >> log_checker.txt
	else
		echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
		echo "[ " $ARG " ] - KO!   <---- Check this!" >> log_checker.txt
	fi
	err=$(echo "ra sa " | tr -s " " "\n" | ./checker $ARG | tr -d "\n")
	if [ $err == "Error" ]
	then
		echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
		echo "[ " $ARG " ] - OK!" >> log_checker.txt
	else
		echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
		echo "[ " $ARG " ] - KO!   <---- Check this!" >> log_checker.txt
	fi
	ARG='O 1 2 3 4 5'
done

echo "\t" | tr -d "\n"
for (( count=1; count<3; count++ ))
do
	ARG='0 1 2 2'
	err=$(./push_swap $ARG | tr -d "\n")
	if [ $err == "Error" ]
	then
		echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
		echo " ps : [ " $ARG " ] - OK!" >> log_checker.txt
	else
		echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
		echo " ps : [ " $ARG " ] - KO!   <---- Check this!" >> log_checker.txt
	fi
	err=$(echo "ra sa " | tr -s " " "\n" | ./checker $ARG | tr -d "\n")
	if [ $err == "Error" ]
	then
		echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
		echo " ch: [ " $ARG " ] - OK!" >> log_checker.txt
	else
		echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
		echo " ch: [ " $ARG " ] - KO!   <---- Check this!" >> log_checker.txt
	fi
	ARG='0 0 1 2'
done

echo "\t" | tr -d "\n"
for (( count=1; count<3; count++ ))
do
	ARG='0 1 2 3333333333333333333'
	err=$(./push_swap $ARG | tr -d "\n")
	if [ $err == "Error" ]
	then
		echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
		echo " ps: [ " $ARG " ] - OK!" >> log_checker.txt
	else
		echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
		echo " ps: [ " $ARG " ] - KO!   <---- Check this!" >> log_checker.txt
	fi
	err=$(echo "ra sa " | tr -s " " "\n" | ./checker $ARG | tr -d "\n")
	if [ $err == "Error" ]
	then
		echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
		echo " ch: [ " $ARG " ] - OK!" >> log_checker.txt
	else
		echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
		echo " ch: [ " $ARG " ] - KO!   <---- Check this!" >> log_checker.txt
	fi
	ARG='0 0 1 -3333333333333333333'
done

echo "\t" | tr -d "\n"
for (( count=1; count<3; count++ ))
do
	ARG='3 2 5 1 4'
	err=$(echo "ra ssa " | tr -s " " "\n" | ./checker $ARG | tr -d "\n")
	if [ $err == "Error" ]
	then
		echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
		echo " ps: [ " $ARG " ] - OK!" >> log_checker.txt
	else
		echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
		echo " ps: [ " $ARG " ] - KO!   <---- Check this!" >> log_checker.txt
	fi
	err=$(echo "rrr so " | tr -s " " "\n" | ./checker $ARG | tr -d "\n")
	if [ $err == "Error" ]
	then
		echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
		echo " ch: [ " $ARG " ] - OK!" >> log_checker.txt
	else
		echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
		echo " ch: [ " $ARG " ] - KO!   <---- Check this!" >> log_checker.txt
	fi
	ARG='5 3 2 1 4'
done
echo "\n"

echo "\n\tCorrection check: \033[0m" >> log_checker.txt
echo "\t\033[33;1m Correction list: \033[0m"
ARG='0 9 1 8 2 7 3 6 4 5'
err=$(echo "sa pb rrr " | tr -s " " "\n" | ./checker $ARG | tr -d "\n")
if [ $err == "KO" ]
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> log_checker.txt
fi

ARG='0 1 2'
err=$(./push_swap | ./checker $ARG | tr -d "\n")
if [ $err == "OK" ]
then
	echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> log_checker.txt
fi

ARG='0 9 1 8 2'
err=$(echo "pb ra pb ra sa ra pa pa" | tr -s " " "\n" | ./checker $ARG | tr -d "\n")
if [ $err == "OK" ]
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> log_checker.txt
fi
ARG='42'
for (( count=1; count<3; count++ ))
do
	err=$(./push_swap $ARG | wc -l)
	if (( $err == 0 ))
	then
		echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
		echo "[ " $ARG " ] - OK!" >> log_checker.txt
	else
		echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
		echo "[ " $ARG " ] - KO!   <---- Check this!" >> log_checker.txt
	fi
	ARG='0 1 2 3 4 5 6 7 8 9'
done
ARG='2 1 0'
err=$(./push_swap $ARG | wc -l)
if (( $err <= 3))
then
	echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> log_checker.txt
fi
ARG='1 5 2 4 3'
err=$(./push_swap $ARG | wc -l)
if (( $err <= 12))
then
	echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> log_checker.txt
fi


# 3

echo "\n\t3-num check: \n" >> log_checker.txt
echo "\n\n\t\033[33;1m 3 random num: \033[0m"
for (( count=1; count<10; count++ ))
do
	ARG=`ruby -e "puts (-1..1).to_a.shuffle.join(' ')"`
	if [ './push_swap $ARG | ./checker $ARG | tr -d "\n"' == "KO" ]
	then
		echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
		echo "[ " $ARG " ] - KO!   <---- Check this!" >> log_checker.txt
	else
		echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
		num=$(./push_swap $ARG | wc -l | tr -d "[ \t]");
		if (( num > 3 ))
		then
			echo "\033[37;1;41m " | tr -d "\n"
			./push_swap $ARG | wc -l | tr -d " \t\n"
			echo "\033[0m" | tr -d "\n"
			echo "[ " $ARG " ] - KO!   <---- Wrong num of operations!" >> log_checker.txt
		else
			echo "\033[37;1;42m " | tr -d "\n"
			./push_swap $ARG | wc -l | tr -d " \t\n"
			echo "\033[0m " | tr -d "\n"
			echo "[ " $ARG " ] - OK!" >> log_checker.txt
		fi
	fi
done
echo "\n"


# 5


echo "\n\t5-num check: \n" >> log_checker.txt
echo "\t\033[33;1m 5 random num: \033[0m"
for (( count=1; count<10; count++ ))
do
	ARG=`ruby -e "puts (-2..2).to_a.shuffle.join(' ')"`
	if [ './push_swap $ARG | ./checker $ARG | tr -d "\n"' == "KO" ]
	then
		echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
		echo "[ " $ARG " ] - KO!   <---- Check this!" >> log_checker.txt
	else
		echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
		num=$(./push_swap $ARG | wc -l | tr -d "[ \t]");
		if (( num > 12 ))
		then
			echo "\033[37;1;41m " | tr -d "\n"
			./push_swap $ARG | wc -l | tr -d " \t\n"
			echo "\033[0m" | tr -d "\n"
			echo "[ " $ARG " ] - KO!   <---- Wrong num of operations!" >> log_checker.txt
		else
			echo "\033[37;1;42m " | tr -d "\n"
			./push_swap $ARG | wc -l | tr -d " \t\n"
			echo "\033[0m " | tr -d "\n"
			echo "[ " $ARG " ] - OK!" >> log_checker.txt
		fi
	fi
done
echo "\n"


# 100


echo "\n\t100-num check: \n" >> log_checker.txt
echo "\t\033[33;1m 100 random num: \033[0m"
for (( count=1; count<10; count++ ))
do
	ARG=`ruby -e "puts (-50..49).to_a.shuffle.join(' ')"`
	if [ './push_swap $ARG | ./checker $ARG | tr -d "\n"' == "KO" ]
	then
		echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
		echo "[ " $ARG " ] - KO!   <---- Check this!" >> log_checker.txt
	else
		echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
		num=$(./push_swap $ARG | wc -l | tr -d "[ \t]");
		if (( num > 700 ))
		then
			if (( num < 1500 ))
			then
				echo "\033[37;1;45m " | tr -d "\n"
				./push_swap $ARG | wc -l | tr -d " \t\n"
				echo "\033[0m " | tr -d "\n"
				echo "[ 100 nums ] - OK!" >> log_checker.txt
			else
				echo "\033[37;1;41m " | tr -d "\n"
				./push_swap $ARG | wc -l | tr -d " \t\n"
				echo "\033[0m " | tr -d "\n"
				echo "[ " $ARG " ] - KO!   <---- Check this!" >> log_checker.txt
			fi
		else
			echo "\033[37;1;42m " | tr -d "\n"
			./push_swap $ARG | wc -l | tr -d " \t\n"
			echo "\033[0m " | tr -d "\n"
			echo "[ 100 nums ] - OK!" >> log_checker.txt
		fi
	fi
done
echo "\n"


# 500


echo "\n\t500-num check: \n" >> log_checker.txt
echo "\t\033[33;1m 500 random num: \033[0m"
for (( count=1; count<10; count++ ))
do
	ARG=`ruby -e "puts (-250..249).to_a.shuffle.join(' ')"`
	if [ './push_swap $ARG | ./checker $ARG | tr -d "\n"' == "KO" ]
	then
		echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
		echo "[ " $ARG " ] - KO!   <---- Check this!" >> log_checker.txt
	else
		echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
		num=$(./push_swap $ARG | wc -l | tr -d "[ \t]");
		if (( num > 5500 ))
		then
			if (( num < 11500 ))
			then
				echo "\033[37;1;45m " | tr -d "\n"
				./push_swap $ARG | wc -l | tr -d " \t\n"
				echo "\033[0m " | tr -d "\n"
				echo "[ 500 nums ] - OK!" >> log_checker.txt
			else
				echo "\033[37;1;41m " | tr -d "\n"
				./push_swap $ARG | wc -l | tr -d " \t\n"
				echo "\033[0m " | tr -d "\n"
				echo "[ " $ARG " ] - KO!   <---- Check this!" >> log_checker.txt
			fi
		else
			echo "\033[37;1;42m " | tr -d "\n"
			./push_swap $ARG | wc -l | tr -d " \t\n"
			echo "\033[0m " | tr -d "\n"
			echo "[ 500 nums ] - OK!" >> log_checker.txt
		fi
	fi
done
echo "\n"

echo "\t\033[33;1m Valgrind check: \033[0m"
for (( count=1; count<10; count++ ))
do
	ARG=`ruby -e "puts (-250..249).to_a.shuffle.join(' ')"`
	valgrind --leak-check=full --log-file=erandal ./push_swap $ARG > tmp.ps
	num=$(cat erandal | grep "definitely lost: 0 bytes in 0 blocks" | wc -l | tr -d "[ \t]");
	num2=$(cat erandal | grep "indirectly lost: 0 bytes in 0 blocks" | wc -l | tr -d "[ \t]");
	rm -rf erandal
	rm -rf tmp.ps
	if (( num  == 1 )) && (( num2 == 1))
	then
		echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
	else
		echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	fi
done
echo ""
for (( count=1; count<10; count++ ))
do
	ARG=`ruby -e "puts (-250..249).to_a.shuffle.join(' ')"`
	echo "ra\nsa" > tmp.ec
	valgrind --leak-check=full --log-file=erandal cat tmp.ec | tr -s " " "\n" | ./checker $ARG > tmp.ps
	num=$(cat erandal | grep "definitely lost: 0 bytes in 0 blocks" | wc -l | tr -d "[ \t]");
	num2=$(cat erandal | grep "indirectly lost: 0 bytes in 0 blocks" | wc -l | tr -d "[ \t]");
	rm -rf erandal
	rm -rf tmp.ps
	rm -rf tmp.ec
	if (( num  == 1 )) && (( num2 == 1))
	then
		echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
	else
		echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	fi
done
echo ""
rm -rf *.dSYM

else
if [ $op == "-s" ]
then
	echo "\n\tstress test: 5 \n" >> log_checker.txt
	echo "\t\033[33;1m stress test: 5 \033[0m"
	for (( count=1; count<501; count++ ))
	do
		ARG=`ruby -e "puts (-2..2).to_a.shuffle.join(' ')"`
		if [ './push_swap $ARG | ./checker $ARG | tr -d "\n"' == "KO" ]
		then
			echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
			echo "[ " $ARG " ] - KO!   <---- Check this!" >> log_checker.txt
		else
			num=$(./push_swap $ARG | wc -l | tr -d "[ \t]");
			if (( num > 12 ))
			then
				echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
				echo "[ " $ARG " ] - KO!   <---- Check this!" >> log_checker.txt
			else
				echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
				echo "[ " $ARG " ] - OK!" >> log_checker.txt
		fi
		fi
		if (( count % 50 == 0 ))
		then
			echo ""
		fi
	done
	echo ""
	echo "\n\tstress test: 100 \n" >> log_checker.txt
	echo "\n\t\033[33;1m stress test: 100 \033[0m"
	for (( count=1; count<501; count++ ))
	do
		ARG=`ruby -e "puts (-50..49).to_a.shuffle.join(' ')"`
		if [ './push_swap $ARG | ./checker $ARG | tr -d "\n"' == "KO" ]
		then
			echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
			echo "[ " $ARG " ] - KO!   <---- Check this!" >> log_checker.txt
		else
			echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
			echo "[ 100 nums ] - OK!" >> log_checker.txt
		fi
		if (( count % 50 == 0 ))
		then
			echo ""
		fi
	done
	echo ""
	echo "\n\tstress test: 500 \n" >> log_checker.txt
	echo "\n\t\033[33;1m stress test: 500 \033[0m"
	for (( count=1; count<501; count++ ))
	do
		ARG=`ruby -e "puts (-250..249).to_a.shuffle.join(' ')"`
		if [ './push_swap $ARG | ./checker $ARG | tr -d "\n"' == "KO" ]
		then
			echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
			echo "[ " $ARG " ] - KO!   <---- Check this!" >> log_checker.txt
		else
			echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
			echo "[ 500 nums ] - OK!" >> log_checker.txt
		fi
		if (( count % 50 == 0 ))
		then
			echo ""
		fi
	done
else
	if [ $op == "-k" ]
	then
		rm log_checker.txt
		make fclean
		rm do
		clear
		echo "\n\nТы \033[31;1mУБИЛ\033[0m все файлы чекера!\n"
else
	clear
	echo "\nТы ничего не сделал \033[33;1m:(\033[0m\n"
	fi
fi
fi
make clean