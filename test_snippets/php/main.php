<?php

// Single line comment
/*
    Multi-line comment
*/

// Base Types Examples
$number = 42;  // int
$string = "Hello, PHP!";  // string
$boolean = true;  // boolean
$nullValue = null;  // null
$listExample = [1, 2, 3];  // array
$dictExample = ["key" => "value"];  // associative array
$functionExample = fn($x) => $x * 2;  // arrow function (since PHP 7.4)

// Control Structures

// if-then-else
if ($number < 100) {
    echo "Number is less than 100";
} elseif ($number == 100) {
    echo "Number is 100";
} else {
    echo "Number is greater than 100";
}

// while loop
$i = 1;
while ($i <= 5) {
    echo "While loop iteration: $i";
    $i++;
}

// for loop
for ($j = 1; $j <= 5; $j++) {
    echo "For loop iteration: $j";
}

// Function
function greet(string $name): void {
    echo "Hello, $name";
}

greet("PHP user");

// Type Hints in Class Methods
class Stack {
    public function push($item) {
        return $item;
    }

    public function pop() {
        // Implementation here
    }
}

// Associative array with type hints using PHPDoc (PHP does not support generic type hints like Python)
/** @var array<string, int> */
$nameToAge = ['Alice' => 30, 'Bob' => 25];

// Array with type hints using PHPDoc
/** @var string[] */
$names = ['Alice', 'Bob', 'Charlie'];

?>

