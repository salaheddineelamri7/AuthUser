//
//  SignUpTableViewController.swift
//  AuthUser
//
//  Created by Mac on 15/11/2017.
//  Copyright © 2017 Mac. All rights reserved.
//

import UIKit
import Firebase
class SignUpTableViewController: UITableViewController {

    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var fullNameTextField: UITextField!
    
    var profilePicture: UIImage!
    
    @IBAction func changeImageProfileDidTap(_ sender: Any) {
        
        profilePicture = UIImage(named: "zagora")
        
        profileImageView.image = profilePicture
        
        profileImageView.layer.cornerRadius = profileImageView.bounds.width / 1.0
        
        profileImageView.layer.masksToBounds = true
        
    }
    
    @IBAction func createNewAcountDidTap(_ sender: Any) {
        
        
        if emailTextField.text != ""
        && (passwordTextField.text?.characters.count)! > 6
        && (usernameTextField.text?.characters.count)! > 6
        && fullNameTextField.text != ""
            && profilePicture != nil {
            
            let username = usernameTextField.text!
            let email = emailTextField.text!
            let fullName = fullNameTextField.text!
            let password = passwordTextField.text!
            
            
            Auth.auth().createUser(withEmail: email, password: password) { (firuser, error) in
                
                if error != nil {
                    //display error
                    print(error)
                }else if let firuser = firuser {
                    
                    // save info
                    let newUser = User(uid: firuser.uid, username: username,
                                       profileImage: self.profilePicture, email: email, fullName: fullName)
                    
                    newUser.save(completion: { (error) in
                        
                        if error != nil {
                            
                            print(error)
                            
                        }else {
                            // successefully
                            
                            Auth.auth().signIn(withEmail: email, password: password, completion: { (firUser, error) in
                                
                                if error != nil {
                                    print(error)
                                }else {
                                    self.dismiss(animated: false, completion: nil)
                                }
                                
                            })
                            
                        }
                        
                    })//save
                    
                    
                    
                }
                
                
                
            }
            
            
        
        }
        
        
        
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

   
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
