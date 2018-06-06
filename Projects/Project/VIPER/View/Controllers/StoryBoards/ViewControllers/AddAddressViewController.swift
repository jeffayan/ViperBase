//
//  AddAddressViewController.swift
//  Goheavy
//
//  Created by CSS on 26/05/18.
//  Copyright © 2018 css. All rights reserved.
//

import UIKit

class AddAddressViewController: UIViewController {

  
    @IBOutlet var imageBack: AddressTableViewCell!
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
        
    }

  
    @IBAction func backAction(_ sender: Any) {
        popOrDismiss(animation: true)
    }
    
    
    @IBAction func saveButtonTapped(_ sender: Any) {
        self.popOrDismiss(animation: true)
    }
    
}

extension AddAddressViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddressTableViewCell", for: indexPath) as! AddressTableViewCell
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 800.0
    }
    
    
    
    
}



class AddressTableViewCell: UITableViewCell {
    
    @IBOutlet var buttonSearch: UIButton!
    
    override func awakeFromNib() {
        
        self.buttonSearch.layer.borderColor = UIColor.white.cgColor
        self.buttonSearch.layer.borderWidth = 5.0
        
    }
}
