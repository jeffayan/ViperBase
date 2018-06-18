//
//  MenuViewController.swift
//  Dongome_Provider
//
//  Created by CSS on 08/03/18.
//

import UIKit


class MenuViewController: UIViewController {
//MARK:- Outlets:
    @IBOutlet weak var menuTable: UITableView!
    
//MARK:- Declaration:
    var menuList = NSMutableArray()
    var profileData = NSDictionary()
    var menuListImage = NSMutableArray()
    var user_Id = NSString()
    var appedelegateInstance = AppDelegate()
   
//MARK:- viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        appedelegateInstance = UIApplication.shared.delegate as! AppDelegate
    }
//MARK:- viewWillAppear
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        menuTable.dataSource = self
        menuTable.delegate = self
        menuTable.tableFooterView = UIView()
        menuList = ["PROFILE","MY ORDERS","ADDRESS","REWARDS","SHARE","LOGOUT"]
        menuListImage = [#imageLiteral(resourceName: "user"),#imageLiteral(resourceName: "orders") ,#imageLiteral(resourceName: "address"),#imageLiteral(resourceName: "rewards") ,#imageLiteral(resourceName: "share") ,#imageLiteral(resourceName: "logout")]
        
        menuTable.reloadData()
    }
//MARK:- viewDidAppear
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
    }
//MARK:- Update Profile Data:
    func updateProfileData(){
        let data : NSData = UserDefaults.standard.value(forKey: "ProfileData") as! NSData
        profileData = NSKeyedUnarchiver.unarchiveObject(with: data as Data) as! NSDictionary
        user_Id = String(describing:profileData.value(forKey: "id")!) as NSString
        menuTable.reloadData()
    }
/*************/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
/*************************************************************/
//MARK:- Tableview Extension:
extension MenuViewController : UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if(indexPath.row == 0){
            return 250.0
        }
        return 70.0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuList.count+1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row == 0){
            let cell:headerCell = tableView.dequeueReusableCell(withIdentifier: "HeaderCell") as! headerCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.labelHeaderTitle.text = "Kumaresh"
            
            return cell
        }else{
            let cell:MenuTableViewCell = tableView.dequeueReusableCell(withIdentifier: "ListCell") as! MenuTableViewCell
            cell.selectionStyle = UITableViewCellSelectionStyle.none
            cell.ListTitle.text = menuList.object(at: indexPath.row-1) as? String
            cell.imageList.image = menuListImage[indexPath.row-1] as! UIImage
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row != 0){
            var ContentViewCoantroller = UIViewController()
            if(indexPath.row == 1){  //profile
                //ContentViewCoantroller = self.storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
            }else if(indexPath.row == 2){  //MyOrders
                //ContentViewCoantroller = self.storyboard?.instantiateViewController(withIdentifier: "MyOrderViewController") as! MyOrderViewController
            }else if(indexPath.row == 3){ //Address
               // ContentViewCoantroller = self.storyboard?.instantiateViewController(withIdentifier: "AddressLeftMenuViewController") as! AddressLeftMenuViewController
            }else if(indexPath.row == 4){ //Rewards
             
               //ContentViewCoantroller = self.storyboard?.instantiateViewController(withIdentifier: "RewardTableViewController") as! RewardTableViewController
                
            }else if indexPath.row == 5 { //share
                //ContentViewCoantroller = self.storyboard?.instantiateViewController(withIdentifier: "ShareViewController") as! ShareViewController
            }else { //logout
                //ContentViewCoantroller = self.storyboard?.instantiateViewController(withIdentifier: "SignInTableViewController") as! SignInTableViewController
            }
            
            let navigation = UINavigationController.init(rootViewController: ContentViewCoantroller)  //set Navigation
            self.frostedViewController.contentViewController = navigation
            self.frostedViewController.hideMenuViewController()
        }
        
    }

}

/********************************************** MenuTableViewCell **************************************/

//MARK:- Favorite TableView:
class MenuTableViewCell : UITableViewCell {
    
    @IBOutlet var imageList: UIImageView!
    //MARK:- Outlets:
    @IBOutlet weak var headerImage: UIImageView!
    @IBOutlet weak var headerTitle: UILabel!
    @IBOutlet weak var ListTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setcommonFont()
        
    }
    
   
    //MARK:- set common Font
    func setcommonFont(){
        
        setFont(TextField: nil, label: headerTitle, Button: nil, size:19)
        setFont(TextField: nil, label: ListTitle, Button: nil, size: 19 )
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

class headerCell: UITableViewCell {
    
    @IBOutlet var imageHeader: ImageView!
    
    @IBOutlet var labelHeaderTitle: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        setBorder()
    }
    func setBorder(){
        self.imageHeader.layer.borderColor = UIColor.white.cgColor
        self.imageHeader.layer.borderWidth = 5.0
        
        
    }
}
/*********************************************************************/
