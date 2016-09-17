//
//  DareDetailsDelegete.swift
//  DareDevil
//
//  Created by Bruce on 9/16/16.
//  Copyright © 2016 Bruce. All rights reserved.
//

import UIKit


protocol DareDetailsDelegete: class {
    
    func dareDetailsDelegete(controller: DareDetailsViewController, didFinishAddingDare dare: Dare)
    
   // func missionDetailsViewController(controller: MissionDetailsViewController, didFinishEditingMission mission: Mission)
    
}