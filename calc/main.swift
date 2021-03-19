//
//  main.swift
//  calc
//
//  Created by Jesse Clark on 12/3/18.
//  Copyright © 2018 UTS. All rights reserved.
//

import Foundation

// terminal input
var args = ProcessInfo.processInfo.arguments
args.removeFirst() // remove the name of the program


// Initialize a Calculator object
let calculator = Calculator();
let validation = Validation();

// validate args before conversion 
try validation.validateInput(values: args) 
    // turn array to String to input
    let input = args.joined(separator: " ")
    // Calculate the result
    let result = calculator.calculate(args:[input]);

    print(result)









