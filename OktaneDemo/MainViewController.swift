//
//  ViewController.swift
//  Atko Partner App
//

import UIKit
import OktaAuth

class MainViewController: UIViewController {
    
    
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginWasPressed(_ sender: Any) {

    }
    
    func showProfileWith(data: [String : Any]) {
        let profileView = self.storyboard?.instantiateViewController(
            withIdentifier: "profile") as! ProfileViewController
        
        profileView.email = String(describing: data["preferred_username"]!)
        profileView.givenName = String(describing: data["given_name"]!)
        profileView.surname = String(describing: data["family_name"]!)
        
        DispatchQueue.main.async(execute: {
            self.present(profileView, animated: true, completion: nil)
        })
    }
}

