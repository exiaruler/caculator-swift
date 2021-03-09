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
    var currentResult = 0;
    
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
    
   


    
    
    /*
    func getResult(i:Int)->Int{
       // var value=i=currentResult;
        return value;
    }
    */
    func calculate(args: [String]) -> String {
        // Todo: Calculate Result from the arguments. Replace dummyResult with your actual result;
       
        print(args);
        let a = Int(args[0])
        let b = Int(args[2])
        let c = String(args[1])
        var result = "0";
        
        if c == "+" {
            let equation = add(no1:a!, no2: b!)
            result = convert(value:equation)
            return result;
        } else {
            if c == "-"{
                let equation = minus(no1:a!, no2: b!)
                result = convert(value:equation)
                return result;
            } else {
                if c == "x"{
                    let equation = times(no1:a!, no2: b!)
                    result = convert(value:equation)
                    return result;
                } else {
                    if c == "%"{
                        let equation = remainder(no1:a!, no2: b!)
                        result = convert(value:equation)
                        return result;
                    }
                }
                
            }
        }
        
    

        
        return result
    }
}
