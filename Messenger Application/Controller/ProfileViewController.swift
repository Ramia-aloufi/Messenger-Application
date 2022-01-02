//
//  ProfileViewController.swift
//  Messenger Application
//
//  Created by R on 26/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//

import UIKit
import FirebaseAuth


class ProfileViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    
    let data = ["Log Out"]
        
    //MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Profile"
       // checkIfLogin()
    }
    
    //MARK:- checkIfLogin
//    func checkIfLogin(){
//        if (UserDefaults.standard.string(forKey: "email")) != nil && (UserDefaults.standard.string(forKey: "email")) != nil{
//        }else{
//        let profilImg = LoginViewController(nibName: "LoginViewController", bundle: nil)
//        navigationController?.popViewController(animated: true)
//
//        navigationController?.pushViewController(profilImg, animated: true)
//        }
//    }

}
extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row]
        cell.textLabel?.textAlignment = .center
        cell.textLabel?.textColor = .red
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true) // unhighlight the cell
        // logout the user
        
        // show alert
        
        let actionSheet = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        
        actionSheet.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: { [weak self] _ in
            // action that is fired once selected
            
            guard let strongSelf = self else {
                return
            }
            
          
            
            do {
                try FirebaseAuth.Auth.auth().signOut()
                
                // present login view controller
                let vc = LoginViewController()
                let nav = UINavigationController(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                strongSelf.present(nav, animated: true)
            }
            catch {
                print("failed to logout")
            }
            
        }))
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(actionSheet, animated: true)
    }
    
}

