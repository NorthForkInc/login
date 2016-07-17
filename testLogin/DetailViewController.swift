//
//  DetailViewController.swift
//  testLogin
//
//  Created by Kevin Koleck on 7/17/16.
//  Copyright © 2016 Kevin Koleck. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var majorLabel: UILabel!
    @IBOutlet var minorLabel: UILabel!
    
    var majorLabelText:String = ""
    var minorLabelText:String = ""
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.majorLabel.text = self.majorLabelText
        self.minorLabel.text = self.minorLabelText
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
