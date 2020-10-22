#!/bin/bash 
echo " Wellcome flip coin simulator "

#CONSTANT
isHEAD=0
NUMBER_OF_COIN=3

#TO DECLARE DICTIONARY
declare -A tripletFlip

#TO USER INPUT
read -p "Enter the Number of Coin Flip : " numberOfCoinFlip

#TO FUNCTION TRIPLET
function triplet()
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
		((tripletFlip[$coinSide]++))
		coinSide=""
	done
}

#TO TOTAL PERCENTAGE OF TRIPLET COMBINATION
function totalTripletPercentage()
{
   for index in ${!tripletFlip[@]}
   do
      tripletFlip[$index]=`awk 'BEGIN{printf("%0.2f", '${tripletFlip[$index]}' * 100 / '$numberOfCoinFlip' )}'`
   done

}

#TO FUNCTION CALL 
triplet
totalTripletPercentage
echo "  " ${!tripletFlip[@]}
echo ${tripletFlip[@]}
