//
//  Protocol.swift
//  Centros_Camprios
//
//  Created by imac on 12/18/17.
//  Copyright © 2017 Appoets. All rights reserved.
//

import Foundation

//MARK:- Web Service Protocol

protocol PostWebServiceProtocol : class {
    
    var interactor : PostInteractorOutputProtocol? {get set}
    
    var completion : ((CustomError?, Data?)->())? {get set}
    
    func retrieve(api : Base, url : String?, data : Data?, imageData: [String : Data]?, type : HttpType, completion : ((CustomError?, Data?)->())?)
    
}


//MARK:- Interator Input

protocol PostInteractorInputProtocol : class {
    
    var webService : PostWebServiceProtocol? {get set}
    
    func send(api : Base, data : Data?, type : HttpType)
    
    func send(api : Base, imageData : [String : Data]?, data : Data?)
    
    func send(api : Base, url : String, data : Data?, type : HttpType)
    
}


//MARK:- Interator Output

protocol PostInteractorOutputProtocol : class {
    
    var presenter : PostPresenterOutputProtocol? {get set}
    
    func on(api : Base, response : Data)
    
    func on(api : Base, error : CustomError)
    
}


//MARK:- Presenter Input

protocol PostPresenterInputProtocol : class {
    
    var interactor : PostInteractorInputProtocol? {get set}
    
    var controller : PostViewProtocol? {get set}
    /**
     Send POST Request
     @param api Api type to be called
     @param data HTTP Body
     */
    func post(api : Base, data : Data?)
    /**
     Send GET Request
     @param api Api type to be called
     @param parameters paramters to be send in request
     */
    
    func get(api : Base, data : Data?)
    
    /**
     Send GET Request
     @param api Api type to be called
     @param url : Custom url without base Url Eg : </api/user/{id}>
     */
    
    func get(api : Base, url : String)
    
    /**
     Send POST Request
     @param api Api type to be called
     @param imageData : Image to be sent in multipart
     @param parameters : params to be sent in multipart
     */
    func post(api : Base, imageData : [String : Data]?, data : Data?)
    
    /**
     Send put Request
     @param api Api type to be called
     @param url : Custom url without base Url Eg : </api/user/{id}>
     @param data HTTP Body
     */
    func put(api : Base, url : String, data : Data?)
    
    /**
     Send delete Request
     @param api Api type to be called
     @param url : Custom url without base Url Eg : </api/user/{id}>
     @param data HTTP Body
     */
    func delete(api : Base, url : String, data : Data?)
    
    /**
     Send patch Request
     @param api Api type to be called
     @param url : Custom url without base Url Eg : </api/user/{id}>
     @param data HTTP Body
     */
    func patch(api : Base, url : String, data : Data?)
    
    /**
     Send Post Request
     @param api Api type to be called
     @param url : Custom url without base Url Eg : </api/user/{id}>
     @param data HTTP Body
     */
    func post(api : Base, url : String, data : Data?)
    
    
}


//MARK:- Presenter Output

protocol PostPresenterOutputProtocol : class {
    
    func onError(api : Base, error : CustomError)
    
}


//MARK: - View

protocol PostViewProtocol : class {
    
    var presenter : PostPresenterInputProtocol? {get set}
    
    func onError(api : Base, message : String, statusCode code : Int)

}

//MARK: - View

extension PostViewProtocol {
    
    var presenter: PostPresenterInputProtocol? {
        
        get {
            presenterObject?.controller = self
            self.presenter = presenterObject
            return presenterObject
        }
        set(newValue){
            
            presenterObject = newValue
        }
        
    }
}

// MARK:- View Structure
protocol UIViewStructure {
    //Responsible for initialization of all variables and data to be initiated only once
    func initalLoads()
    
    // All View Localization to be completely implemented here
    func localize()
    
    // Font Design Color and font handling to here implemented here
    func design()
    
    // All Constraint and size handling to be written here
    func layouts()
}



