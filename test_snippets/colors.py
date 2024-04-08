# Define the color codes
colors = {
    "Black": "0",
    "Red": "1",
    "Green": "2",
    "Yellow": "3",
    "Blue": "4",
    "Magenta": "5",
    "Cyan": "6",
    "White": "7"
}

print("Displaying the 16 basic ANSI colors:")

# Iterate over the colors to display them
for color, code in colors.items():
    # Normal foreground
    print(f"\033[3{code}m{color}\033[0m ", end='')
    # Bright foreground
    print(f"\033[3{code};1m{color} (Bright)\033[0m ", end='')
    # Normal background
    print(f"\033[4{code}m {color} Background \033[0m ", end='')
    # Bright background
    print(f"\033[4{code};1m {color} Background (Bright)\033[0m")

print("\nResetting colors to default.")

