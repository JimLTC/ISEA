#!/bin/bash

# If statement example
if [ -f myscript.sh ]; then
    echo "myscript.sh exists!"
else
    echo "File not found"
fi

# For loop example
for i in 1 2 3 4 5
do
    echo "Loop number $i"
done
