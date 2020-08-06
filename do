echo "3 - символа:"
for (( count=1; count<10; count++ ))
do
ARG=`ruby -e "puts (-1..1).to_a.shuffle.join(' ')"`
echo "[" $ARG "] " | tr -d "\n"
./push_swap $ARG | ./checker $ARG | tr -d "\n"
echo ": " | tr -d "\n"
./push_swap $ARG | wc -l | tr -d "[ \t]"
done
echo "5 - символов:"
for (( count=1; count<10; count++ ))
do
ARG=`ruby -e "puts (-2..2).to_a.shuffle.join(' ')"`
echo "[" $ARG "] " | tr -d "\n"
./push_swap $ARG | ./checker $ARG | tr -d "\n"
echo ": " | tr -d "\n"
./push_swap $ARG | wc -l | tr -d "[ \t]"
done

echo "\n 100 - символов"
for (( count=1; count<10; count++ ))
do
ARG=`ruby -e "puts (-40..59).to_a.shuffle.join(' ')"`
echo "-" | tr -d "\n"
echo $ARG | tr -s " " "\n" | wc -l | tr -d "[ \t\n]"
echo "-" | tr -d "\n"
if [ './push_swap $ARG | ./checker $ARG | tr -d "\n"' == "KO" ]
then
echo -en "\033[37;1;41m KO \033[0m" | tr -d "\n"
echo ": [" $ARG "] " | tr -d "\n"
else
echo -en "\033[37;1;42m OK \033[0m" | tr -d "\n"
echo ": " | tr -d "\n"
./push_swap $ARG | wc -l | tr -d "[ \t]"
fi
done

echo "\n 500 - символов"
for (( count=1; count<10; count++ ))
do
ARG=`ruby -e "puts (-240..259).to_a.shuffle.join(' ')"`
echo "-" | tr -d "\n"
echo $ARG | tr -s " " "\n" | wc -l | tr -d "[ \t\n]"
echo "-" | tr -d "\n"
echo " [ -240 .. 259 ] " | tr -d "\n"
if [ './push_swap $ARG | ./checker $ARG | tr -d "\n"' == "KO" ]
then
echo -en "\033[37;1;41m KO \033[0m" | tr -d "\n"
echo ": [" $ARG "] " | tr -d "\n"
else
echo -en "\033[37;1;42m OK \033[0m" | tr -d "\n"
echo ": " | tr -d "\n"
./push_swap $ARG | wc -l | tr -d "[ \t]"
fi
done