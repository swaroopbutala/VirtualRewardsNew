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
        }
        return Static.instance
    }
    
    func searchWithTerm(term: String) -> [Student]{
        var defaults = NSUserDefaults.standardUserDefaults()
        var currentClass = Class.sharedInstance
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
    
    func getClass() -> Class{
        var defaults = NSUserDefaults.standardUserDefaults()
        println(defaults.objectForKey(classKey))
        if let data = defaults.objectForKey(classKey) as? NSData{
            //let unarc = NSKeyedUnarchiver(forReadingWithData: data)
            //unarc.setClass(Class.self, forClassName: "Class")
            let currentClass = NSKeyedUnarchiver.unarchiveObjectWithData(data) as Class
            println("entering")
            Class.sharedInstance.students = currentClass.students
            Class.sharedInstance.teacher = currentClass.teacher
            return currentClass
            
        } else {
            var newClass = Class()
            newClass.students = [Student]()
            var encodedObject: NSData = NSKeyedArchiver.archivedDataWithRootObject(newClass)
            defaults.setObject(encodedObject, forKey: classKey)
            defaults.synchronize()
            return newClass
        }
    }
}
