#!/bin/bash 
echo " Wellcome flip coin simulator "

#CONSTANT
isHEAD=0
NUMBER_OF_COIN=2

#TO DECLARE DICTIONARY
declare -A doubletFlip

#TO USER INPUT
read -p "Enter the Number of Coin Flip : " numberOfCoinFlip

#TO FUNCTION DOUBLET
function doublet()
{
   for(( count=0; count<$numberOfCoinFlip; count++ ))
   do
      for(( countCoin=0; countCoin<$NUMBER_OF_COIN; countCoin++ ))
      do
         flipCoin=$(( RANDOM % 2 ))

         if [ $flipCoin -eq $isHEAD ]
         then
            coinSide+=H
         else
            coinSide+=T
         fi
		done
		((doubletFlip[$coinSide]++))
		coinSide=""
	done
}

#TO TOTAL PERCENTAGE OF DOUBLET COMBINATION
function totalDoubletPercentage()
{
   for index in ${!doubletFlip[@]}
   do
      doubletFlip[$index]=`awk 'BEGIN{printf("%0.2f", '${doubletFlip[$index]}' * 100 / '$numberOfCoinFlip' )}'`
   done
}

#TO FUNCTION CALL 
doublet
totalDoubletPercentage
echo "  " ${!doubletFlip[@]}
echo ${doubletFlip[@]}
