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
    // check array for x,/ and %
    func checkSpecialArgument(value:Array<String>)->Bool{
     
        for item in value {
        if  item.contains("x") && item.count == 1  || item.contains("/") && item.count == 1 || item.contains("%") && value.count == 1 {
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
        // variables
        // first argument
        let a = Int(args[0])
        // second argument
        let b = Int(args[2])
        // sum indicator (+ or -)
        let c = String(args[1])
        let equationChoice = String(args[1])
        
        // equations to use
        switch equationChoice {
        case "+" :
        let equation = add(no1:a!, no2: b!)
        currentResult = convert(value:equation)
        return currentResult;
            
        case "-" : let equation = minus(no1:a!, no2: b!)
            currentResult = convert(value:equation)
            return currentResult;
            
        case "x": let equation = times(no1:a!, no2: b!)
            currentResult = convert(value:equation)
            return currentResult;
            
        case "%" : let equation = remainder(no1:a!, no2: b!)
            currentResult = convert(value:equation)
            return currentResult;
            
        case "/" :  let equation = divide(no1:a!, no2: b!)
            currentResult = convert(value:equation)
            return currentResult;
            
            
        default: print(Error.self)
        }
     
        return currentResult
    }
    
   

    func calculate(args: [String]) -> String {
        var numbers: [String] = [];             // stores numbers
        var sign: [String] = [];            // store arguments
        var copy: [String] = [];            // copy of the splitting in String
        var equationStart = -1              //
        let convert = args.joined()         // convert input into joined
        // splits the input by spaces into substring array
        let splitting = convert.split(separator: " ")
        // if splitting size bigger than 1
        if splitting.count > 1 {
     
          
            // loops over splitting to sort objects into different 2 arrays
            for splittings in splitting {
                // sort the first argument of the equation
                if  checkValue(value: String(splittings)) {
                    numbers.insert(String (splittings), at: numbers.endIndex)
                    copy.insert (String (splittings), at: copy.endIndex)
                  
                }
             
                if checkArgument(value: String(splittings)) {
                    sign.insert(String(splittings), at:sign.endIndex)
                    copy.insert (String (splittings), at: copy.endIndex)
                }
       
            }
         
         
     
            // calculate by looping through values
            while numbers.count != 0 {
                
                var first:String = "";
                var second:String = "";
                var indicator:String = "";
                
            // find equation
                var sumFirst:String = "";
                var sumSecond:String = "";
                var sumIndicator:String = "";
            // find sum by looping over splitting
                if sumFirst.isEmpty && sumSecond.isEmpty && sumIndicator.isEmpty {
                    var positionFirst = -1
                    var positionSecond = -1
                    var positionArg = -1
                    
                    // find multiplication,divsion and remainder equations
                    if checkSpecialArgument(value: copy){
                    for item in copy {
                        positionArg+=1
                        // find argument indicator of equation
                        if checkArgument(value: item)  {
                            sumIndicator = String(item)
                            }
 
                        if !sumIndicator.isEmpty {
                            if sumIndicator.contains("x") || sumIndicator.contains("/") || sumIndicator.contains("%"){
                                // finds objects position in the array
                                positionFirst = positionArg-1
                                positionSecond = positionArg+1
                                equationStart = positionFirst
                                // get values from the positions
                                sumFirst = String( copy[positionFirst])
                                sumSecond = String(copy[positionArg+1])
                             // removes elements for the sum
                                copy.remove(at: positionFirst)
                                copy.remove(at: positionSecond-1)
                                copy.remove(at: positionArg-1)
                                break;
                            } else {
                                sumIndicator = ""
                            }
                        }
                    }
                    }
                    // find equations that contain + and -
                for item in copy {
                    positionFirst+=1
                    // find first argument of equation
                    if checkValue(value: String(item)) && sumFirst.isEmpty {
                        sumFirst = String(item)
                        copy.remove(at: positionFirst)
                        positionFirst = -1
                        equationStart+=1
                    }else {
                        //find second argument of equation
                    if checkValue(value: String(item)) && sumSecond.isEmpty {
                        sumSecond = String(item)
                        copy.remove(at: positionFirst)
                        positionFirst = -1
                    }
                    }
             
                    
                    // find argument indicator of equation
                    if checkArgument(value: String(item)) && sumIndicator.isEmpty {
                        sumIndicator = String(item)
                        copy.remove(at: positionFirst)
                        positionFirst = -1
                    }
                    }
                    
                }
                
         
                // find values and calculate
                if numbers.count != 0 && !sumFirst.isEmpty && !sumSecond.isEmpty && !sumIndicator.isEmpty {
                    var firstDelete = -1
                    var secondDelete = -1
                    var indicatorDelete = -1
                    // lops over first argument of the equation to find the value
                for item in numbers {
                    firstDelete+=1
                  
                    if first.isEmpty && item == sumFirst {
                    first = item
                        numbers.remove(at: firstDelete)
                     
                    }
                    
                }
                
                    // lops over second argument of the equation to find the value
                    for item in numbers {
                        secondDelete+=1
                      
                        if second.isEmpty && item == sumSecond  {
                            second = item
                            numbers.remove(at: secondDelete)
                        }
                    }
                
                // loops over sign to find the argument
                for item in sign {
                    indicatorDelete+=1
                    if indicator.isEmpty && item.contains(sumIndicator){
                        indicator = item
                        sign.remove(at: indicatorDelete)
                    }
                }
                }
                // when equation is completed it calculates
                if !first.isEmpty && !indicator.isEmpty && !second.isEmpty {
                    // calculation
            currentResult = calculatingInput(args: [first,indicator,second])
                    
                // check if there any numbers left in the array
                    if numbers.count != 0  {
                   
                    numbers.insert(String(currentResult), at: 0)
                       
                        // insert result in the location where the equation started
                    copy.insert(currentResult, at: equationStart)
                        equationStart = -1
                 
                    } else {
                        return currentResult
                    }
                }
                
            }
        }
        // return result if 1 value result is passed
        currentResult = String(splitting[0])
        return currentResult
    }
}

