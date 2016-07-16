//
//  SignUpViewController.swift
//  testLogin
//
//  Created by Kevin Koleck on 7/4/16.
//  Copyright © 2016 Kevin Koleck. All rights reserved.
//

import UIKit

import Alamofire



class SignUpViewController: UIViewController {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtEmail: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    @IBOutlet weak var txtConfirmPassword: UITextField!
    
    @IBAction func signTapped(sender: UIButton) {
        
        let username:NSString = txtUsername.text! as NSString
        let password:NSString = txtPassword.text! as NSString
        let email:NSString = txtEmail.text! as NSString
        let confirm_password:NSString = txtConfirmPassword.text! as NSString
        
        if ( username.isEqualToString("") || password.isEqualToString("") ) {
            
            let alertView:UIAlertView = UIAlertView()
            alertView.title = "Sign Up Failed!"
            alertView.message = "Please enter Username and Password"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        } else if ( !password.isEqual(confirm_password) ) {
            
            let alertView:UIAlertView = UIAlertView()
            alertView.title = "Sign Up Failed!"
            alertView.message = "Passwords doesn't Match"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        } else {
            
                    let parameters: [String: AnyObject] = [
                        "firstName" : "",
                        "userName" : username,
                        "password" : password,
                        "email" : email,
                        "zip" : ""]
            
                    Alamofire.request(.POST,"http://localhost:8080/tagIt/user",parameters: parameters, encoding: .JSON)
                        .responseJSON { response in switch response.result {
                        case .Success(let JSON):
//                            print(response.request)  // original URL request
//                            print(response.response) // URL response
//                            print(response.data)     // server data
//                            print(response.result)   // result of response serialization
                            
                            let res = JSON as! NSDictionary
                            
                            print(res.objectForKey("response"))
                            print(res.objectForKey("status"))
                        default: break
                            }
            }
             self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    @IBAction func gotoLogin(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
