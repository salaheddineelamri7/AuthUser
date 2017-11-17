//
//  WelcomeViewController.swift
//  AuthUser
//
//  Created by Mac on 16/11/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit
import Firebase
class WelcomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        Auth.auth().addStateDidChangeListener { (auth, user) in
            
            if user != nil {
                self.dismiss(animated: false, completion: nil)
            }
        }
        
    }

   

}
