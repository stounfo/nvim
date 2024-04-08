// Commenting: Single line and multi-line comments
// Single line comment
/*
    Multi-line comment
*/

fn main() {
    // Variable Declarations
    let immutable_number: i32 = 42; // Immutable integer
    let mut mutable_number: i32 = 42; // Mutable integer
    mutable_number += 1; // Mutating the value

    let floating_point: f64 = 3.14; // Floating-point number
    let boolean_value: bool = true; // Boolean
    let character: char = 'A'; // Character
    let tuple_example: (i32, f64) = (42, 2.718); // Tuple
    let array_example: [i32; 3] = [1, 2, 3]; // Array

    println!("Hello, Rust!");

    // if-else control structure
    if immutable_number < 100 {
        println!("Number is less than 100");
    } else {
        println!("Number is 100 or more");
    }

    // Looping with 'loop'
    let mut count = 0;
    loop {
        count += 1;
        if count == 5 {
            println!("loop iteration: {}", count);
            break;
        }
    }

    // Looping with 'while'
    while count > 0 {
        println!("while iteration: {}", count);
        count -= 1;
    }

    // Looping with 'for'
    for number in array_example.iter() {
        println!("for iteration: {}", number);
    }

    // Using Enums
    #[derive(Debug)]
    enum WebEvent {
        PageLoad,
        PageUnload,
        KeyPress(char),
        Paste(String),
        Click { x: i64, y: i64 },
    }

    let pressed = WebEvent::KeyPress('x');
    println!("{:?}", pressed);

    // Using Structs
    struct Point {
        x: f32,
        y: f32,
    }

    let start = Point { x: 0.0, y: 0.0 };

    // Function with parameters
    fn add_one(x: i32) -> i32 {
        x + 1
    }

    let six = add_one(5);
    println!("Six: {}", six);

    // Generics and Traits
    fn largest<T: PartialOrd + Copy>(list: &[T]) -> T {
        let mut largest = list[0];
        for &item in list.iter() {
            if item > largest {
                largest = item;
            }
        }
        largest
    }

    let numbers = vec![34, 50, 25, 100, 65];
    println!("The largest number is {}", largest(&numbers));

    // Implementing Methods
    impl Point {
        fn distance_from_origin(&self) -> f32 {
            (self.x.powi(2) + self.y.powi(2)).sqrt()
        }
    }

    println!("Distance from origin: {}", start.distance_from_origin());
}
