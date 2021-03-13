//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program

// Retrieve User Input
//let no1 = args[0]; // Sample Code Only! Update Required!
//let operator = args[1]; // Sample Code Only! Update Required!
//let sign=args[1];
//let no2 = args[2]; // Sample Code Only! Update Required!

var no1: [String] = [];
var sign: [String] = [];
var no2: [String] = [];

// Initialize a Calculator object
let calculator = Calculator();
 

func checkNumber (input: String )->Bool{
    let convert = Int(input);
    if convert == nil {
        return true;
    } else {
    return false;
    }
}
// input equation
let read = readLine()
let convert = String(read!)

//split string into an array
let splitting = read!.split(separator: " ")
print(splitting);
//print(splitting.count)


// if the splitting has more than 3 objects aka e.g 3 + 4 x 5
if splitting.count > 3 {
  
 
  
    // loops over splitting to sort objects into different arrays 
    for splittings in splitting{
        print("Value of for loop \(splitting)")
      
        if no1.isEmpty {
            no1.insert(String(splittings), at: no1.endIndex)
        }
        print(" value of in for loop \(splittings)")
        // sort arguments into sign array
        if splittings.contains("+")||splittings.contains("-")||splittings.contains("/")||splittings.contains("x")||splittings.contains("%") {
            
            sign.insert(String(splittings), at:sign.endIndex)
            
        }
        
        if splittings.contains("2"){
            no2.insert(String(splittings), at: no2.endIndex)
        }
        print(no1)
        print (no2)
        print(sign)
      /*
       // calculates multiply,division and remainder first
       if splitting.contains("x , / , %"){
        let a:String;
        let b:String;
        var arg:String;
           // find an equation that contains multiply,division and remainder
        for find in splitting {
            
            
        }
       }
    */

        
    }
    
    
    
} else {
 
// stores splitting objects into different arrays
no1.insert(String(splitting[0]), at: no1.endIndex)
no2.insert(String(splitting[2]) , at: no2.endIndex)
sign.insert(String(splitting[1]) , at: sign.endIndex)
// retrieve object from arrays
let first = String(no1.first!)
let second = String(no2.first!)
let indicator = String(sign.first!)


// Calculate the result
let result = calculator.calculate(args:[first,indicator,second]);


//print(" The result is \(result)")
print(result)
}



