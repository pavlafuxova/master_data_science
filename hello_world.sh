#!/bin/bash
# declare STRING variable
STRING="Hello World"
#print variable on a screen
echo $STRING

#!/bin/bash
# Declare String S1
S1="cat"
#Declare String S2
S2="dog"
if [ $S1 = $S2 ]; then
    echo "Both strings are equal"
else
    echo "Strings are not equal"
fi

