//
//  LoginVCViewController.swift
//  testLogin
//
//  Created by Kevin Koleck on 7/4/16.
//  Copyright © 2016 Kevin Koleck. All rights reserved.
//

import UIKit
import Alamofire

class LoginVCViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBAction func signinTapped(sender: UIButton) {
        
        let username:NSString = txtUsername.text!
        let password:NSString = txtPassword.text!
        
        var error = false
        
        if ( username.isEqualToString("") || password.isEqualToString("") ) {
            
            let alertView:UIAlertView = UIAlertView()
            alertView.title = "Sign in Failed!"
            alertView.message = "Please enter Username and Password"
            alertView.delegate = self
            alertView.addButtonWithTitle("OK")
            alertView.show()
        } else {
            
            
            let parameters: [String: AnyObject] = [
                "emailUserName" : username,
                "password" : password ]
            
            Alamofire.request(.POST,"http://localhost:8080/tagIt/user/login",parameters: parameters, encoding: .JSON)
                .responseJSON { response in switch response.result {
                case .Success(let JSON):
                    print(response.request)  // original URL request
                    print(response.response) // URL response
                    print(response.data)     // server data
                    print(response.result)   // result of response serialization
                    
                    let res = JSON as! NSDictionary
                    
                    print(res.objectForKey("response"))
                    if((res.objectForKey("status")?.isEqualToNumber(0)) != nil){
                        let alertView:UIAlertView = UIAlertView()
                        alertView.title = "Sign in Failed!"
                        alertView.message = "ERROR"
                        alertView.delegate = self
                        alertView.addButtonWithTitle("OK")
                        alertView.show()
                        error = true
                    }
                    
                    
                default: break
                    }
            }
            
            
            
            if(error == false){
                NSLog("Login SUCCESS");
                
                let prefs:NSUserDefaults = NSUserDefaults.standardUserDefaults()
                prefs.setObject(username, forKey: "USERNAME")
                prefs.setInteger(1, forKey: "ISLOGGEDIN")
                prefs.synchronize()
                
                self.dismissViewControllerAnimated(true, completion: nil)
            }
            
        }
        
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
