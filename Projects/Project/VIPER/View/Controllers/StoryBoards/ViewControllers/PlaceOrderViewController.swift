//
//  PlaceOrderViewController.swift
//  Goheavy
//
//  Created by CSS on 27/05/18.
//  Copyright © 2018 css. All rights reserved.
//

import UIKit

class PlaceOrderViewController: UIViewController {
    @IBOutlet var invoiveTableView: UITableView!
    
    @IBOutlet var buttonCollabs: UIButton!
    @IBOutlet var imageInvoice: ImageView!
    @IBOutlet var buttonSkip: UIButton!
    @IBOutlet var viewVisualEffect: UIVisualEffectView!
    @IBOutlet var buttonShudule: UIButton!
    
    @IBOutlet var viewInvoice: UIView!
    @IBOutlet var placeOrderTableView: UITableView!
    @IBOutlet var invoiceView: UIView!
    @IBOutlet var buttonGift: UIButton!
    @IBOutlet var labelCongrats: UILabel!
    @IBOutlet var buttonProceed: UIButton!
    var shuduleView : SchuduleView!
    
    
    var invoiceArray = NSMutableArray()
    var invoiceValueArray = NSMutableArray()
    
    var isExpandable = Bool()
    var selectedIndex = Int()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       invoiceArray = ["11 kg Gas(1)","13 kg Gas(2)","15 Ltr Agua(2)","20 Ltr Agua(1)", "Total"]
        invoiceValueArray = ["$2","$4","$7","1","$18"]
        
        
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
    
    @IBAction func invoiceCancelButtonTapped(_ sender: Any) {
        self.view.removeBlurView()
        self.invoiceView.showAnimateView(self.invoiceView, isShow: false, direction: .Bottom)
    }
    
    @IBAction func invoiceConfirmButonTapped(_ sender: Any) {
        self.push(id: Storyboard.Ids.AddNewAddressViewController, animation: true)
        
    }
    
    @IBAction func selectGiftActiontapped(_ sender: Any) {
         setInvoiceframe()
        
    }
    
    
}
extension PlaceOrderViewController {
    
   
    private  func setInvoiceframe(){
        
        self.imageInvoice.layer.borderColor = UIColor.white.cgColor
        self.imageInvoice.layer.borderWidth = 5.0
        
//        self.invoiceView.frame = self.view.bounds
//        self.invoiceView.showAnimateView(self.invoiceView, isShow: true, direction: .Top)
//        self.viewVisualEffect.contentView.addSubview(self.invoiceView)
//
        
        self.view.addBlurview {
            self.invoiceView.frame = self.view.bounds
            self.invoiceView.showAnimateView(self.invoiceView, isShow: true, direction: .Top)
            self.view.addSubview(self.invoiceView)
        }
    }
    
    private func  loadShuduleNib(){
        
        //self.shuduleView.viewvisualEffect.frame = self.view.bounds
        //self.shuduleView.frame = self.view.bounds
        self.view.addBlurview {
            self.shuduleView = Bundle.main.loadNibNamed("SchuduleView", owner: self, options: nil)?.first as! SchuduleView
            self.shuduleView.frame = self.view.bounds
            self.shuduleView.showAnimateView(self.shuduleView, isShow: true, direction: .Top)
            self.view.addSubview(self.shuduleView)
            self.shuduleView.buttonConfirm.addTarget(self, action: #selector(self.confirmButtonTapped(button:)), for: .touchUpInside)
        }
        //self.invoiveTableView.scrollToRow(at: IndexPath(row: 0, section: 0), at: .top, animated: false)
        
    }
    @IBAction func buttonActionExpand(sender: UIButton){
        selectedIndex = sender.tag
        placeOrderTableView.reloadData()
      
        if isExpandable {
            isExpandable = false
            if sender.tag == 2{
                let indexPath = IndexPath(row: 2, section: 0)
                let cell = tableView(placeOrderTableView, cellForRowAt: indexPath) as! PaymentTableViewCell
                cell.paymentStackView.isHidden = false
            }
        }else{
            if sender.tag == 2{
                let indexPath = IndexPath(row: 2, section: 0)
                let cell = tableView(placeOrderTableView, cellForRowAt: indexPath) as! PaymentTableViewCell
                cell.paymentStackView.isHidden = true
            }
            isExpandable = true
        }
//        isExpandable = true
      
    }
    
    @objc private func confirmButtonTapped(button: UIButton){
        
        self.shuduleView.showAnimateView(self.shuduleView, isShow: false, direction: .Bottom)
        self.view.removeBlurView()
        
    }
}

extension PlaceOrderViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == invoiveTableView{
            return invoiceValueArray.count
        }else if tableView == placeOrderTableView{
            return 3
        }else {
            return 3
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == invoiveTableView {
            
            let invoiceCell = tableView.dequeueReusableCell(withIdentifier: "InvoicetableViewCell", for: indexPath) as! InvoicetableViewCell
            invoiceCell.labelSeletedItem.text = invoiceArray[indexPath.row] as? String
            invoiceCell.labelItemPrize.text = invoiceValueArray[indexPath.row] as? String
            return invoiceCell
        }else if tableView == placeOrderTableView{
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandableTableViewCell", for: indexPath) as! ExpandableTableViewCell
                cell.buttonExpand.tag = indexPath.row
                cell.buttonExpand.addTarget(self, action: #selector(buttonActionExpand(sender:)), for: .touchUpInside)
                return cell
            }else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ExpandableTableViewCell", for: indexPath) as! ExpandableTableViewCell
                cell.buttonExpand.tag = indexPath.row
                cell.buttonExpand.addTarget(self, action: #selector(buttonActionExpand(sender:)), for: .touchUpInside)
                
                return cell
            }else{
                let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentTableViewCell", for: indexPath) as! PaymentTableViewCell
                cell.buttonExpand.tag = indexPath.row
                cell.buttonExpand.addTarget(self, action: #selector(buttonActionExpand(sender:)), for: .touchUpInside)
                return cell
            }
            
            
        }else{
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
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == invoiveTableView {
            return 50.00
        }else if tableView == placeOrderTableView{
            if indexPath.row == selectedIndex{
                if isExpandable {
                    return 150.00
                }else{
                    return 300.00
                }
            }
            return 300.00
        }else{
            return 130.00
        }
    }
    
    
}

extension PlaceOrderViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GasIteamCollectionViewCell", for: indexPath) as! GasIteamCollectionViewCell
        return cell
    }
    

}


class GiftOrderTableViewCell: UITableViewCell {
    
    @IBOutlet var labelGiftName: UILabel!
    @IBOutlet var imageGift: UIImageView!
    
    
    override func awakeFromNib() {
        
    }
}


class InvoicetableViewCell: UITableViewCell {
    @IBOutlet var labelSeletedItem: UILabel!
    
    @IBOutlet var labelItemPrize: UILabel!
    override func awakeFromNib() {
        
    }
}


class ExpandableTableViewCell: UITableViewCell {
    
    @IBOutlet var buttonExpand: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

class PaymentTableViewCell : UITableViewCell {
    
    @IBOutlet var paymentStackView: UIStackView!
    @IBOutlet var buttonExpand: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}





class GasIteamCollectionViewCell : UICollectionViewCell {
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
