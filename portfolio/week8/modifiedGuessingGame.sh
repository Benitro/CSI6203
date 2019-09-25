#!/bin/bash

sed -i '/echo .*".*!"/ s/Correct/Right/' ../week6/guessingGame.sh

sed -rn 's/echo.*"(.*)"/\1/p' ../week6/*.sh> output.txt