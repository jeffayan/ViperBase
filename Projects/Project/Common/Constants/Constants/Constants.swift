//
//  Constants.swift
//  Centros_Camprios
//
//  Created by imac on 12/18/17.
//  Copyright © 2017 Appoets. All rights reserved.
//

import UIKit

typealias ViewController = (UIViewController & PostViewProtocol)
var presenterObject : PostPresenterInputProtocol?


//MARK:- Constant Strings

struct Constants {
    
    static let string = Constants()
    
    let Done = "Done"
    let Back = "Back"
   
    let noDevice = "no device"
    
    let manual = "manual"
    let OK = "OK"
    let Cancel = "Cancel"
    let NA = "NA"
    let MobileNumber = "Mobile Number"
    let next = "Next"
    let selectSource = "Select Source"
    let camera = "Camera"
    let photoLibrary = "Photo Library"
    let logout = "Logout"
    let cannotMakeCallAtThisMoment = "Cannot make call at this moment"
    let couldnotOpenEmailAttheMoment = "Could not open Email at the moment."
    let areYouSureWantToLogout = "Are you want to logout?"


}

//Defaults Keys

struct Keys {
    
    static let list = Keys()
    let userData = "userData"
    
    let id = "id"
    let name = "name"
    let accessToken = "access_token"
    let latitude = "latitude"
    let lontitude = "lontitude"
    let coOrdinates = "coOrdinates"
    let firstName = "firstName"
    let lastName = "lastName"
    let picture = "picture"
    let email = "email"
    let mobile = "mobile"
    
}





// Date Formats

struct DateFormat {
    
    static let list = DateFormat()
    let yyyy_mm_dd_HH_MM_ss = "yyyy-MM-dd HH:mm:ss"
    let MMM_dd_yyyy_hh_mm_ss_a = "MMM dd, yyyy hh:mm:ss a"
}



// Devices

enum DeviceType : String, Codable {
    
    case ios = "ios"
    case android = "android"
    
}


enum Language : String {
    
    case english = "en"
    case spanish = "es"
    
}



enum defaultSystemSound : Float {
    case peek = 1519
    case pop = 1520
    case cancelled = 1521
    case tryAgain = 1102
    case Failed = 1107
}





