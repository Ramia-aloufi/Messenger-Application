//
//  ProfileViewController.swift
//  Messenger Application
//
//  Created by R on 26/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    //MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Profile"
        checkIfLogin()
    }
    
    //MARK:- checkIfLogin
    func checkIfLogin(){
        if (UserDefaults.standard.string(forKey: "email")) != nil && (UserDefaults.standard.string(forKey: "email")) != nil{
        }else{
        let profilImg = LoginViewController(nibName: "LoginViewController", bundle: nil)
        navigationController?.popViewController(animated: true)

        navigationController?.pushViewController(profilImg, animated: true)
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
