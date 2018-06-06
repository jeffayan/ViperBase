//
//  SignUpTableViewController.swift
//  Goheavy
//
//  Created by CSS on 25/05/18.
//  Copyright © 2018 css. All rights reserved.
//

import UIKit

class SignUpTableViewController: UITableViewController {

    @IBOutlet var imageUserProfile: UIImageView!
    @IBOutlet var viewProfileUser: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationController?.isNavigationBarHidden = true
        setCornerRadius()
    }


    @IBAction func ActionSignButton(_ sender: Any) {
        //self.push(id: Storyboard.Ids.SignInTableViewController, animation: true)
        self.popOrDismiss(animation: true)
    }
    
}
extension SignUpTableViewController {
    
    
    private func setCornerRadius(){
        
        self.imageUserProfile.cornerRadius = self.imageUserProfile.frame.height  / 2
        self.imageUserProfile.clipsToBounds = true
        
        self.viewProfileUser.cornerRadius = self.viewProfileUser.frame.height / 2
        self.viewProfileUser.clipsToBounds = true
        
        self.viewProfileUser.layer.borderColor = UIColor(red: 248/255, green: 247/255, blue: 246/255, alpha: 1).cgColor
        self.viewProfileUser.layer.borderWidth = 5
        
        self.viewProfileUser.layer.borderColor = UIColor.white.cgColor
    }
}
