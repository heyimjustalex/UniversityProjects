print("NWD Kalkulator\n")
a: int = int(input("Enter first number: "))
b: int = int(input("Enter second number: "))

while a != b:
    if a > b:
        a = a - b
    else:
        b = b - a

print(b)
