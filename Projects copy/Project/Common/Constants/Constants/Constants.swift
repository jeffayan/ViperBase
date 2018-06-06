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
    let walkthrough = "Walkthrough"
    let signIn = "SIGN IN"
    let signUp = "SIGNUP"
    let orConnectWithSocial = "Or connect with social"
    let walkthroughDummy = """
      Lorem Ipsum is simply dummy text of the printing and typesetting industry.
    Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,
     when an unknown printer took a galley of type and scrambled it to make a
    type specimen book. It has survived not only five centuries, but also the leap
    into electronic typesetting, remaining essentially unchanged.It
    was popularised in the 1960s with the release of Letraset sheets
    containing Lorem Ipsum passages, and more recently with desktop publishing
    software like Aldus PageMaker including versions of Lorem Ipsum
    """
    let emailPlaceHolder = "name@example.com"
    let email = "Email"
    let iNeedTocreateAnAccount = "I need to create an account"
    let whatsYourEmailAddress = "What's your Email Address?"
    let welcomeBackPassword = "Welcome back, sign in to continue"
    let enterPassword = "Enter Password"
    let password = "Password"
    let iForgotPassword = "I forgot my password"
    let enterYourMailIdForrecovery = "Enter your mail ID for recovery"
    let chooseAnAccount = "Choose an account"
    let facebook = "Facebook"
    let google = "Google"
    let payment = "Payment"
    let yourTrips = "Your Trips"
    let Earnings = "Earnings"
    let Summary = "Summary"
    let document = "Document"
    let passbook = "Passbook"
    let settings = "Settings"
    let help = "Help"
    let share = "Share"
    let inviteReferral = "Invite Referral"
    let faqSupport = "FAQ Support"
    let termsAndConditions = "Terms and Conditions"
    let privacyPolicy = "Privacy Policy"
    let logout = "Logout"
    let firsrName = "FirstName"
    let lastName = "LastName"
    let phoneNumber = "PhoneNumber"
    let vehicleMake = "VehicleMake"
    let vehicleModel = "VehicleModel"
    let vehicleYear = "VehicleYear"
    
    let vehicleColor = "VehicleColor"
    let vehiclePlateNumber = "VehiclePlateNumber"
    let city = "City"
    let carcategory = "Car Category"
    let referralCode = "Referral Code"
    let signUpNavTitle = "Enter the Details"
    let notes = "Note: Please enter the OTP sent to your registered email address"
    let enterOTP = "Enter OTP"
    let enterNewPwd = "New Password"
    let oldPassword = "Old Password"
    let resetPassword = "Reset password"
    
    let ConfirmPassword = "Confirm Password"
    let country = "Country"
    let timeZone = "Time Zone"
    let business = "BUsiness"
    let personal = "Personal"
    
    
//MARK:- sucess messages
    
    let loginSucess = "Login Sucessfully"
    
    
//MARK:- Invide referral page
    
    let title = "Invide Refreral"
    let referYourFriend = "Refer your friends to drive!"
    let givenFreeRide = "Given the free ride by reffering the invide code worth 10BCM"
    let shareYourCode = "Share your Invide code"
    let refferalEarning = "Refferal Earning"
    let totalMembers = "Total Members"
    let invideFriends = "INVITE FRIENDS"
    
    
//MARK:- Summary page
    
    let totalNoOfRides = "TOTAL NO OF RIDES"
    let revenue = "REVENUE"
    let schueduleRides = "NO OF SCHEDULED RIDES"
    let cancelRides = "CANCELLED RIDES"
    
//MARK:- Document page
    
    let vehicleRegistration = "Vehicle Registration"
    let legalStatus = "Legal Status"
    let drivingAbstarct = "Driving Abstarct"
    let criminalRecord = "Criminal Record"
    let submit = "SUBMIT"
    let documents = "DOCUMENTS"
    
//MARK:- yourTrip Page
    
    let yourtrips = "Your trips"
    let past = "Past"
    let upcomming = "Upcomming"
    
    //MARK:- user invoice page
    
    let bookingId = "Booking ID"
    let distancetravelled = "Distance travelled"
    let timetaken = "Time Taken"
    let baseFare = "Base Fare"
    let distanceFare  = "Distance Fare"
    let tax = "Tax"
    let tips = "Tips"
    let total = "Total"
    let invoice = "Invoice"
    let cash = "Cash"
    let payNow = "PAY NOW"
    
    
}

struct constantsArrry {
    static let array = constantsArrry()
    
    let invoiceArray = ["Booking ID","Distance travelled","Time Taken","Base Fare","Distance Fare","Tax","Tips","Total"]
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
    
}

//ENUM STATUS

enum Status : String {
    case ONLINE = "ONLINE"
    case OFFLINE = "OFFLINE"
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

enum tripType: String {
    case Business = "Besiness"
    case Personal = "Personal"
}




