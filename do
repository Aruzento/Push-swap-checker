make re
make clean

clear
echo "\033[33;1m author: \033[0m" | tr -d "\n"
cat -e author

echo "\n\t\033[33;1m Valid check: \033[0m"
echo "\033[1m[e_char:]\t[w_num:]\t[mx_int:]\t[uc_comm:]\033[0m"
for (( count=1; count<3; count++ ))
do
	ARG='0 1 2 3 4 5 end'
	err=$(./push_swap $ARG | tr -d "\n")
	if [ $err == "Error" ]
	then
		echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
	else
		echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	fi
	err=$(echo "ra sa " | tr -s " " "\n" | ./checker $ARG | tr -d "\n")
	if [ $err == "Error" ]
	then
		echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	else
		echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
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
	else
		echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	fi
	err=$(echo "ra sa " | tr -s " " "\n" | ./checker $ARG | tr -d "\n")
	if [ $err == "Error" ]
	then
		echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	else
		echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
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
	else
		echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	fi
	err=$(echo "ra sa " | tr -s " " "\n" | ./checker $ARG | tr -d "\n")
	if [ $err == "Error" ]
	then
		echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	else
		echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
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
	else
		echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	fi
	err=$(echo "rrr so " | tr -s " " "\n" | ./checker $ARG | tr -d "\n")
	if [ $err == "Error" ]
	then
		echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	else
		echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	fi
	ARG='5 3 2 1 4'
done
echo "\n"

echo "\t\033[33;1m Correction list: \033[0m"
ARG='0 9 1 8 2 7 3 6 4 5'
err=$(echo "sa pb rrr " | tr -s " " "\n" | ./checker $ARG | tr -d "\n")
if [ $err == "KO" ]
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
fi

ARG='0 1 2'
err=$(./push_swap | ./checker $ARG | tr -d "\n")
if [ $err == "OK" ]
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
fi

ARG='0 9 1 8 2'
err=$(echo "pb ra pb ra sa ra pa pa" | tr -s " " "\n" | ./checker $ARG | tr -d "\n")
if [ $err == "OK" ]
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
fi
ARG='42'
for (( count=1; count<3; count++ ))
do
	err=$(./push_swap $ARG | wc -l)
	if (( $err == 0 ))
	then
		echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
	else
		echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	fi
	ARG='0 1 2 3 4 5 6 7 8 9'
done
ARG='2 1 0'
err=$(./push_swap $ARG | wc -l)
if (( $err <= 3))
then
	echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
fi
ARG='1 5 2 4 3'
err=$(./push_swap $ARG | wc -l)
if (( $err <= 12))
then
	echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
fi

echo "\n\n\t\033[33;1m 3 random num: \033[0m"
errm=()
for (( count=1; count<10; count++ ))
do
	ARG=`ruby -e "puts (-1..1).to_a.shuffle.join(' ')"`
	if [ './push_swap $ARG | ./checker $ARG | tr -d "\n"' == "KO" ]
	then
		echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
		errm[count]=$ARG
	else
		echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
		num=$(./push_swap $ARG | wc -l | tr -d "[ \t]");
		if (( num > 3 ))
		then
			echo "\033[37;1;41m " | tr -d "\n"
			./push_swap $ARG | wc -l | tr -d " \t\n"
			echo "\033[0m" | tr -d "\n"
		else
			echo "\033[37;1;42m " | tr -d "\n"
			./push_swap $ARG | wc -l | tr -d " \t\n"
			echo "\033[0m " | tr -d "\n"
		fi
	fi
done
echo "\n"
if ((${errm[count]}))
then
	echo "\n\033[33;1m Err arguments: \033[0m"
	for (( count=0; count<10; count++ ))
	do
		if ((${errm[count]}))
		then
			echo "[ " ${errm[count]} " ]"
		fi
	done
fi

echo "\t\033[33;1m 5 random num: \033[0m"
errm=()
for (( count=1; count<10; count++ ))
do
	ARG=`ruby -e "puts (-2..2).to_a.shuffle.join(' ')"`
	if [ './push_swap $ARG | ./checker $ARG | tr -d "\n"' == "KO" ]
	then
		echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
		errm[count]=$ARG
	else
		echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
		num=$(./push_swap $ARG | wc -l | tr -d "[ \t]");
		if (( num > 12 ))
		then
			echo "\033[37;1;41m " | tr -d "\n"
			./push_swap $ARG | wc -l | tr -d " \t\n"
			echo "\033[0m" | tr -d "\n"
			errm[count]=$ARG
		else
			echo "\033[37;1;42m " | tr -d "\n"
			./push_swap $ARG | wc -l | tr -d " \t\n"
			echo "\033[0m " | tr -d "\n"
		fi
	fi
done
echo "\n"
if ((${errm[count]}))
then
	echo "\n\033[33;1m Err arguments: \033[0m"
	for (( count=0; count<10; count++ ))
	do
		if ((${errm[count]}))
		then
			echo "[ " ${errm[count]} " ]"
		fi
	done
fi


echo "\t\033[33;1m 100 random num: \033[0m"
errm=()
for (( count=1; count<10; count++ ))
do
	ARG=`ruby -e "puts (-50..49).to_a.shuffle.join(' ')"`
	if [ './push_swap $ARG | ./checker $ARG | tr -d "\n"' == "KO" ]
	then
		echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
		errm[count]=$ARG
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
			else
				echo "\033[37;1;41m " | tr -d "\n"
				./push_swap $ARG | wc -l | tr -d " \t\n"
				echo "\033[0m " | tr -d "\n"
			fi
		else
			echo "\033[37;1;42m " | tr -d "\n"
			./push_swap $ARG | wc -l | tr -d " \t\n"
			echo "\033[0m " | tr -d "\n"
		fi
	fi
done
echo "\n"
if ((${errm[count]}))
then
	echo "\n\033[33;1m Err arguments: \033[0m"
	for (( count=0; count<10; count++ ))
	do
		if ((${errm[count]}))
		then
			echo "[ " ${errm[count]} " ]"
		fi
	done
fi

echo "\t\033[33;1m 500 random num: \033[0m"
errm=()
for (( count=1; count<10; count++ ))
do
	ARG=`ruby -e "puts (-250..249).to_a.shuffle.join(' ')"`
	if [ './push_swap $ARG | ./checker $ARG | tr -d "\n"' == "KO" ]
	then
		echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
		errm[count]=$ARG
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
			else
				echo "\033[37;1;41m " | tr -d "\n"
				./push_swap $ARG | wc -l | tr -d " \t\n"
				echo "\033[0m " | tr -d "\n"
			fi
		else
			echo "\033[37;1;42m " | tr -d "\n"
			./push_swap $ARG | wc -l | tr -d " \t\n"
			echo "\033[0m " | tr -d "\n"
		fi
	fi
done
echo "\n"
if ((${errm[count]}))
then
	echo "\n\033[33;1m Err arguments: \033[0m"
	for (( count=0; count<10; count++ ))
	do
		if ((${errm[count]}))
		then
			echo "[ " ${errm[count]} " ]"
		fi
	done
fi

echo "\t\033[33;1m Valgrind check: \033[0m"
errm=()
for (( count=1; count<10; count++ ))
do
	ARG=`ruby -e "puts (-250..249).to_a.shuffle.join(' ')"`
	valgrind --log-file=erandal ./push_swap $ARG >> tmp.ps
	num=$(cat erandal | grep "definitely lost: 0 bytes in 0 blocks" | wc -l | tr -d "[ \t]");
	num2=$(cat erandal | grep "indirectly lost: 0 bytes in 0 blocks" | wc -l | tr -d "[ \t]");
	rm -rf erandal
	rm -rf tmp.ps
	if ((num  == 0 )) && (( num2 == 0))
	then
		echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
		errm[count]=$ARG
	else
		echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
	fi
done
echo ""
for (( count=1; count<10; count++ ))
do
	ARG=`ruby -e "puts (-250..249).to_a.shuffle.join(' ')"`
	valgrind --log-file=erandal echo "ra sa" | tr -s " " "\n" | ./checker $ARG >> tmp.ps
	num=$(cat erandal | grep "definitely lost: 0 bytes in 0 blocks" | wc -l | tr -d "[ \t]");
	num2=$(cat erandal | grep "indirectly lost: 0 bytes in 0 blocks" | wc -l | tr -d "[ \t]");
	rm -rf erandal
	rm -rf tmp.ps
	if ((num  == 0 )) && (( num2 == 0))
	then
		echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
		errm[count]=$ARG
	else
		echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
	fi
done
echo ""
if ((${errm[count]}))
then
	echo "\n\033[33;1m Err arguments: \033[0m"
	for (( count=0; count<10; count++ ))
	do
		if ((${errm[count]}))
		then
			echo "[ " ${errm[count]} " ]"
		fi
	done
fi

rm -rf *.dSYM