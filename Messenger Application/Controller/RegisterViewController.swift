//
//  RegisterViewController.swift
//  Messenger Application
//
//  Created by R on 26/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {
    //MARK: - OUTLET
    @IBOutlet weak var signUpOutlet: UIButton!
    @IBOutlet weak var profileImg: UIButton!
    @IBOutlet weak var firstNameTF: UITextField!
    @IBOutlet weak var lastNameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    @IBOutlet weak var viewContainer: UIView!
    
    //MARK: - VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        viewContainerSetUp()
    }
    //MARK: - ACTION
    @IBAction func addProfileImg(_ sender: UIButton) {
        presentPhotoActionSheet()
    }
    @IBAction func signUp(_ sender: UIButton) {
        if let firstName = firstNameTF.text,!firstName.isEmpty,
           let lastName = lastNameTF.text,!lastName.isEmpty,
           let email = emailTF.text,!email.isEmpty,
           let password = passwordTF.text,!password.isEmpty{
        }else{
            print("some empty")
        }
    }
    //MARK:- VIEWCONTAUNERSETUP
    func viewContainerSetUp(){
        viewContainer.layer.cornerRadius = 15
        viewContainer.layer.shadowOpacity = 0.1
        viewContainer.layer.shadowRadius = 10.0
        viewContainer.layer.shadowColor = UIColor.black.cgColor
        viewContainer.layer.masksToBounds = false
    }
}
//MARK: - EXTENSION
extension RegisterViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    // get results of user taking picture or selecting from camera roll
    func presentPhotoActionSheet(){
        let actionSheet = UIAlertController(title: "Profile Picture", message: "How would you like to select a picture?", preferredStyle: .actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { [weak self] _ in
            self?.presentCamera()
        }))
        actionSheet.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: { [weak self] _ in
            self?.presentPhotoPicker()
        }))
        
        present(actionSheet, animated: true)
    }
    func presentCamera() {
        let vc = UIImagePickerController()
        vc.sourceType = .camera
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    func presentPhotoPicker() {
        let vc = UIImagePickerController()
        vc.sourceType = .photoLibrary
        vc.delegate = self
        vc.allowsEditing = true
        present(vc, animated: true)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {        
        // action sheet - take photo or choose photo
        picker.dismiss(animated: true, completion: nil)
        print(info)
        
        guard let selectedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
            return
        }
        profileImg.setImage(selectedImage, for: .normal)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}

