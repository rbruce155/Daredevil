//
//  UserInfoViewController.swift
//  DareDevil
//
//  Created by Bruce on 9/15/16.
//  Copyright © 2016 Bruce. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("UserInfoViewController did load")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        print("UserInfoViewController viewWillAppear")
    }
    
    
}


