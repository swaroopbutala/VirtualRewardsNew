//
//  Student.swift
//  VirtualRewardsNew
//
//  Created by Dhruv Mangtani on 3/14/15.
//  Copyright (c) 2015 dhruv.mangtani. All rights reserved.
//

import Foundation
import UIKit

class Student{
    let name:String!
    var points:Int!
    init(name: String){
        self.name = name
        self.points = 0
    }
    init(name: String, startingPoints points: Int){
        self.name = name
        self.points = points
    }
    init(){
        
    }
}