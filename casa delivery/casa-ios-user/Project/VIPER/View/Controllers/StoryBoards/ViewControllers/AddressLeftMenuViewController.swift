//
//  AddressLeftMenuViewController.swift
//  Goheavy
//
//  Created by CSS on 30/05/18.
//  Copyright © 2018 css. All rights reserved.
//

import UIKit

class AddressLeftMenuViewController: UIViewController {

    @IBOutlet var addressTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.isNavigationBarHidden = true
        //setNavigationBar()
    }

    func setNavigationBar(){
        if #available(iOS 11.0, *) {
            self.navigationController?.isNavigationBarHidden = false
            // self.navigationController?.navigationBar.prefersLargeTitles = true
            self.navigationController?.navigationBar.tintColor = UIColor(red: 218/255, green: 95/255, blue: 90/255, alpha: 1)
            UINavigationBar.appearance().tintColor = UIColor.blue
            //self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "Menu").resizeImage(newWidth: 30), style: .plain, target: self, action: #selector(backBarButtonTapped(sender:)))
        } else {
            // Fallback on earlier versions
        }
        title = Constants.string.inviteReferral
    }


    @IBOutlet var backAction: UIButton!
    
    @IBAction func backActionmenu(_ sender: Any) {
        self.frostedViewController.view.endEditing(true)
        self.frostedViewController.presentMenuViewController()
    }
    
}

extension AddressLeftMenuViewController : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddressCell", for: indexPath) as! AddressCell
        return cell
    }
    
    
    
}



class AddressCell: UITableViewCell {
    override func awakeFromNib() {
        
    }
}
