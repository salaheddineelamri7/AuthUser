//
//  FIRImage.swift
//  AuthUser
//
//  Created by Mac on 14/11/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit
import Firebase


class FIRImage {
    
    var image: UIImage
    var downloadURL: URL?
    var downloadURLString: String!
    var ref: StorageReference!
    
    init(image: UIImage) {
        self.image = image
    }
    
    func saveProfileImage(_ userUID: String, _ comletion: @escaping (Error?) -> Void){
        
        let resizeImage = image.resized()
        if let imageData = UIImageJPEGRepresentation(resizeImage, 0.9) {
            
            ref = Storagereference.profileImages.reference().child(userUID)
            downloadURLString = ref.description
            
            ref.putData(imageData, metadata: nil, completion: { (metadata, error) in
                comletion(error)
            })
            
        }
        
        
    }
    

}


private extension UIImage
{
    func resized() -> UIImage {
        let height: CGFloat = 1000.0
        let ratio = self.size.width / self.size.height
        let width = height * ratio
        
        let newSize = CGSize(width: width, height: height)
        let newRectangle = CGRect(x: 0, y: 0, width: width, height: height)
        
        UIGraphicsBeginImageContext(newSize)
        
        self.draw(in: newRectangle)
        
        let resizedImage = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        return resizedImage!
    }
    
    
}
