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
let no1 = args[0]; // Sample Code Only! Update Required!
//let operator = args[1]; // Sample Code Only! Update Required!
let sign=args[1];
let no2 = args[2]; // Sample Code Only! Update Required!


// Initialize a Calculator object
let calculator = Calculator();
// input equation
let read = readLine()
let convert = String(read!)



//split string and sort
let splitting = convert.split(separator: " ")
print(splitting);
let a = String(splitting[0])
let b = String(splitting[1])
let c = String(splitting[2])

// Calculate the result
let test = calculator.calculate(args:[a,b,c]);


print(" The result is \(test)")



