//
//  ViewController.swift
//  sample
//
//  Created by ARJUN's MacBook Pro on 27/05/18.
//  Copyright © 2018 tranxit. All rights reserved.
//

import UIKit

class AddNewAddressViewController: UIViewController {
    
    @IBOutlet var baseView: UIView!
    @IBOutlet var mainTableview: UITableView!
    @IBOutlet var viewThankYou: UIView!
    var array = ["1","2","3"]
    
    @IBOutlet var viewInvoice: UIView!
    var ThankYouview = ThankYouView()
    var ratingView = RatingView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainTableview.dataSource  = self;
        mainTableview.delegate = self;
        self.tapGustureInvoice()
    }
    
    
    @IBAction func placeOrderButtonTapped(_ sender: Any) {
        self.loadThankYouView()
        
    }
    
    
    @IBAction func AddNewAddressActionTapped(_ sender: Any) {
        self.push(id: Storyboard.Ids.AddAddressViewController, animation: true)
    }
    
    
}

extension AddNewAddressViewController {
    
    private func tapGustureInvoice(){
       
    }
    @IBAction private func thankYouViewtapped(sender: UITapGestureRecognizer){
        
        loadRatingNib()
    }
    
    private func  loadRatingNib(){
        
        self.view.addBlurview {
            self.ratingView = Bundle.main.loadNibNamed("RatingView", owner: self, options: nil)?.first as! RatingView
            self.ratingView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height )
            self.ratingView.showAnimateView(self.ratingView, isShow: true, direction: .Top)
            self.ratingView.buttonSubmit.addTarget(self, action: #selector(self.ratingSubmitButtonTapped(button:)), for: .touchUpInside)
            self.view.addSubview(self.ratingView)
        }
        
     
        
    
        
    }
    @IBAction private func ratingSubmitButtonTapped(button: UIButton){
        self.push(id: Storyboard.Ids.HomePageViewController, animation: true)
        
    }
    
    private func loadThankYouView(){
        
        self.view.addBlurview {
            self.ThankYouview = Bundle.main.loadNibNamed("ThankYouView", owner: self, options: nil)?.first as! ThankYouView
            self.ThankYouview.frame = self.view.bounds
            self.ThankYouview.showAnimateView(self.ThankYouview, isShow: true, direction: .Top)
            self.ThankYouview.isUserInteractionEnabled = true
            let gusture = UITapGestureRecognizer(target: self, action: #selector(self.thankYouViewtapped(sender:)))
            self.ThankYouview.addGestureRecognizer(gusture)
            
            self.view.addSubview(self.ThankYouview)
        }

      
    }
}

extension AddNewAddressViewController : UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0){
            let cell:CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "DeliveryAddress", for: indexPath) as! CustomTableViewCell
            cell.listarray = array as NSArray
            return cell
        }else{
            let cell:CustomTableViewCell = tableView.dequeueReusableCell(withIdentifier: "AdditionalInfo", for: indexPath) as! CustomTableViewCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 350
        }else{
            return 200
        }
    }
}




class  ViewAddressTableViewCell: UITableViewCell {
    override func awakeFromNib() {
        
    }
}

