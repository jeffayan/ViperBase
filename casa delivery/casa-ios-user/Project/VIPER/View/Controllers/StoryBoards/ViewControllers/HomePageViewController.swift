//
//  HomePageViewController.swift
//  Goheavy
//
//  Created by CSS on 26/05/18.
//  Copyright © 2018 css. All rights reserved.
//

import UIKit

class HomePageViewController: UIViewController {
    @IBOutlet var imageDelivery: UIImageView!
    
    @IBOutlet var viewplace: UIView!
    @IBOutlet var viewPhone: UIView!
    @IBOutlet var viewSelectday: UIView!
    @IBOutlet var aguaBookingColletionView: UICollectionView!
    @IBOutlet var monthCollectionView: UICollectionView!
    
    @IBOutlet var buttonSetAlert: UIButton!
    @IBOutlet var homeTableView: UITableView!
    var selectedIndex = -1
    var selectedindexAuga = -1
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false
        // Do any additional setup after loading the view.
        //self.viewSelectday.isHidden = true
        //setAlertButtonTapped()
    }
    
    @IBAction func OrderOnlineAction(_ sender: Any) {
        self.push(id: Storyboard.Ids.PlaceOrderViewController, animation: true)
    }
    
    @IBAction func OrderbyWhatsApp(_ sender: Any) {
        self.push(id: Storyboard.Ids.AddNewAddressViewController, animation: true)
    }
    
    @IBAction func MenuActionTapped(_ sender: Any) {
        self.frostedViewController.view.endEditing(true)
        self.frostedViewController.presentMenuViewController()
    }
    
}

extension HomePageViewController {
    
    @objc private func alarmActionTapped(sender: UITapGestureRecognizer){
        
        //let section = sender.tag / 100
        //let row = sender % 100
//        let indexPath = IndexPath(row: 2, section: 0)
//
//        let cell = tableView(homeTableView, cellForRowAt: indexPath) as! AlarmTableViewCell
//        cell.
        
        self.viewSelectday.showAnimateView(self.viewSelectday, isShow: true, direction: .Top)
        
    }
    
    private func setAlertButtonTapped(){
        
        self.buttonSetAlert.addTarget(self, action: #selector(alertButtonTapped(button:)), for: .touchUpInside)
    }
    
    @IBAction private func alertButtonTapped(button: UIButton){
        self.viewSelectday.showAnimateView(self.viewSelectday, isShow: false, direction: .Bottom)
        
    }
    
}
extension HomePageViewController : UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
        let placeOrderCell = tableView.dequeueReusableCell(withIdentifier: "PlaceOrderTableViewCell", for: indexPath) as! PlaceOrderTableViewCell
            placeOrderCell.ButtonOnline.addTarget(self, action: #selector(OrderOnlineAction), for: .touchUpInside)
        return placeOrderCell
        }else if indexPath.row == 1 {
            let adCell = tableView.dequeueReusableCell(withIdentifier: "AdvertisementTableViewCell", for: indexPath) as! AdvertisementTableViewCell
            return adCell
            
        }else {
            let alarmCell = tableView.dequeueReusableCell(withIdentifier: "AlarmTableViewCell", for: indexPath) as! AlarmTableViewCell
            
            let tapgusture = UITapGestureRecognizer(target: self, action: #selector(alarmActionTapped(sender:)))
            alarmCell.imageAlarm.tag = indexPath.row
            alarmCell.imageAlarm.addGestureRecognizer(tapgusture)
            return alarmCell
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 350.00
        }else if indexPath.row == 1 {
            return 165.00
        }else {
            return 95.00
        }
    }
    
}

extension HomePageViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if (collectionView == monthCollectionView) {
             return 31
        }else if collectionView == aguaBookingColletionView{
             return 31
        }else {
            return 4
        }
       
    }
    
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    if collectionView == monthCollectionView {
        return 1
    }else if collectionView == aguaBookingColletionView {
        return 1
    }else {
        return 1
    }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == monthCollectionView {
            let monthCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MonthSelectionCollectionViewCell", for: indexPath) as! MonthSelectionCollectionViewCell
            monthCell.labelDay.text = "\(indexPath.row)"
            
            monthCell.viewBackGround.backgroundColor = selectedIndex == indexPath.row ? UIColor(red: 218/255, green: 95/255, blue: 90/255, alpha: 1): UIColor(red: 248/255, green: 247/255, blue: 246/255, alpha: 1)
            monthCell.labelDay.textColor = selectedIndex == indexPath.row ? UIColor.white : UIColor.lightGray
            
            return monthCell
        }else if collectionView == aguaBookingColletionView {
            let adCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MonthSelectionCollectionViewCell", for: indexPath) as! MonthSelectionCollectionViewCell
            adCell.labelDay.text = "\(indexPath.row)"
            adCell.viewBackGround.backgroundColor = selectedindexAuga == indexPath.row ? UIColor(red: 218/255, green: 95/255, blue: 90/255, alpha: 1): UIColor(red: 248/255, green: 247/255, blue: 246/255, alpha: 1)
            adCell.labelDay.textColor = selectedindexAuga == indexPath.row ? UIColor.white : UIColor.lightGray
            
            
            return adCell
        }else {
            let adCell = collectionView.dequeueReusableCell(withReuseIdentifier: "AdvertisementCollectionView", for: indexPath) as! AdvertisementCollectionView
            
            return adCell
        }
       
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == monthCollectionView {
            self.selectedIndex = indexPath.row
            self.monthCollectionView.reloadData()

        }else if collectionView == aguaBookingColletionView {
            
            selectedindexAuga = indexPath.row
            self.aguaBookingColletionView.reloadData()
          
        }
    }
    
    
    
    
}




class  PlaceOrderTableViewCell: UITableViewCell {
    
    @IBOutlet var ButtonOnline: UIButton!
    @IBOutlet var viewImagePhone: UIView!
    @IBOutlet var viewPlaceOrder: UIView!
    @IBOutlet var imagePlaceOrder: UIImageView!
    override func awakeFromNib() {
        setRound()
    }
    @IBOutlet var imagePhone: UIImageView!
    
    @IBOutlet var imageWhatsapp: UIImageView!
    
    @IBOutlet var imageOnline: UIImageView!
    
    private func setRound(){
        
        self.imagePlaceOrder.cornerRadius = self.imagePlaceOrder.frame.height / 2
        self.imagePlaceOrder.clipsToBounds = true
        
        self.viewPlaceOrder.cornerRadius = self.viewPlaceOrder.frame.height / 2
        self.viewPlaceOrder.clipsToBounds = true
        
        
        self.viewImagePhone.makeRoundedCorner()
//        self.imagePlaceOrder.layer.borderColor = UIColor.white.cgColor
//        self.imagePlaceOrder.layer.borderWidth = 5.0
        
    }
    
}

class AdvertisementTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        
    }
}

class AlarmTableViewCell: UITableViewCell {
    @IBOutlet var imageAlarm: ImageView!
    override func awakeFromNib() {
        imageAlarm.isUserInteractionEnabled = true
    }
}




class AdvertisementCollectionView: UICollectionViewCell {
    
    override func awakeFromNib() {
        
    }
}


class MonthSelectionCollectionViewCell: UICollectionViewCell  {
    @IBOutlet var labelDay: UILabel!
    @IBOutlet var viewBackGround: UIView!
    override func awakeFromNib() {
        
        self.viewBackGround.bringSubview(toFront: labelDay)
        
    }
}

