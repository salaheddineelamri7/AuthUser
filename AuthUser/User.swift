//
//  User.swift
//  AuthUser
//
//  Created by Mac on 15/11/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation
import UIKit

class User {

    var username: String
    var uid: String
    var fullName: String
    var email: String
    var profileImage: UIImage?
    
    init(uid: String, username: String, profileImage: UIImage?, email: String, fullName: String) {
        
        self.uid = uid
        self.email = email
        self.fullName = fullName
        self.username = username
        self.profileImage = profileImage
    }
    
    init(username: String, profileImage: UIImage?) {
        
        self.uid = ""
        self.email = ""
        self.fullName = ""
        self.username = username
        self.profileImage = profileImage
    }
    
    func save(completion: @escaping (Error?) -> Void){
        
        //ref
        let ref = Databasereference.users(uid: uid).reference()
        
        //setv ref
        ref.setValue(toDictionary())
        
        //save img
        
        if let profileImage = self.profileImage {
            
            let firImage = FIRImage(image: profileImage)
            firImage.saveProfileImage(uid, { (error) in
                //
                completion(error)
            })
        
        }
    
    }
    
    func toDictionary() -> [String : Any]
    {
        return [
            "uid" : uid,
            "username" : username,
            "fullName" : fullName,
            "email" : email
        ]
        
    }
    





}
