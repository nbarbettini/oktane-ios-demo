//
//  ProfileViewController.swift
//  OktaneDemo
//
//  Created by Nathanael Barbettini on 8/14/17.
//  Copyright © 2017 Okta. All rights reserved.
//

import UIKit

class ProfileViewController : UIViewController {
    var givenName = ""
    var surname = ""
    var email = ""
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameLabel.text = "Hello, \(givenName)!"
        emailLabel.text = email
    }
}
