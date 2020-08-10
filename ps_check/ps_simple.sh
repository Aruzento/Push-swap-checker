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