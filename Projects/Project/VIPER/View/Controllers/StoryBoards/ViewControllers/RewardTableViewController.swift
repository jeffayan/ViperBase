//
//  RewardTableViewController.swift
//  Goheavy
//
//  Created by CSS on 30/05/18.
//  Copyright © 2018 css. All rights reserved.
//

import UIKit

class RewardTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        setNavigationBar()
    }
    func setNavigationBar(){
        if #available(iOS 11.0, *) {
            self.navigationController?.isNavigationBarHidden = false
            // self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationController?.navigationBar.tintColor = UIColor(red: 218/255, green: 95/255, blue: 90/255, alpha: 1)
            
            self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "Menu").resizeImage(newWidth: 30), style: .plain, target: self, action: #selector(backBarButtonTapped(sender:)))
        } else {
            // Fallback on earlier versions
        }
        title = Constants.string.inviteReferral
    }
    
   @IBAction func backBarButtonTapped(sender: UIBarButtonItem){
        
        
    }
    
    
    
}
