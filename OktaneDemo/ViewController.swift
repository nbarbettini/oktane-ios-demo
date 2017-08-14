//
//  ViewController.swift
//  OktaneDemo
//
//  Created by Nathanael Barbettini on 8/14/17.
//  Copyright © 2017 Okta. All rights reserved.
//

import UIKit
import OktaAuth

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginWasPressed(_ sender: Any) {
        OktaAuth.login()
            .start(self) {
                response, error in
                
                print("callback!")
                
                if response != nil {
                    
                    // Get the user info
                    OktaAuth.userinfo() {
                        response, error in
                        
                        response!.forEach { print("\($0): \($1)") }
                        
                        let home = self.storyboard?.instantiateViewController(withIdentifier: "MainController")
                        self.present(home!, animated: false, completion: nil)
                    }
                }
        }
        
    }

}

