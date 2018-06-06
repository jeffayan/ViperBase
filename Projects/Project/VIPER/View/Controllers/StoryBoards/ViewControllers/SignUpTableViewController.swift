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
    
    //MARK:-textFields
    
    @IBOutlet var textFieldName: UITextField!
    @IBOutlet var textFieldCountryCode: UITextField!
    @IBOutlet var textFieldEmail: UITextField!
    
    @IBOutlet var textieldAreaCode: UITextField!
    
    @IBOutlet var textFieldPhoneNumber: UITextField!
    
    @IBOutlet var textFieldPassword: UITextField!
    
    @IBOutlet var textFieldConfirmPassword: UITextField!
    
    //MAEK:- button outlet
    @IBOutlet var buttonSignUp: UIButton!
    
    var userImage : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationController?.isNavigationBarHidden = true
        setCornerRadius()
        initialLoad()
    }


    @IBAction func ActionSignButton(_ sender: Any) {
        
        
        self.popOrDismiss(animation: true)
    }
    
    @IBAction func buttonActionSignUp(_ sender: Any) {
        
        guard let email = textFieldEmail.text, !email.isEmpty else {
            self.view.makeToast(ErrorMessage.list.enterEmail)
            return
            
        }
        guard let firstname = textFieldName.text, !firstname.isEmpty else {
            self.view.makeToast(ErrorMessage.list.enterName)
            return
        }
        guard let countryCode = textFieldCountryCode.text, !countryCode.isEmpty  else {
            self.view.makeToast(ErrorMessage.list.EnterCountry)
            return
        }
        guard let areaCode = textieldAreaCode.text, !areaCode.isEmpty  else {
            self.view.makeToast(ErrorMessage.list.EnterCountry)
            return
        }
        guard let phoneNumber = textFieldPhoneNumber.text, !phoneNumber.isEmpty else {
            self.view.makeToast(ErrorMessage.list.enterPhoneNumber)
            return
        }
        guard let password = textFieldPassword.text, !password.isEmpty  else {
            self.view.makeToast(ErrorMessage.list.enterPassword)
            return
        }
        guard let confirmPassword = textFieldConfirmPassword.text, !confirmPassword.isEmpty   else {
            self.view.makeToast(ErrorMessage.list.enterConfirmPwd)
            return
        }
        
       // self.presenter?.post(api: .signUp, data: MakeJson.signUp(email: email, phonrNumber: phoneNumber, password: password, firestName: firstname , lastName: firstname, countryCode: countryCode, areaCode: areaCode).toData())
        
        var data : Data?
        
        if userImage != nil, let dataImage = UIImagePNGRepresentation(userImage!){
            data = dataImage
        }
        
        var signUp = SignUpMdel()
        signUp.device_id = deviceId
        signUp.device_type = deviceType
        signUp.device_token = deviceToken
        signUp.email = email
        signUp.first_name = firstname
        signUp.last_name = firstname
        signUp.mobile = phoneNumber
        signUp.login_by = "manual"
        signUp.password = password
        
        let json = signUp.JSONRepresentation
        
        self.presenter?.post(api: .signUp, imageData: data == nil ? nil : [WebConstants.string.picture : data!], parameters: json)

    }
    
    
    
}
extension SignUpTableViewController {
    
    private func initialLoad(){
        changeImage()
    }
    
    
    private func loadSignUpApi(){
    }
    
    private func changeImage(){
        imageUserProfile.isUserInteractionEnabled = true
        let gusture = UITapGestureRecognizer(target: self, action: #selector(imagechageAction(sender:)))
        
        imageUserProfile.addGestureRecognizer(gusture)
    }
    
    @IBAction func imagechageAction(sender: UITapGestureRecognizer){
        self.showImage { (image) in
            if image != nil {
                self.userImage = image
                self.imageUserProfile.image = image
            }
        }
    }
    
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


extension SignUpTableViewController : PostViewProtocol {
    func onError(api: Base, message: String, statusCode code: Int) {
        print(message)
    }
    
    
    func getAuth(api: Base, data: SignUpMdel?) {
        print(data as Any)
    }
    
}
