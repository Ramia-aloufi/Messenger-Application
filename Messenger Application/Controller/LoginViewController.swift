//
//  LoginViewController.swift
//  Messenger Application
//
//  Created by R on 26/05/1443 AH.
//  Copyright © 1443 R. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan

    }




}

extension UIViewController {
    class func loadFromNibNamed(nibNamed: String, bundle : Bundle? = nil) -> UIViewController? {
    return UINib(
        nibName: nibNamed,
        bundle: bundle
    ).instantiate(withOwner: nil, options: nil)[0] as? UIViewController
    }}
