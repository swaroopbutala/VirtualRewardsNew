//
//  VirtualRewardsClient.swift
//  VirtualRewardsNew
//
//  Created by Dhruv Mangtani on 3/14/15.
//  Copyright (c) 2015 dhruv.mangtani. All rights reserved.
//

import UIKit

class VirtualRewardsClient{
    
    class var sharedInstance: VirtualRewardsClient{
        struct Static{
            static var instance = VirtualRewardsClient()
           // println("sdfd")
        }
        println("\(Static.instance) sdfd")
        return Static.instance
    }
    
    func searchWithTerm(term: String) -> [Student]{
        var defaults = NSUserDefaults.standardUserDefaults()
        var currentClass = ClassRoom.sharedInstance
        var students = currentClass.students
        var selectedStudents: [Student] = [Student]()
        for student in students{
            let name = student.name
            if name.rangeOfString(term) != nil{
                selectedStudents.append(student)
                continue
            }else{
                continue
            }
        }
        return selectedStudents
    }
    
    func updateSavedClass(){
        var defaults = NSUserDefaults.standardUserDefaults()
        var encodedObject: NSData = NSKeyedArchiver.archivedDataWithRootObject(ClassRoom.sharedInstance)
        defaults.setObject(encodedObject, forKey: classKey)
        defaults.synchronize()
    }
    
    func getClass() -> ClassRoom{
        var defaults = NSUserDefaults.standardUserDefaults()
        println(defaults.objectForKey(classKey))
        var currentClass:ClassRoom!
        if let data = defaults.objectForKey(classKey) as? NSData{
            //let unarc = NSKeyedUnarchiver(forReadingWithData: data)
            //unarc.setClass(Class.self, forClassName: "Class")
            currentClass = NSKeyedUnarchiver.unarchiveObjectWithData(data) as ClassRoom
            println("entering")
            //Class.sharedInstance.students = currentClass.students
            //Class.sharedInstance.teacher = currentClass.teacher
            return currentClass
            
        } else {
            var newClass = ClassRoom()
            newClass.students = [Student]()
            var encodedObject: NSData = NSKeyedArchiver.archivedDataWithRootObject(newClass)
            defaults.setObject(encodedObject, forKey: classKey)
            defaults.synchronize()
            return newClass
        }
    }
}
