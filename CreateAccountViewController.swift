//
//  CreateAccountViewController.swift
//  LoginProject
//
//  Created by Mauro Consiglio on 17/12/14.
//  Copyright (c) 2014 Mauro Consiglio. All rights reserved.
//

import UIKit

protocol CreateAccountViewControllerDelegate {
    func accountCreated()
}

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var chooseUsernameTextField: UITextField!
    @IBOutlet weak var choosePasswordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    var delegate:CreateAccountViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
// IBActions
    
    @IBAction func createAccountButtonPressed(sender: UIButton) {
        
        if choosePasswordTextField.text == confirmPasswordTextField.text && choosePasswordTextField.text != nil {
            
            NSUserDefaults.standardUserDefaults().setObject(self.chooseUsernameTextField.text, forKey: kUserNameKey)
            NSUserDefaults.standardUserDefaults().setObject(self.choosePasswordTextField.text, forKey: kPasswordKey)
            NSUserDefaults.standardUserDefaults().synchronize()
            
            self.dismissViewControllerAnimated(true, completion: nil)
            delegate?.accountCreated()
        }
    }
    
    @IBAction func cancelButtonPressed(sender: UIButton) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
   
}
