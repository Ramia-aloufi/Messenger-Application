//
//  LoginViewController.swift
//  Messenger Application
//
//  Created by R on 26/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    //MARK:- IBOutlet
    @IBOutlet weak var viewContainer: UIView!
    @IBOutlet weak var stackContainer: UIStackView!
    @IBOutlet weak var remembermeBTN: UIButton!
    @IBOutlet weak var signinBTN: UIButton!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var facebookLogIn: UIButton!
    //MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        viewContainerSetUp()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Sign in"
        }
    //MARK:- viewContainerSetUp
    func viewContainerSetUp(){
        viewContainer.layer.cornerRadius = 15
        viewContainer.layer.shadowOpacity = 0.1
        viewContainer.layer.shadowRadius = 10.0
        viewContainer.layer.shadowColor = UIColor.black.cgColor
        viewContainer.layer.masksToBounds = false
    }
    //MARK:- signinAction
    @IBAction func signinAction(_ sender: UIButton) {
        guard let email = emailTF.text,!email.isEmpty,let password = passwordTF.text,!password.isEmpty else {return}
         UserDefaults.standard.set(email, forKey: "email")
         UserDefaults.standard.set(password, forKey: "password")
        // Firebase Login
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: { authResult, error in
            guard let result = authResult, error == nil else {
                print("Failed to log in user with email \(email)")
                return
            }
            let user = result.user
            print("logged in user: \(user)")
        })
    }
    
    }
//MARK:- extension
extension UIViewController {
    class func loadFromNibNamed(nibNamed: String, bundle : Bundle? = nil) -> UIViewController? {
    return UINib(
        nibName: nibNamed,
        bundle: bundle
    ).instantiate(withOwner: nil, options: nil)[0] as? UIViewController
    }
  }
