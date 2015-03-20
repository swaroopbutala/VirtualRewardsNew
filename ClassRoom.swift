//
//  ClassRoom.swift
//  VirtualRewardsNew
//
//  Created by Dhruv Mangtani on 3/14/15.
//  Copyright (c) 2015 dhruv.mangtani. All rights reserved.
//

import Foundation
import UIKit

let classKey = "CLASS_KEY"

class ClassRoom: NSObject, NSCoding{
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    class var sharedInstance: ClassRoom{
        struct Static{
            static var instance:ClassRoom = VirtualRewardsClient.sharedInstance.getClass()
        }
        println("test6 Classroom sharedInstance");
        return Static.instance
    }
    var students:[Student]!
    
    func setUp(){
    
    }
    //var students:[Student] = sharedInstance.students
    //var teacher = Teacher(currentClass: sharedInstance)
    func encodeWithCoder(aCoder: NSCoder) {
        
    }
    override init() {
         println( "test7 init of classroom\(students)");
        if (students == nil) {
            students = [Student]()
            println( "test8 init of classroom");
            VirtualRewardsClient.sharedInstance.updateSavedClass()
            println( "test9 init of classroom");
        }
    }
    required init(coder aDecoder: NSCoder) {
        
    }
    func addStudent(name: String, value: Int){
        ClassRoom.sharedInstance.students.append(Student(name: name, startingPoints: value))
        ClassRoom.sharedInstance.students = students
        //defaults.setObject(ClassRoom.sharedInstance, forKey: classKey)
        VirtualRewardsClient.sharedInstance.updateSavedClass()
    }
    
    func addStudent(name: String){
        ClassRoom.sharedInstance.students.append(Student(name: name))
        ClassRoom.sharedInstance.students = students
        //defaults.setObject(ClassRoom.sharedInstance, forKey: classKey)
        VirtualRewardsClient.sharedInstance.updateSavedClass()
    }
    
    func addStudents(students: [String]){
        for name in students{
            ClassRoom.sharedInstance.addStudent(name)
        }
    }
    
    func printClass(){
        for i in students{
            println("Student: \(i.name), Points: \(i.points)")
        }
    }
}