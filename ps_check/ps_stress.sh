echo "\n\tstress test: 5 \n" >> log_checker.txt
	echo "\t\033[33;1m stress test: 5 \033[0m"
	for (( count=1; count<101; count++ ))
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
	for (( count=1; count<101; count++ ))
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
	for (( count=1; count<251; count++ ))
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