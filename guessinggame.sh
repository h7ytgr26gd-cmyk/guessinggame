
#!/bin/bash

# Function to count files
count_files() {
    find . -maxdepth 1 -type f | wc -l | tr -d ' '
}

# Function to check the answer
check_guess() {
    if [ "$guess" -lt "$correct" ]; then
        echo "Your guess is too low!"
    elif [ "$guess" -gt "$correct" ]; then
        echo "Your guess is too high!"
    else
        echo "Congratulations! You guessed correctly!"
    fi
}

# Get the correct number of files
correct=$(count_files)
guess=0

echo "Welcome to the Guessing Game!"
echo "How many files are in this directory?"

# Keep asking until the answer is correct
while [ "$guess" -ne "$correct" ]; do
    read -p "Enter your guess: " guess

    if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
        echo "Please enter a valid number!"
        guess=0
    else
        check_guess
    fi
done

echo "Game finished!"
