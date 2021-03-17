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
    func checkSpecialArgument(value:[String])->Bool{
     
        for item in value {
        if  value.contains("x") && value.count == 1  || value.contains("/") && value.count == 1 || value.contains("%") && value.count == 1 {
            return true;
        }
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
        let equationChoice = String(args[1])
        /*
        switch equationChoice {
        case "+" :
        let equation = add(no1:a!, no2: b!)
        currentResult = convert(value:equation)
        return currentResult;
            
        default: print(Error.self)
        }
     */
        
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
        var no1: [String] = [];             // stores numbers
        var sign: [String] = [];            // store arguments
        var copy: [String] = [];            // copy of the splitting in String
        var equationStart = -1              //
        let convert = args.joined()         // convert input into joined
        // splits the input by spaces into substring array
        var splitting = convert.split(separator: " ")
        // if splitting size bigger than 1
        if splitting.count > 1 {
         
          
            // loops over splitting to sort objects into different 2 arrays
            for splittings in splitting {
             //   print("Value of for loop \(splittings)")
                // sort the first argument of the equation
                if  checkValue(value: String(splittings)) {
                    no1.insert(String (splittings), at: no1.endIndex)
                    copy.insert (String (splittings), at: copy.endIndex)
                  
                }
             
                if checkArgument(value: String(splittings)) {
                    sign.insert(String(splittings), at:sign.endIndex)
                    copy.insert (String (splittings), at: copy.endIndex)
                }
       
            }
            print("array values ")
            print(no1)
            print(sign)
            print(copy)
         
     
            // calculate by looping through values
            while no1.count != 0 {
                var first:String = "";
                var second:String = "";
                var indicator:String = "";
             
              
            // find equation
                var sumFirst:String = "";
                var sumSecond:String = "";
                var sumIndicator:String = "";
            //find sum by looping over splitting
                if sumFirst.isEmpty && sumSecond.isEmpty && sumIndicator.isEmpty {
                    var position = -1
                for item in copy {
                    position+=1
                    // find first argument of equation
                    if checkValue(value: String(item)) && sumFirst.isEmpty {
                        sumFirst = String(item)
                        copy.remove(at: position)
                        position = -1
                        equationStart+=1
                    }else {
                        //find second argument of equation
                    if checkValue(value: String(item)) && sumSecond.isEmpty {
                        sumSecond = String(item)
                        copy.remove(at: position)
                        position = -1
                    }
                    }
                    print(position)
                    print(copy)
                    // find argument indicator of equation
                    if checkArgument(value: String(item)) && sumIndicator.isEmpty {
                        sumIndicator = String(item)
                        copy.remove(at: position)
                        position = -1
                        }
                    }
                }
                
         
                
                if no1.count != 0 && !sumFirst.isEmpty && !sumSecond.isEmpty && !sumIndicator.isEmpty {
                   
                    // lops over first argument of the equation
                for item in no1 {
                    if first.isEmpty && item.contains(sumFirst) {
                    first = item
                        no1.remove(at: 0)
                       // break;
                    }
                    
                }
                }
                    // if there no more items in no2 it finds arguments in no1 array
                    for item in no1 {
                        if second.isEmpty && item.contains(sumSecond)  {
                            second = item
                            no1.remove(at: 0)
                        }
                    }
                
                
                for item in sign {
                    if indicator.isEmpty && item.contains(sumIndicator){
               // indicator = String(sign.first!)
                        indicator = item
                        sign.remove(at: 0)
                    }
                }
                
                if !first.isEmpty && !indicator.isEmpty && !second.isEmpty {
                print(no1)
                print(sign)
                    // send objects for calculation
            currentResult = calculatingInput(args: [first,indicator,second])
                // check if there any numbers left in the array
                    if no1.count != 0  {
                        print(currentResult)
                    no1.insert(String(currentResult), at: 0)
                        print(equationStart)
                    copy.insert(currentResult, at: equationStart)
                        equationStart = -1
                    print("after")
                        print(copy)
                    print(no1)
                    print(sign)
                    } else {
                        return currentResult
                    }
                }
                
            }
        }
        currentResult = String(splitting[0])
        return currentResult
    }
}
