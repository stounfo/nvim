# Commenting: Single line and multi-line comments
# Single line comment
'''
    Multi-line comment
'''

# Base Types Examples
number = 42  # int
string = "Hello, Python!"  # str
boolean = True  # bool
none_value = None  # NoneType
list_example = [1, 2, 3]  # list
tuple_example = (1, 2, 3)  # tuple
set_example = {1, 2, 3}  # set
dict_example = {"key": "value"}  # dict
function_example = lambda x: x * 2  # function

# Control Structures

# if-then-else
if number < 100:
    print("Number is less than 100")
elif number == 100:
    print("Number is 100")
else:
    print("Number is greater than 100")

# while loop
i = 1
while i <= 5:
    print("While loop iteration:", i)
    i += 1

# for loop
for j in range(1, 6):
    print("For loop iteration:", j)

# Functions with Type Hints
def greet(name: str) -> None:
    print(f"Hello, {name}")

greet("Python user")

# Using Python 3.12 Generics and Type Hints
class Stack:
    def push[T](self, item: T) -> T:
        return item

    def pop(self): ...

type A = int


# Dict with type hints
from typing import Dict

name_to_age: Dict[str, int] = {'Alice': 30, 'Bob': 25}

# List with type hints
from typing import List

names: List[str] = ['Alice', 'Bob', 'Charlie']

