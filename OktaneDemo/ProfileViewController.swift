//
//  ProfileViewController.swift
//  Atko Partner App
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
        
        nameLabel.text = "\(givenName) \(surname)"
    }
}
