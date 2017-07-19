#!/bin/ksh
transferToSavings(){
 echo 'How much to transfer?'
 read in
 if (( $checking - $in < 0 ))
  then
   echo 'Not enough in checking!'
 else
  (( savings += $in ))
  (( checking -= $in ))
  echo 'Transaction Complete!'
 fi
  savingsBalance
  checkingBalance
 sleep 2
 clear
}

transferToChecking(){
 echo 'How much to transfer?'
 read in
 if (( $savings - $in < 0 ))
  then
   echo 'Not enough in savings!'
 else
  (( savings -= $in ))
  (( checking += $in ))
  echo 'Transaction Complete!'
 fi
  savingsBalance
  checkingBalance
 sleep 2
 clear
}

savingsBalance(){
 echo 'Savings Balance:' $savings
}

checkingBalance(){
 echo 'Checking Balance:' $checking
}

withdraw(){
 while (( 1 ))
 do
 echo 'Withdraw from'
 echo '(1) checking'
 echo '(2) savings'
 read input
 case $input in
  1)
   choice=0
   break
  ;;
  2)
   choice=1
   break
  ;;
  *)
  echo 'Invalid input, try again'
  sleep 2
  clear
 esac
 done
 echo 'How much to withdraw?'
 read money
 if (( $choice == 0 ))
  then
   if (( $checking - $money < 0 ))
    then
     echo 'Not enough money in checking'
    else
     (( checking -= $money ))
     echo 'Withdraw Complete'
   fi
   checkingBalance
  else
   if (( $savings - $money < 0 ))
    then
     echo 'Not enough money in savings'
    else
     (( savings-= $money ))
     echo 'Withdraw Complete'
   fi
   savingsBalance
 fi
 sleep 2
 clear
}

echo "*** Welcome to Cal Poly's ATM ****\n"
count=0
password=111
while (( $count <= 3 ))
 do
  if (( $count == 3 ))
   then
    echo "Too many attempts, GOODBYE"
    exit
  fi

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

while (( 1 ))
do
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
 transferToSavings
 ;;
 2)
 transferToChecking
 ;;
 3)
 savingsBalance
 sleep 2
 clear
 ;;
 4)
 checkingBalance
 sleep 2
 clear
 ;;
 5)
 withdraw
 ;;
 6)
 exit
 ;;
 *)
esac
done
