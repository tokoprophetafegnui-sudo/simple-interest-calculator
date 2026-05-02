#!/bin/bash

# Simple Interest Calculator
# This script calculates simple interest based on user input
# Formula: Simple Interest = (Principal × Rate × Time) / 100

echo "================================"
echo "Simple Interest Calculator"
echo "================================"
echo ""

# Function to validate numeric input
validate_number() {
    local input=$1
    local var_name=$2
    
    if ! [[ "$input" =~ ^[0-9]+([.][0-9]{1,2})?$ ]]; then
        echo "Error: $var_name must be a valid positive number."
        return 1
    fi
    return 0
}

# Get Principal Amount
while true; do
    echo -n "Enter Principal Amount (in currency units): "
    read principal
    
    if validate_number "$principal" "Principal"; then
        break
    fi
done

# Get Rate of Interest
while true; do
    echo -n "Enter Rate of Interest (% per annum): "
    read rate
    
    if validate_number "$rate" "Rate"; then
        break
    fi
done

# Get Time Period
while true; do
    echo -n "Enter Time Period (in years): "
    read time
    
    if validate_number "$time" "Time"; then
        break
    fi
done

echo ""
echo "================================"

# Calculate Simple Interest
# Formula: SI = (P × R × T) / 100
simple_interest=$(echo "scale=2; ($principal * $rate * $time) / 100" | bc)

# Calculate Total Amount (Principal + Simple Interest)
total_amount=$(echo "scale=2; $principal + $simple_interest" | bc)

# Display Results
echo "Calculation Results:"
echo "================================"
echo "Principal Amount: $principal"
echo "Rate of Interest: $rate% per annum"
echo "Time Period: $time years"
echo "--------------------------------"
echo "Simple Interest: $simple_interest"
echo "Total Amount: $total_amount"
echo "================================"
echo ""

exit 0
