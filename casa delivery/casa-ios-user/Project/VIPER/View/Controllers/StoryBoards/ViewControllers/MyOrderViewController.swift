//
//  MyOrderViewController.swift
//  Goheavy
//
//  Created by CSS on 03/06/18.
//  Copyright © 2018 css. All rights reserved.
//

import UIKit
import REFrostedViewController
class MyOrderViewController: UIViewController {
    @IBOutlet var buttonUpComming: UIButton!
    
    @IBOutlet var buttonCancle: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        // Do any additional setup after loading the view.
    }
    @IBAction func buttonActionMenu(_ sender: Any) {
        self.frostedViewController.view.endEditing(true)
        self.frostedViewController.presentMenuViewController()
    }
    
    
    @IBAction func backAction(_ sender: Any) {
        self.frostedViewController.view.endEditing(true)
        self.frostedViewController.presentMenuViewController()
    }
    

}


extension MyOrderViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyOrderTableViewCell", for: indexPath) as! MyOrderTableViewCell
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250

    }
    
    
    
}

class MyOrderTableViewCell: UITableViewCell {
    
    @IBOutlet var labelNoOfItem: UILabel!
    @IBOutlet var buttonOrder: UIButton!
    @IBOutlet var labelItemValue: UILabel!
    @IBOutlet var buttonTrack: UIButton!
    @IBOutlet var labelPrice: UILabel!
    @IBOutlet var labelTotalValue: UILabel!
    @IBOutlet var labelDateAndTime: UILabel!
    
    @IBOutlet var labelStatus: UILabel!
    @IBOutlet var labelDateAndTImeValue: UILabel!
    @IBOutlet var labelStatusValue: UILabel!
    
    @IBOutlet var buttonViewDertails: UIButton!
    @IBOutlet var buttonCancle: UIButton!
    
  
    @IBOutlet var buttonUpComming: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
