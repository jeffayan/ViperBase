//
//  ProfileViewController.swift
//  Goheavy
//
//  Created by CSS on 29/05/18.
//  Copyright © 2018 css. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet var imageUser: ImageView!
    
    @IBOutlet var labelProfile: UILabel!
    
    
    @IBOutlet var labelName: UILabel!
    
    
    @IBOutlet var textFieldName: UITextField!
    
    @IBOutlet var labelContactNumber: UILabel!
    
    @IBOutlet var buttonChangepassword: UIButton!
    @IBOutlet var buttonSave: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
self.navigationController?.isNavigationBarHidden = true
        
   
        // Do any additional setup after loading the view.
    }
    
    @IBAction func profileBackButtonAction(_ sender: Any) {
        self.frostedViewController.view.endEditing(true)
        self.frostedViewController.presentMenuViewController()
    }
    



}

extension ProfileViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 450.00
    }
    
    
    
}




class ProfileCell: UITableViewCell {
    
    @IBOutlet var imageUser: ImageView!
    
    @IBOutlet var labelName: UILabel!
    
    @IBOutlet var textFieldName: UITextField!
    
    @IBOutlet var labelContactNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.imageUser.layer.borderColor = UIColor.white.cgColor
        self.imageUser.layer.borderWidth = 5.0
    }
}
