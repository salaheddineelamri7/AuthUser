//
//  FirebaseReference.swift
//  AuthUser
//
//  Created by Mac on 13/11/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase



enum Databasereference
{
    case root
    case users(uid: String)
    
    func reference() -> DatabaseReference
    {
        switch self {
        case .root:
            return rootRef
        default:
            return rootRef.child(path)
        }
        
    }
    
    private var rootRef: DatabaseReference {
        return Database.database().reference()
    }
    
    
    private var path: String {
        switch self {
        case .root:
            return ""
        case .users(let uid):
            return "users/\(uid)"
        }
    }
    
    
}


enum Storagereference {

    case root
    case profileImages
    
    func reference() -> StorageReference {
        
        switch self {
        case .root:
            return rootRef
        default:
            return rootRef.child(path)
        }
        
    }
    
    private var rootRef: StorageReference {
        return Storage.storage().reference()
    }
    
    private var path: String {
    
        switch self {
        
        case .root:
            return ""
        case .profileImages:
            return "profileImages"
        
        
        }
    
    
    }
    



}










