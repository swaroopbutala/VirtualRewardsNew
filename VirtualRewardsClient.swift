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
    
    func getClass() -> Class{
        
        if let data = NSUserDefaults.standardUserDefaults().objectForKey(classKey) as? NSData{
            let unarc = NSKeyedUnarchiver(forReadingWithData: data)
            unarc.setClass(Class.self, forClassName: "Class")
            let currentClass = unarc.decodeObjectForKey("root") as Class
            Class.sharedInstance.students = currentClass.students
            Class.sharedInstance.teacher = currentClass.teacher
            return currentClass
            
        }
        return Class()
    }
}
