//
//  ViewController.swift
//  OktaneDemo
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
        loadingIndicator.startAnimating()
        loginButton.isHidden = true
        
        OktaAuth
            .login()
            .start(self) {
                response, error in
                
                if let _ = response {
                    OktaAuth.userinfo() {
                        response, error in
                        
                        self.showProfileWith(data: response!)
                    }
                }
        }
    }
    
    func showProfileWith(data: [String : Any]) {
        let profileView = self.storyboard?.instantiateViewController(
            withIdentifier: "profile") as! ProfileViewController
        
        profileView.email = String(describing: data["preferred_username"]!)
        profileView.givenName = String(describing: data["given_name"]!)
        
        DispatchQueue.main.async(execute: {
            self.present(profileView, animated: true, completion: nil)
        })
    }
}

