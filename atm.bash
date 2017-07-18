#!/bin/bash
echo "*** Welcome to Cal Poly's ATM ****\n"
count=0
password=111
while (( $count < 3 ))
 do
  echo Please enter your PIN
  read input
  if (( $input == $password )); then
   break
  else
  echo Invalid pin, try again
  (( count++ ))
  fi
 done

savings=1000
checking=1000

while (1)
echo "*** Welcome To Cal Poly's ATM System ***"
echo "(1) Transfer from checking account to savings account"
echo "(2) Transfer from savings account to checking account"
echo "(3) Savings account balance"
echo "(4) Checking account balance"
echo "(5) Withdraw Cash from either account"
echo "(6) Exit"
echo "==> Please select option (1-6):"
read input

case $input in
 1)
 ;;
 2)
 ;;
 3)
 ;;
 4)
 ;;
 5)
 ;;
 6)
 ;;
 *)
esac

