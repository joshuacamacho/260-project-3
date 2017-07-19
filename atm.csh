#!/bin/csh
echo "*** Welcome to Cal Poly's ATM ****\n"
@ count=0
set password=111
while ( $count <= 3 )
  if ( $count == 3 ) then
    echo "Too many attempts, GOODBYE"
    exit
  endif

  echo Please enter your PIN
  set input = $<
  if ( $input == $password ) then
   break
  else
  echo Invalid pin, try again
  @ count = $count + 1
  endif
end

@ savings=1000
@ checking=1000

while ( 1 )
echo "*** Welcome To Cal Poly's ATM System ***"
echo "(1) Transfer from checking account to savings account"
echo "(2) Transfer from savings account to checking account"
echo "(3) Savings account balance"
echo "(4) Checking account balance"
echo "(5) Withdraw Cash from either account"
echo "(6) Exit"
echo "==> Please select option (1-6):"
set input = $<

switch ($input)
 case "1":
 echo 'How much to transfer?'
 set in = $<
 if ( $checking - $in < 0 ) then
   echo 'Not enough in checking!'
 else
  @ savings = $savings + $in
  @ checking = $checking - $in
  echo 'Transaction Complete!'
 endif
  echo 'Savings Balance:' $savings
  echo 'Checking Balance:' $checking
 sleep 2
 clear
 breaksw

 case "2":
 echo 'How much to transfer?'
 set in = $<
 if ( $savings - $in < 0 ) then
   echo 'Not enough in savings!'
 else
  @ savings = $savings - $in
  @ checking = $checking + $in
  echo 'Transaction Complete!'
 endif
  echo 'Savings Balance:' $savings
  echo 'Checking Balance:' $checking
 sleep 2
 clear
 breaksw
 
 case "3":
 echo 'Savings Balance:' $savings 
 sleep 2
 clear
 breaksw
 case "4": 
 echo 'Checking Balance:' $checking
 sleep 2
 clear
 breaksw
 
 case "5":
 while ( 1 )
 echo 'Withdraw from'
 echo '(1) checking'
 echo '(2) savings'
 set input = $<
 switch ($input)
  case "1":
   set choice=0
   break
  case "2":
   set choice=1
   break
  
  default:
  echo 'Invalid input, try again'
  sleep 2
  clear
endsw
end
 echo 'How much to withdraw?'
 set money = $<
 if ( $choice == 0 ) then
   if ( $checking - $money < 0 ) then
     echo 'Not enough money in checking'
    else
     @ checking = $checking - $money
     echo 'Withdraw Complete'
   endif
 echo 'Checking Balance:' $checking
  else
   if ( $savings - $money < 0 ) then
     echo 'Not enough money in savings'
    else
     @ savings = $savings - $money
     echo 'Withdraw Complete'
   endif
   echo 'Savings Balance:' $savings
 endif
 sleep 2
 clear

 breaksw
 case "6":
 exit
 
 default:
endsw
end
