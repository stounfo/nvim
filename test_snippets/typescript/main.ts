// Commenting: Single line and multi-line comments
// Single line comment
/*
    Multi-line comment
*/

// Base Types Examples
let number: number = 42; // Number
let string: string = "Hello, TypeScript!"; // String
let boolean: boolean = true; // Boolean
let nullValue: null = null; // Null
let undefinedValue: undefined = undefined; // Undefined
let array: number[] = [1, 2, 3]; // Array
let tuple: [string, number] = ["tuple", 42]; // Tuple
let anyType: any = "Can be anything"; // Any

// Enum
enum Color {
  Red,
  Green,
  Blue,
}
let color: Color = Color.Green;

// Control Structures

// if-then-else
if (number < 100) {
  console.log("Number is less than 100");
} else if (number === 100) {
  console.log("Number is 100");
} else {
  console.log("Number is greater than 100");
}

// for loop
for (let i = 0; i < 5; i++) {
  console.log("For loop iteration:", i);
}

// while loop
let i: number = 5;
while (i > 0) {
  console.log("While loop iteration:", i);
  i--;
}

// Functions with type annotations
function greet(name: string): void {
  console.log("Hello, " + name);
}
greet("TypeScript user");

// Interfaces
interface Person {
  name: string;
  age: number;
}

// Implementing an interface
let person: Person = { name: "John Doe", age: 30 };
console.log(person.name, person.age);

// Classes
class Animal {
  name: string;
  constructor(name: string) {
    this.name = name;
  }
  move(distanceInMeters: number = 0): void {
    console.log(`${this.name} moved ${distanceInMeters}m.`);
  }
}

// Generics
function identity<T>(arg: T): T {
  return arg;
}

let output = identity<string>("myString"); // output will be of type 'string'
console.log(output);

// Example usage of Generics with an interface
interface GenericIdentityFn<T> {
  (arg: T): T;
}

function identityFunction<T>(arg: T): T {
  return arg;
}

let myIdentity: GenericIdentityFn<number> = identityFunction;
