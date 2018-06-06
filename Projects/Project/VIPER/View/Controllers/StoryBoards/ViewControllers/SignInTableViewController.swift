//
//  SignInTableViewController.swift
//  Goheavy
//
//  Created by CSS on 23/05/18.
//  Copyright © 2018 css. All rights reserved.
//

import UIKit

class SignInTableViewController: UITableViewController {
    @IBOutlet var tableViewSignIn: UITableView!
    
    @IBOutlet var imageFaceBook: UIImageView!
    @IBOutlet var googleImage: UIImageView!
    @IBOutlet var signInContantView: UIView!
    @IBOutlet var viewProfileImage: UIView!
    @IBOutlet var imageProfileImage: UIImageView!
    
    @IBOutlet var viewGoogleBack: UIView!
    
    @IBOutlet var viewFaceBook: UIView!

    //MARK:- textField outlets
    @IBOutlet var textFieldCountryCode: UITextField!
    @IBOutlet var textFieldAreaCode: UITextField!
    @IBOutlet var textFieldPhoneNumber: UITextField!
    @IBOutlet var textFieldPassword: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationController?.isNavigationBarHidden = true
       
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        //setBackGroundImageForTableView()
        self.setRoundCorner()
        
    }
 
    
    @IBAction func actionSignUp(_ sender: Any) {
        self.push(id: Storyboard.Ids.SignUpTableViewController, animation: true)
    }
    
    @IBAction func actionSign(_ sender: Any) {
        
        guard let countryCode = textFieldCountryCode.text, !countryCode.isEmpty else {
            self.view.makeToast(ErrorMessage.list.EnterCountry)
            return
        }
        
        guard let areaCode = textFieldAreaCode.text, !areaCode.isEmpty else {
            self.view.makeToast(ErrorMessage.list.enterAreaCode)
            return
        }
        guard let phoneNumber = textFieldPhoneNumber.text, !phoneNumber.isEmpty  else {
            self.view.makeToast(ErrorMessage.list.enterPhoneNumber)
            return
        }
        
        guard let password = textFieldPassword.text, !password.isEmpty else {
            self.view.makeToast(ErrorMessage.list.enterPassword)
            return
        }
        
     //   self.presenter?.post(api: .login, data: MakeJson)
        self.push(id: Storyboard.Ids.HomePageViewController, animation: true)
    }
    



}


extension SignInTableViewController {
    
    private func setBackGroundImageForTableView(){
        let backgroundImage = UIImage(named: "BackGroundImage1")
        
        let imageView = UIImageView(image: backgroundImage)
        imageView.backgroundColor = UIColor.white
        
        
        self.tableViewSignIn.backgroundView = imageView
        
    }
    private  func setRoundCorner(){
        
    
        
        self.viewGoogleBack.layer.borderColor = UIColor(red: 248/255, green: 247/255, blue: 246/255, alpha: 1).cgColor
        self.viewGoogleBack.layer.borderWidth = 5.0
        
        self.viewFaceBook.layer.borderColor = UIColor(red: 248/255, green: 247/255, blue: 246/255, alpha: 1).cgColor
        
        
        self.viewFaceBook.layer.borderWidth = 5.0
        self.viewFaceBook.cornerRadius = self.viewFaceBook.frame.height / 2
        self.viewFaceBook.clipsToBounds = true
    

        self.viewGoogleBack.cornerRadius = self.googleImage.frame.height
         / 2
        self.viewGoogleBack.clipsToBounds = true
        
    }
    
}


extension SignInTableViewController : PostViewProtocol {
    func onError(api: Base, message: String, statusCode code: Int) {
        print(message)
    }
    
    
}
