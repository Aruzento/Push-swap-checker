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
echo "\n 100 - смволов"
for (( count=1; count<10; count++ ))
do
ARG=`ruby -e "puts (-40..59).to_a.shuffle.join(' ')"`
echo "[ -40 .. 59 ] " | tr -d "\n"
./push_swap $ARG | ./checker $ARG | tr -d "\n"
echo ": " | tr -d "\n"
./push_swap $ARG | wc -l | tr -d "[ \t]"
done
echo "\n 500 - смволов"
for (( count=1; count<10; count++ ))
do
ARG=`ruby -e "puts (-240..259).to_a.shuffle.join(' ')"`
echo "-" | tr -d "\n"
echo $ARG | tr -s " " "\n" | wc -l | tr -d "[ \t\n]"
echo "-" | tr -d "\n"
echo " [ -240 .. 259 ] " | tr -d "\n"
echo "-" | tr -d "\n"
./push_swap $ARG | ./checker $ARG | tr -d "\n"
echo ": " | tr -d "\n"
./push_swap $ARG | wc -l | tr -d "[ \t]"
done