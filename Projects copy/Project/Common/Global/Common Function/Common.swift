//
//  Common.swift
//  User
//
//  Created by imac on 1/1/18.
//  Copyright © 2018 Appoets. All rights reserved.
//

import UIKit

class Common {
    
    class func isValid(email : String)->Bool{
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@","[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}")
        return emailTest.evaluate(with: email)
        
    }
    
    class func getBackButton()->UIBarButtonItem{
        let backItem = UIBarButtonItem()
        backItem.title = "Back"
        return backItem// This will show in the next view controller being pushed
    }
    
//    class func GMSAutoComplete(fromView : GMSAutocompleteViewControllerDelegate?)->GMSAutocompleteViewController{
//
//    let gmsAutoCompleteFilter = GMSAutocompleteFilter()
//    gmsAutoCompleteFilter.country =  GMSCountryCode
//    gmsAutoCompleteFilter.type = .city
//    let gmsAutoComplete = GMSAutocompleteViewController()
//    gmsAutoComplete.delegate = fromView
//    gmsAutoComplete.autocompleteFilter = gmsAutoCompleteFilter
//    return gmsAutoComplete
//    }
    
    
    class func getCurrentCode()->String?{
        
       return (Locale.current as NSLocale).object(forKey:  NSLocale.Key.countryCode) as? String
  
    }
    
    class  func datePickerTapped(Textcolor: UIColor, MaxDate:Date, ButtonColor: UIColor,label: UILabel ) {
        let currentDate = Date()
        var dateComponents = DateComponents()
        dateComponents.year = -60
        let threeMonthAgo = Calendar.current.date(byAdding: dateComponents, to: currentDate)
        
        let datePicker = DatePickerDialog(textColor: Textcolor,
                                          buttonColor: ButtonColor,
                                          font: UIFont.boldSystemFont(ofSize: 17),
                                          showCancelButton: true)
        datePicker.show("DatePickerDialog",
                        doneButtonTitle: "Done",
                        cancelButtonTitle: "Cancel",
                        minimumDate: threeMonthAgo,
                        maximumDate: nil,
                        datePickerMode: .date) { (date) in
                            if let dt = date {
                                let formatter = DateFormatter()
                                formatter.dateFormat = "MM/dd/yyyy"
                               // Button.setTitle(formatter.string(from: dt), for: .normal)
                                label.text = formatter.string(from: dt)
                            }
        }
    }
    
    class  func TimePickerTapped(Textcolor: UIColor, MaxDate:Date ,ButtonColor: UIColor,label : UILabel ) {
        let currentDate = Date()
        var dateComponents = DateComponents()
        dateComponents.year = -60
        let threeMonthAgo = Calendar.current.date(byAdding: dateComponents, to: currentDate)
        
        let datePicker = DatePickerDialog(textColor: Textcolor,
                                          buttonColor: ButtonColor,
                                          font: UIFont.boldSystemFont(ofSize: 17),
                                          showCancelButton: true)
        datePicker.show("DatePickerDialog",
                        doneButtonTitle: "Done",
                        cancelButtonTitle: "Cancel",
                        minimumDate: nil,
                        maximumDate: nil,
                        datePickerMode: .time) { (date) in
                            if let dt = date {
                                let formatter = DateFormatter()
                                formatter.dateFormat = "HH:mm"
                               // Button.setTitle(formatter.string(from: dt), for: .normal)
                                label.text = formatter.string(from: dt)
                            }
        }
    }
    
    
    
    
    
    
    //MARK:- Get Countries from JSON
    
    class func getCountries()->[Country]{
        
        var source = [Country]()
        
        if let data = NSData(contentsOfFile: Bundle.main.path(forResource: "countryCodes", ofType: "json") ?? "") as Data? {
            do{
                source = try JSONDecoder().decode([Country].self, from: data)
                
            } catch let err {
                print(err.localizedDescription)
            }
        }
        return source
    }
    
    
    
    class func getRefreshControl(intableView tableView : UITableView, tintcolorId  : Int = Color.primary.rawValue, attributedText text : NSAttributedString? = nil)->UIRefreshControl{
       
        let rc = UIRefreshControl()
        rc.tintColorId = tintcolorId
        rc.attributedTitle = text
        tableView.addSubview(rc)
        return rc
        
    }
        
}
