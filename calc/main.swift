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
var testResult = "";
// Initialize a Calculator object
let calculator = Calculator();
 


// input equation
let read = readLine()

//split string into an array
let splitting = read!.split(separator: " ")
print(splitting);
//print(splitting.count)

func findValue(){
    var first:String = "";
    var second:String = "";
    if no1.count != 0 {
    for item in no1 {
        if first.isEmpty && !item.contains(first) {
        first = item
            break;
        }
        
    }
    }else {
        for item in no2 {
            if second.isEmpty && !item.contains(second) {
                second = item
                break;
            }
            
        }
    }

    
}


// if the splitting has more than 3 objects aka e.g 3 + 4 x 5
if splitting.count > 3 {
    
   
   // equation makeup
    var arg1:String = "" ;
    var arrangement:String = "";
    var arg2:String = "";
    
  
    // loops over splitting to sort objects into different arrays 
    for splittings in splitting {
        print("Value of for loop \(splittings)")
      
        // sort the first argument of the equation
        if arg1.isEmpty && !splittings.contains("+") && !splittings.contains("-")  {
            no1.insert(String(splittings), at: no1.endIndex)
            arg1 = String(no1.last!)
         
        } else
        {
            // sort the second arrangement
            if arg2.isEmpty && !splittings.contains("+") && !splittings.contains("-"){
                no2.insert(String(splittings), at: no2.endIndex)
                arg2 = String(no2.last!)
            }
            
            
        }
        print(" value of in for loop \(splittings)")
        
        // sort arguments into sign array
        if splittings.contains("+")||splittings.contains("-")||splittings.contains("/")||splittings.contains("x")||splittings.contains("%") {
            
            sign.insert(String(splittings), at:sign.endIndex)
            arrangement = String(sign.last!)
          
            
        }
        
        // check if there values in the equation make up
        // clear value of the equation make
        if !arg1.isEmpty && !arg2.isEmpty && !arrangement.isEmpty {
            print("true \(arg1) \(arrangement) \(arg2)")
            arg1 = ""
            arg2 = ""
            arrangement = ""
            print(arg1 + arrangement + arg2)
            
        }
       
        
        
        //print(arg1)
       // print(arg2)
       // print(arrangement)
        print("array values ")
        print(no1)
        print (no2)
        print(sign)
 
     
    }
    // calculate by looping through values
    while no1.count != 0 {
       // let first = String(no1.first!)
        //let second = String(no2.first!)
        var first:String = "";
        var second:String = "";
        if no1.count != 0 {
        for item in no1 {
            if first.isEmpty && !item.contains(first) {
            first = item
                no1.remove(at: 0)
               // break;
            }
            
        }
        }
        if no2.count != 0 {
            for item in no2 {
                if second.isEmpty && !item.contains(second) {
                    second = item
                    no2.remove(at: 0)
                //    break;
                }
                
            }
        } else {
            for item in no1 {
                if second.isEmpty  {
                    second = item
                    no1.remove(at: 0)
                }
            }
        }
        
        let indicator = String(sign.first!)
        if !first.isEmpty && !indicator.isEmpty && !second.isEmpty {
       // no1.remove(at: 0)
        //no2.remove(at: 0)
        sign.remove(at: 0)
        print(no1)
        print(no2)
        print(sign)
        testResult = calculator.calculate(args:[first,indicator,second]);
        
            if no1.count != 0  {
            no1.insert(String(testResult), at: no1.endIndex)
            print("after")
            print(no1)
            print(no2)
            print(sign)
        }
        }
        
    }
    print(testResult)
    
    
  
    
    
    
    
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



