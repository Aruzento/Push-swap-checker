echo "\t\033[33;1m Valgrind check: \033[0m"
for (( count=1; count<4; count++ ))
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


# Необычные:

ARG="1 2 3"
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

ARG="ффф"
valgrind --leak-check=full --log-file=erandal ./push_swap $ARG 2> tmp.ps
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

ARG="    "
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
echo ""


# Чекер


for (( count=1; count<4; count++ ))
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


# Необычные:

ARG="1 2 3"
echo "\n" > tmp.ec
valgrind --leak-check=full --log-file=erandal cat tmp.ec | tr -s " " "\n" | ./checker $ARG 2> tmp.ps
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

ARG="1 2 3"
echo "rar\nsa" > tmp.ec
valgrind --leak-check=full --log-file=erandal cat tmp.ec | tr -s " " "\n" | ./checker $ARG 2> tmp.ps
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

ARG="1 2 3"
echo "ra\nsa" > tmp.ec
valgrind --leak-check=full --log-file=erandal cat tmp.ec | tr -s " " "\n" | ./checker $ARG > tmp.ps
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
echo ""


rm -rf *.dSYM