//
//  Class.swift
//  VirtualRewardsNew
//
//  Created by Dhruv Mangtani on 3/14/15.
//  Copyright (c) 2015 dhruv.mangtani. All rights reserved.
//

import Foundation
import UIKit

let classKey = "CLASS_KEY"

class Class: NSObject{
    let defaults = NSUserDefaults.standardUserDefaults()
    class var sharedInstance: Class{
        struct Static{
            static var instance: Class = VirtualRewardsClient.sharedInstance.getClass()
        }
        return Static.instance
    }
    var students:[Student] = [Student]()
    var teacher = Teacher(currentClass: sharedInstance)
    
    func addStudent(name: String, value: Int){
        students.append(Student(name: name, startingPoints: value))
        defaults.setObject(Class.sharedInstance, forKey: classKey)
        VirtualRewardsClient.sharedInstance.getClass()
    }
    
    func addStudent(name: String){
        students.append(Student(name: name))
        defaults.setObject(Class.sharedInstance, forKey: classKey)
        VirtualRewardsClient.sharedInstance.getClass()
    }
    
    func addStudents(students: [String]){
        for name in students{
            Class.sharedInstance.addStudent(name)
        }
    }
    
    func printClass(){
        for i in students{
            println("Student: \(i.name), Points: \(i.points)")
        }
    }
}