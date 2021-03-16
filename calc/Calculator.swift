//
//  Calculator.swift
//  calc
//
//  Created by Jacktator on 31/3/20.
//  Copyright © 2020 UTS. All rights reserved.
//

import Foundation

class Calculator {
    
    /// For multi-step calculation, it's helpful to persist existing result
    var currentResult = "0";
    
    
    
    /// Perform Addition
    ///
    /// - Author: Jacktator
    /// - Parameters:
    ///   - no1: First number
    ///   - no2: Second number
    /// - Returns: The addition result
    ///
    /// - Warning: The result may yield Int overflow.
    /// - SeeAlso: https://developer.apple.com/documentation/swift/int/2884663-addingreportingoverflow
    
    // equations
    func add(no1: Int, no2: Int) -> Int {
        let result=no1+no2;
        return result;
    }
    func minus(no1:Int,no2:Int)->Int{
        let result=no1-no2;
        return result;
    }
    
    func times(no1:Int,no2:Int)->Int{
        let result=no1*no2;
        return result;
        
    }
    
    func divide(no1:Int,no2:Int)->Int{
        let result=no1/no2;
        return result;
        
    }
    
    func remainder(no1:Int,no2:Int)->Int{
        let result=no1%no2;
        return result;
        
    }
    
    // convert interger to string
    func convert(value:Int)->String{
        let convert = String(value);
        return convert
    }
    
    // check if arrgument is +,-,x,/ and %
    func checkArgument(value:String)->Bool{
     
        if value.contains("+") && value.count == 1 || value.contains("-") && value.count == 1 || value.contains("x") && value.count == 1  || value.contains("/") && value.count == 1 || value.contains("%") && value.count == 1 {
            return true;
        }
        return false;
    }
    // check if the value is a number
    func checkValue(value:String)->Bool{
        if let _ = Int(value) {
            return true
        }
        return false
    }
    /*
    func removeValueArray(array:String,item:String) ->String{
        for element in array {
            
        }
        return
    }
*/
    func findSum(value:[String])->String{
        var first:String = "";
        var second:String = "";
        var argument:String = "";
        var sum:String = "";
        for item in value {
            if first.isEmpty && checkValue(value: item){
                first = String(item);
                break;
            }
            if second.isEmpty && checkValue(value: item){
                first = String(item);
                break;
            }
            
            if argument.isEmpty && checkArgument(value:String (item)){
                first = String(item);
                break;
            }
            
            // check for multiplcation,divsion and remainder equations and returns if positive
            if !first.isEmpty && !second.isEmpty && !argument.isEmpty {
                if argument.contains("x") || argument.contains("/"){
                    sum = first + argument + second
                    print(sum)
                    return sum
                }
            }
        }
     
       return sum
    }
    
    // returns the value of the calculation from input
    func calculatingInput(args: [String])->String{
        print(args);
        // variables
        // first argument
        let a = Int(args[0])
        // second argument
        let b = Int(args[2])
        // sum indicator (+ or -)
        let c = String(args[1])
     
        
        // equations
        if c == "+" {
            let equation = add(no1:a!, no2: b!)
            currentResult = convert(value:equation)
            return currentResult;
        } else {
            if c == "-"{
                let equation = minus(no1:a!, no2: b!)
                currentResult = convert(value:equation)
                return currentResult;
            } else {
                if c == "x"{
                    let equation = times(no1:a!, no2: b!)
                    currentResult = convert(value:equation)
                    return currentResult;
                } else {
                    if c == "%"{
                        let equation = remainder(no1:a!, no2: b!)
                        currentResult = convert(value:equation)
                        return currentResult;
                    } else {
                        if c == "/"{
                            let equation = divide(no1:a!, no2: b!)
                            currentResult = convert(value:equation)
                            return currentResult;
                        }
                    }
                }
                
            }
        }
        
    

        
        return currentResult
    }
    
   

    func calculate(args: [String]) -> String {
        var no1: [String] = [];
        var sign: [String] = [];
        var no2: [String] = [];
        let convert = args.joined()
        print (convert)
        let splitting = convert.split(separator: " ")
        print(args)
        print(splitting)
        // if the splitting has more than 3 objects aka e.g 3 + 4 x 5
        if splitting.count > 3 {
            
           
           // equation makeup
            var arg1:String = "" ;
            var arrangement:String = "";
            var arg2:String = "";
            
          
            // loops over splitting to sort objects into different arrays
            for splittings in splitting {
                print("Value of for loop \(splittings)")
              //  let characters = splittings.count
               // print(characters)
                // sort the first argument of the equation
                if arg1.isEmpty && checkValue(value: String(splittings)) {
                    no1.insert(String (splittings), at: no1.endIndex)
                    arg1 = String(no1.last!)
                 
                } else
                {
                    // sort the second arrangement
                    if arg2.isEmpty && checkValue(value: String(splittings)){
                        no2.insert(String(splittings), at: no2.endIndex)
                        arg2 = String(no2.last!)
                    }
                    
                    
                }
                print(" value of in for loop \(splittings)")
                
                // sort arguments into sign array
                if checkArgument(value: String(splittings)) {
                    
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
                var first:String = "";
                var second:String = "";
                var indicator:String = "";
                
                if no1.count != 0 {
                    // lops over first argument array
                for item in no1 {
                    if first.isEmpty && !item.contains(first) {
                    first = item
                        no1.remove(at: 0)
                       // break;
                    }
                    
                }
                }
                if no2.count != 0 {
                    // loops over second argument array
                    for item in no2 {
                        if second.isEmpty && !item.contains(second) {
                            second = item
                            no2.remove(at: 0)
                        //    break;
                        }
                        
                    }
                } else {
                    // if there no more items in no2 it finds arguments in no1 array
                    for item in no1 {
                        if second.isEmpty  {
                            second = item
                            no1.remove(at: 0)
                        }
                    }
                }
            
                indicator = String(sign.first!)
       
               
                if !first.isEmpty && !indicator.isEmpty && !second.isEmpty {

                sign.remove(at: 0)
                print(no1)
                print(no2)
                print(sign)
            currentResult = calculatingInput(args: [first,indicator,second])

                
                    if no1.count != 0  {
                        print(currentResult)
                    no1.insert(String(currentResult), at: 0)
                    print("after")
                    print(no1)
                    print(no2)
                    print(sign)
                }
                }
                
            }
          
            
            
          
            
            
            
            
        } else {
         
        // stores splitting objects into different arrays
            no1.append(String(splitting[0]))
            no2.append(String(splitting[2]))
            sign.append(String(splitting[1]))
        // retrieve object from arrays
        let first = String(no1.first!)
        let second = String(no2.first!)
        let indicator = String(sign.first!)
        currentResult = calculatingInput(args: [first,indicator,second])

    
}
        return currentResult
    }
}
