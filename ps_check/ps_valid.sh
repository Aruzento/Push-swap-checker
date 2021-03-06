echo "\n\t\033[33;1m Valid check: \033[0m"
echo "\n\tValid check: \n" >> ps_check/log_ps/log_checker.txt

ARG='0 1 2 3 4 5 end'
if ./push_swap "$ARG" 2>/dev/null
then
	echo "\033[37;1;41m Вывод ошибки в стандарт out\033[0m"
	exit 0
else
	if echo "ra sa " | tr -s " " "\n" | ./checker $ARG 2>/dev/null
	then
		echo "\033[37;1;41m Вывод ошибки в стандарт out\033[0m"
		exit 0
	fi
fi

echo "\033[1mStack with undigit:\033[0m"

# Валидность по неверным чарам.

# ----------
ARG='0 1 2 3 4 5 end'
# ----------

if ! ./push_swap "$ARG" 2>/dev/null
then
	echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi
if ! echo "ra sa " | tr -s " " "\n" | ./checker $ARG 2>/dev/null
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi

# ----------
ARG='O 1 2 3 4 5'
# ----------

if ! ./push_swap "$ARG" 2>/dev/null
then
	echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi
if ! echo "ra sa " | tr -s " " "\n" | ./checker $ARG 2>/dev/null
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi

# ----------
ARG="6      1 2\t3 4 5        "
# ----------
if ! ./push_swap "$ARG" 2>/dev/null
then
	echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi
if ! echo "ra sa " | tr -s " " "\n" | ./checker $ARG 2>/dev/null
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi

# ----------
ARG='one'
# ----------

if ! ./push_swap "$ARG" 2>/dev/null
then
	echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi
if ! echo "ra sa " | tr -s " " "\n" | ./checker $ARG 2>/dev/null
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi




echo "\n\n\033[1mStack with double nums:\033[0m"

# Валидность по повторам чисел

# ----------
ARG='0 0'
# ----------

if ! ./push_swap "$ARG" 2>/dev/null
then
	echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi
if ! echo "ra sa " | tr -s " " "\n" | ./checker $ARG 2>/dev/null
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi

# ----------
ARG='02 4 35 02'
# ----------

if ! ./push_swap "$ARG" 2>/dev/null
then
	echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi
if ! echo "ra sa " | tr -s " " "\n" | ./checker $ARG 2>/dev/null
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi

# ----------
ARG='0 0 0 0 0 0 0 0 0 0 0 0 0'
# ----------

if ! ./push_swap "$ARG" 2>/dev/null
then
	echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi
if ! echo "ra sa " | tr -s " " "\n" | ./checker $ARG 2>/dev/null
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi

# ----------
ARG='3947 93845 0873 30872 56 3 5464 2 5 25 3'
# ----------

if ! ./push_swap "$ARG" 2>/dev/null
then
	echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi
if ! echo "ra sa " | tr -s " " "\n" | ./checker $ARG 2>/dev/null
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi




echo "\n\n\033[1mStack with MAX-MIN_INT:\033[0m"

# Валидность по макс интам

# ----------
ARG='0 1 2 3333333333333333'
# ----------

if ! ./push_swap "$ARG" 2>/dev/null
then
	echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi
if ! echo "ra sa " | tr -s " " "\n" | ./checker $ARG 2>/dev/null
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi

# ----------
ARG='-4444444444444 1 2 3'
# ----------

if ! ./push_swap "$ARG" 2>/dev/null
then
	echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi
if ! echo "ra sa " | tr -s " " "\n" | ./checker $ARG 2>/dev/null
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi

# ----------
ARG='-2147483649 1 2 3 4 5'
# ----------

if ! ./push_swap "$ARG" 2>/dev/null
then
	echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi
if ! echo "ra sa " | tr -s " " "\n" | ./checker $ARG 2>/dev/null
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi

# ----------
ARG='3947 93845 0873 2147483648'
# ----------

if ! ./push_swap "$ARG" 2>/dev/null
then
	echo "\033[37;1;42m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi
if ! echo "ra sa " | tr -s " " "\n" | ./checker $ARG 2>/dev/null
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi


echo "\n\n\033[1mStack with MAX-MIN_INT:\033[0m"

# Валидность по макс интам

# ----------
ARG='0 1 2 3 4 5 6 7 8 9 10'
# ----------

if ! echo "rrrr sa " | tr -s " " "\n" | ./checker $ARG 2>/dev/null
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi

if ! echo "pa pa pa pa ap rr sa " | tr -s " " "\n" | ./checker $ARG 2>/dev/null
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi

if ! echo " " | tr -s " " "\n" | ./checker $ARG 2>/dev/null
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi

if ! echo "pb pa pv" | tr -s " " "\n" | ./checker $ARG 2>/dev/null
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi

if ! echo "ss sa rr rrr ra rra e" | tr -s " " "\n" | ./checker $ARG 2>/dev/null
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi

if ! echo "aaa" | tr -s " " "\n" | ./checker $ARG 2>/dev/null
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi

if ! echo "   ra" | tr -s " " "\n" | ./checker $ARG 2>/dev/null
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi

if ! echo "pb pb pb pb pb pb pb pb  e" | tr -s " " "\n" | ./checker $ARG 2>/dev/null
then
	echo "\033[37;1;44m ✓\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - OK!" >> ps_check/log_ps/log_checker.txt
else
	echo "\033[37;1;41m ×\033[0m" | tr -d "\n"
	echo "[ " $ARG " ] - KO!   <---- Check this!" >> ps_check/log_ps/log_checker.txt
fi

echo ""