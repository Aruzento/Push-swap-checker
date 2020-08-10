echo "\n\tCorrection check:" >> ps_check/log_ps/log_checker.txt
echo "\t\033[33;1m Correction list: \033[0m\n"


echo "\033[1mChecker program - False tests:\033[0m"
echo "\nChecker program - False tests:" >> ps_check/log_ps/log_checker.txt
echo "[0 9 1 8 2 7 3 6 4 5]:" >> ps_check/log_ps/log_checker.txt
ARG='0 9 1 8 2 7 3 6 4 5'
err=$(echo "sa pb rrr " | tr -s " " "\n" | ./checker $ARG | tr -d "\n")
echo ""
echo "[ sa, pb, rrr ]:\t" | tr -d "\n"
if [ $err == "KO" ]
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	echo "[ sa, pb, rrr ]\t\t\t- OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ sa, pb, rrr ]\t\t\t- KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi
err=$(echo "pb pb rrr " | tr -s " " "\n" | ./checker $ARG | tr -d "\n")
echo ""
echo "[ pb, pb, rrr ]:\t" | tr -d "\n" 
if [ $err == "KO" ]
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	echo "[ pb, pb, rrr ]\t\t\t- OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ pb, pb, rrr ]\t\t\t- KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi
err=$(echo "ra rra ra rrr rrr " | tr -s " " "\n" | ./checker $ARG | tr -d "\n")
echo ""
echo "[ ra rra ra rrr rrr ]:\t" | tr -d "\n" 
if [ $err == "KO" ]
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	echo "[ ra rra ra rrr rrr ]\t- OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ ra rra ra rrr rrr ]\t- KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi
err=$(echo "pb pb pb " | tr -s " " "\n" | ./checker $ARG | tr -d "\n")
echo ""
echo "[ pb pb pb ]:\t\t" | tr -d "\n" 
if [ $err == "KO" ]
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	echo "[ pb pb pb ]\t\t\t- OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ pb pb pb ]\t\t\t- KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi
echo ""


# ------------------


echo "\n\033[1mChecker program - Right tests:\033[0m\n"
echo "\nChecker program - Right tests:" >> ps_check/log_ps/log_checker.txt
echo "[0 1 2]:" >> ps_check/log_ps/log_checker.txt
ARG='0 1 2'
err=$(./push_swap | ./checker $ARG | tr -d "\n")
echo "[ NO ARG ]:\t\t" | tr -d "\n"
if [ $err == "OK" ]
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	echo "[ sa, pb, rrr ]\t\t\t- OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ sa, pb, rrr ]\t\t\t- KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi
ARG='0 9 1 8 2 7 3 6 4 5'
err=$(./push_swap $ARG | ./checker $ARG | tr -d "\n")
echo ""
echo "["$ARG"]:\t" | tr -d "\n" 
if [ $err == "OK" ]
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	echo "[ ARG ]\t\t\t- OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ ARG ]\t\t\t- KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi
ARG='0 9 1 8 2'
err=$(echo "pb ra pb ra sa ra pa pa " | tr -s " " "\n" | ./checker $ARG | tr -d "\n")
echo ""
echo "["$ARG"]+[pb..pa]:\t" | tr -d "\n" 
if [ $err == "OK" ]
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	echo "[ ra rra ra rrr rrr ]\t- OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ ra rra ra rrr rrr ]\t- KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi
err=$(./push_swap $ARG | ./checker $ARG | tr -d "\n")
echo ""
echo "["$ARG"]:\t\t" | tr -d "\n" 
if [ $err == "OK" ]
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	echo "[ pb pb pb ]\t\t\t- OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ pb pb pb ]\t\t\t- KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi
echo ""


# ------------------


echo "\n\033[1mPush_swap program - Identity tests:\033[0m\n"
echo "\nChecker program - Identity tests:" >> ps_check/log_ps/log_checker.txt
echo "[42]:" >> ps_check/log_ps/log_checker.txt
ARG='42'
err=$(./push_swap $ARG | wc -l | tr -d "[ \t]")
echo "'42' [ NO ARG ]:\t" | tr -d "\n"
if (( err == 0 ))
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	echo "[ 42 ]\t\t\t- OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ 42 ]\t\t\t- KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi
echo ""
ARG='0 1 2 3'
err=$(./push_swap $ARG | wc -l | tr -d "[ \t]")
echo "'0..3' [ NO ARG ]:\t" | tr -d "\n"
if (( err == 0 ))
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	echo "[ 42 ]\t\t\t- OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ 42 ]\t\t\t- KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi
echo ""
ARG='0 1 2 3 4 5 6 7 8 9'
err=$(./push_swap $ARG | wc -l | tr -d "[ \t]")
echo "'0..9' [ NO ARG ]:\t" | tr -d "\n"
if (( err == 0 ))
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	echo "[ 42 ]\t\t\t- OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ 42 ]\t\t\t- KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi
echo ""