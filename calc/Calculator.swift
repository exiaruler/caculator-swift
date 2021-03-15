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
        // Todo: Calculate Result from the arguments. Replace dummyResult with your actual result;
       
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
}
