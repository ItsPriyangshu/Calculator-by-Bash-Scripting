#!/bin/bash

<<subject
Calculator App
subject


function calculator_app() {

read -p "Write the First Number: " num1
while [[ ! $num1 =~ ^-?[0-9]+$ ]]
do
	echo "Please input an integer"
	read -p "Write the First Number: " num1
done

read -p "Write the Second Number: " num2
while [[ ! $num2 =~ ^-?[0-9]+$ ]] 
do
	echo "Please input an integer"
	read -p "Write the Seconf Number: " num2
done

read -p "Chhose an operand(+,-,*,/,^): " op

if [[ $op == "+" ]];
then
	ans=$(($num1 + $num2))
elif [[ $op == "-" ]];
then
	ans=$(($num1 - $num2))
elif [[ $op == "*" ]];
then
	ans=$(($num1 * $num2))	
elif [[ $op == "/" ]];
then
	if [[ $num2 == 0 ]];
	then
		echo "You Can't divide by zero. Try Again"
		exit 1
	fi
	ans=$(($num1 / $num2))
elif [[ $op == "^" ]];
then
	ans=$(($num1 ** $num2))
else
	echo "Invalid Operator"
	exit 1
fi

echo "Your Result is $ans"

if [[ $op == "*" ]]; then
	echo ">> $num1 x $num2 = $ans" >> All_history.ansh
else
	echo ">>  $num1 $op $num2 = $ans" >> All_history.ansh
fi
}







read -p "Welcome! Do You Want to Start(y/n)? " go
if [[ $go == "y" || $go == "Y" ]]; 
then
	echo ""
	calculator_app
	num=0
	while [[ $num -eq 0 ]]
	do
		read -p "Do you Want to Continue(y/n)? " new
		if [[ $new == "y" || $new == "Y" ]];
		then
			echo ""
			calculator_app
		else
			echo "Thanks for Trusting Us..."
			echo ""
			exit 1
		fi
	done
else
	echo "Mission Aborted..."
	echo ""
fi


