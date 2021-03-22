//
//  Validation.swift
//  calc
//
//  Created by Samuel Li on 19/3/21.
//  Copyright © 2021 UTS. All rights reserved.
//

import Foundation

enum InputError: Error {
    case invalidInputNil
    case invalidSumLength
    case invalidValue
    case invalidArg
    case invalidInput
    
}

class Validation {

func validateInput(values:Array<String>) throws {
    // if there no values in input
    if values.count == 0 {
        do {
        throw InputError.invalidInputNil
        } catch {
    print("Incomplete expression. Expected input of the form [number] [operator number ...]")
        exit(0)
        }
    }
   
    // sum that has 2 values e.g 1 +
    if values.count == 2 {
        do {
            throw InputError.invalidSumLength
        } catch {
            print("Incomplete expression. Expected input of the form [number] [operator number ...]")
                exit(1)
        }
    }
    
   // check for valid values of input
        if checkArrayValues(value: values) {
        var find = ""
            do {
                find = findInvalid(value: values)
                throw InputError.invalidArg
            } catch {
                print("Invalid number: \(find)")
                exit(2)
            }
        }
    
    // check for invalid single values
    if values.count == 1 && checkArrayValues(value: values){
        var find = ""
        do {
            find = findInvalid(value: values)
            throw InputError.invalidInput
        } catch {
            print("Invalid number: \(find)")
            exit(3)
        }
    }
    
    // check for valid arguments
    if checkInvalidArg(value: values){
        var find = ""
        do {
            find = findInvalidArg(value: values)
            throw InputError.invalidValue
        } catch {
            print("Invalid operator: \(find)")
            exit(4)
        }
    }
}
    // verify input values if they are numbers/int
    func verifyValue(value:String)->Bool{
        // numbers that are valid
        let characterset = CharacterSet(charactersIn:
           "0123456789-+x"
        )
        if value.rangeOfCharacter(from: characterset.inverted) != nil{
            return true
        }
        return false
    }
    // verify values of argument
    func verifyArg (value:String)->Bool{
        let characterset = CharacterSet(charactersIn:
           "-x+/%"
        )
        if value.rangeOfCharacter(from: characterset.inverted) == nil{
            return true
        }
        return false
    }
    
    // check array that they are numbers of first and second values
    func checkArrayValues (value:Array<String>)-> Bool {
        var first = ""
        var second = ""
        var arg = ""
        // loops over to search
        for item in value {
            if first.isEmpty {
                first = item
            }else {
                if verifyArg(value: item) && arg.isEmpty {
                    arg = item
                } else {
                    if second.isEmpty {
                        second = item
                    }
                }
            
            }
           // checks and returns if there are any invalid in the sum
            if !first.isEmpty && !second.isEmpty && !arg.isEmpty {
                if verifyValue(value: first) {
                    return true
                } else {
                    if verifyValue(value: second) {
                        return true
                    }
                }
                first = ""
                 second = ""
                 arg = ""
            }
            
        }
        return false
    }
    
    // finds invalid value of the sum and returns it
    func findInvalid (value:Array<String>)->String{
        var result = ""
        for item in value {
           
            if verifyValue(value: item){
                result = item
                return result
            }
        }
        return result;
    }
    
    
    // finds argument and return unvalid arguments
    func findInvalidArg (value:Array<String>)->String {
        var count = 0
        var result = ""
        for item in value {
            count+=1
            if count == 2 {
                if !verifyArg(value: item){
                    result = item
                    return result
                } else {
                    count = 0
                }
            }
        }
        return result
    }
    // checks for invalid argument
    func checkInvalidArg (value:Array<String>)->Bool {
        var count = 0
        for item in value {
            count+=1
            if count == 2 {
                if !verifyArg(value: item){
                    return true
                } else {
                    count = 0
                }
            }
        }
        return false
    }

    
    

}

    


