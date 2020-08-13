echo "\033[33;1m author: \033[0m" | tr -d "\n"
cat -e author
echo ""
echo "\n\t\033[33;1m Norme check: \033[0m"
echo "\n\tNorme check: \n" >> log_checker.txt
norminette * > tmp.ps
num=$(cat tmp.ps | grep "Error" | wc -l | tr -d "[ \t]");
echo "Errors: " | tr -d "\n"
if (( num == 0 ))
then
	echo "\033[37;1;42m✓\033[0m"
	echo "\nNo errors\n" >> log_checker.txt
else
	echo "\033[37;1;41m"$num"\033[0m"
	norminette * | grep "Error" >> log_checker.txt
fi
norminette * > tmp.ps
num=$(cat tmp.ps | grep "Warning: " | wc -l | tr -d "[ \t]");
echo "Warnings: " | tr -d "\n"
if (( num == 0 ))
then
	echo "\033[37;1;42m✓\033[0m"
	echo "\nNo warnings\n" >> log_checker.txt
else
	echo "\033[37;1;41m"$num"\033[0m"
	norminette * | grep "Warning: " >> log_checker.txt
fi
rm -rf tmp.ps