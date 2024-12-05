#!/usr/local/bin/python3

hours = int(input("Enter Hours Worked Per Week: "))
wage = float(input("Enter Wage: "))
tax = .13

checking = (hours * 4) * wage
checking -= checking * tax
savings = checking / 2
checking -= savings

miles = 830
mpg = float(input("Enter Gas Milage: "))
gasPrice = float(input("Enter Gas Price: "))

gas = (miles / mpg) * gasPrice

expenses = gas + 10

checking -= expenses

print(f"${checking+savings:,.2f} left over total\n${checking:,.2f} left over for checking each month\n${savings:,.2f} left over for savings each month\nCost of gas: ${gas:,.2f}")
