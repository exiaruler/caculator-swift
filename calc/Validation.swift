//
//  Validation.swift
//  calc
//
//  Created by Samuel Li on 19/3/21.
//  Copyright © 2021 UTS. All rights reserved.
//

import Foundation

enum InputError: Error {
    case invalidInput
    case invalidInputValues
    case invalidSumLength
}

class Validation {

func validateInput(values:Array<String>) throws {
    if values.count == 0 || values.count == 2 {
        do {
        throw InputError.invalidInput
        } catch {
    print("Incomplete expression. Expected input of the form [number] [operator number ...]")
        exit(0)
        }
    }
    /*
    if values.count == 2 {
        do {
            throw InputError.invalidSumLength
        } catch {
            print("Incomplete expression. Expected input of the form [number] [operator number ...]")
                exit(1)
        }
    }
 */
    if checkArrayValues(value:values) {
        do {
            throw InputError.invalidInputValues
        } catch {
            print("Incomplete expression. Expected input of the form [number] [operator number ...]")
                exit(1)
        }
    
        
       
 
    
}
    
  
    
    
   
    
    
}
    func checkValue(value:String)->Bool{
        if let _ = Int(value) {
            return true
        }
        return false
    }
    
    // check array values in the sum
    func checkArrayValues (value:Array<String>)-> Bool {
        for item in value {
            if checkValue(value: item) || value.contains("+") && value.count == 1 || value.contains("-") && value.count == 1 || value.contains("x") && value.count == 1  || value.contains("/") && value.count == 1 || value.contains("%") && value.count == 1 {
                return false
            }
        
            
        }
        return true
    }
    

}

    

