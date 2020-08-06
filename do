clear

echo "\n\t\033[33;1m Valid check: \033[0m"
echo "\033[1m[e_char:]\t[w_num:]\t[mx_int:]\t\033[0m"
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
echo "\n"

echo "\t\033[33;1m 3 random num: \033[0m"
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