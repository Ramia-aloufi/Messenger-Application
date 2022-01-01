//
//  NewConversationViewController.swift
//  Messenger Application
//
//  Created by R on 26/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//

import UIKit
import FirebaseAuth

class NewConversationViewController: UIViewController {
  
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .red
            
            do {
                try FirebaseAuth.Auth.auth().signOut()
            }
            catch {

            }
            DatabaseManger.shared.test() // call test!

        }
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
      
            validateAuth()
        }
        
        private func validateAuth(){
            // current user is set automatically when you log a user in
            if FirebaseAuth.Auth.auth().currentUser == nil {
                // present login view controller
                let vc = LoginViewController()
                let nav = UINavigationController(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                present(nav, animated: false)
            }
        }
    }

