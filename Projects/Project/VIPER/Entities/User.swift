//
//  User.swift
//  User
//
//  Created by CSS on 17/01/18.
//  Copyright © 2018 Appoets. All rights reserved.
//


import Foundation

class User : NSObject, NSCoding, JSONSerializable {
    
    static var main = User()
    
    //@objc dynamic var id = 0
    
    var id : Int?
    var name : String?
    var accessToken : String?
    var latitude : Double?
    var lontitude : Double?
    
    
    
    
    init(id : Int?, name : String?, accessToken: String?, latitude: Double?, lontitude: Double?){
                
        self.id = id
        self.name = name
        self.accessToken = accessToken
        self.latitude = latitude
        self.lontitude = lontitude
      
    }
    
    convenience
    override init(){
        self.init(id: nil, name: nil, accessToken: nil,latitude: nil, lontitude: nil)
    }
    
    
    required convenience init?(coder aDecoder: NSCoder) {
        
        let id = aDecoder.decodeObject(forKey: Keys.list.id) as? Int
        let name = aDecoder.decodeObject(forKey: Keys.list.name) as? String
        let accessToken = aDecoder.decodeObject(forKey: Keys.list.accessToken) as? String
        let latitude = aDecoder.decodeObject(forKey: Keys.list.latitude) as? Double
        let lontitude = aDecoder.decodeObject(forKey: Keys.list.lontitude) as? Double
        
        self.init(id: id, name: name, accessToken: accessToken,latitude: latitude, lontitude: lontitude)
        
    }
    
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(self.id, forKey: Keys.list.id)
        aCoder.encode(self.name, forKey: Keys.list.name)
        aCoder.encode(self.accessToken, forKey: Keys.list.accessToken)
        aCoder.encode(self.lontitude, forKey: Keys.list.lontitude)
        aCoder.encode(self.latitude, forKey: Keys.list.latitude)
    }
    
    
  
   
}









