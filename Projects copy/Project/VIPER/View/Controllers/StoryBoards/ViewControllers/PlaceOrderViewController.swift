//
//  PlaceOrderViewController.swift
//  Goheavy
//
//  Created by CSS on 27/05/18.
//  Copyright © 2018 css. All rights reserved.
//

import UIKit

class PlaceOrderViewController: UIViewController {

    @IBOutlet var buttonSkip: UIButton!
    @IBOutlet var viewVisualEffect: UIVisualEffectView!
    @IBOutlet var buttonShudule: UIButton!
    
    @IBOutlet var buttonGift: UIButton!
    @IBOutlet var labelCongrats: UILabel!
    @IBOutlet var buttonProceed: UIButton!
    var shuduleView : SchuduleView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    @IBAction func ActionSkip(_ sender: Any) {
        self.viewVisualEffect.showAnimateView(self.viewVisualEffect, isShow: false, direction: .Bottom)
        
    }
    
    @IBAction func shuduleAction(_ sender: Any) {
        loadShuduleNib()
        
    }
    
    @IBAction func proceedAction(_ sender: Any) {
         self.viewVisualEffect.showAnimateView(self.viewVisualEffect, isShow: true, direction: .Top)
        
    }
    
}
extension PlaceOrderViewController {
    
    
    private func  loadShuduleNib(){
        
        self.shuduleView = Bundle.main.loadNibNamed("SchuduleView", owner: self, options: nil)?.first as! SchuduleView
        //self.shuduleView.frame = CGRect(x: 0, y: 0, width: self.shuduleView.viewMain.frame.height, height: self.shuduleView.viewMain.frame.width )
         self.shuduleView.showAnimateView(self.shuduleView, isShow: true, direction: .Top)
       
        self.view.addSubview(self.shuduleView)
        
        self.shuduleView.buttonConfirm.addTarget(self, action: #selector(confirmButtonTapped(button:)), for: .touchUpInside)
        
    }
    
    @objc private func confirmButtonTapped(button: UIButton){
        
        self.shuduleView.showAnimateView(self.shuduleView, isShow: false, direction: .Bottom)
        
    }
}

extension PlaceOrderViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GiftOrderTableViewCell", for: indexPath) as! GiftOrderTableViewCell
        cell.imageGift.layer.cornerRadius = 10;
        cell.imageGift.clipsToBounds = true;

        if indexPath.row == 0 {
        cell.labelGiftName.text = "One Pluse 6"
            cell.imageGift.image = UIImage(named: "advertisement")
        }else if indexPath.row == 1 {
            cell.labelGiftName.text = "Solar Hanging Lights"
            cell.imageGift.image = UIImage(named: "advertisement2")
        }else {
            cell.labelGiftName.text = "Plastic Plates and spoons"
            cell.imageGift.image = UIImage(named: "advertisement3")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130.00
    }
    
}


class GiftOrderTableViewCell: UITableViewCell {
    
    @IBOutlet var labelGiftName: UILabel!
    @IBOutlet var imageGift: UIImageView!
    
    
    override func awakeFromNib() {
        
    }
}
