//
//  ViewController.swift
//  OktaneDemo
//
//  Created by Nathanael Barbettini on 8/14/17.
//  Copyright © 2017 Okta. All rights reserved.
//

import UIKit
import OktaAuth

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginWasPressed(_ sender: Any) {
        OktaAuth
            .login()
            .start(self) {
                response, error in
                
                if error != nil { print(error!) }
                
                if response != nil {
                    
                    // Get the user info
                    OktaAuth.userinfo() {
                        response, error in
                        
                        if error != nil { print(error!) }
                        
                        let profileView = self.storyboard?.instantiateViewController(
                            withIdentifier: "profile") as! ProfileViewController
                        
                        profileView.email = String(describing: response!["preferred_username"]!)
                        profileView.givenName = String(describing: response!["given_name"]!)
                        
                        DispatchQueue.main.async(execute: {
                            self.present(profileView, animated: true, completion: nil)
                        })
                    }
                }
        }
        
    }

}

