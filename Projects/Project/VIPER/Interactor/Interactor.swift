//
//  Interactor.swift
//  User
//
//  Created by imac on 12/19/17.
//  Copyright © 2017 Appoets. All rights reserved.
//

import Foundation

class Interactor  {
    
    var webService: PostWebServiceProtocol?
    
    var presenter: PostPresenterOutputProtocol?
    
}

//MARK:- PostInteractorInputProtocol

extension Interactor : PostInteractorInputProtocol {
    
    func send(api: Base, imageData: [String : Data]?, data: Data?) {
        webService?.retrieve(api: api,url: nil, data: data, imageData: imageData, type: .POST, completion: nil)
    }
    func send(api: Base, url: String, data: Data?, type: HttpType) {
        webService?.retrieve(api: api,url: url, data: data, imageData: nil, type: type, completion: nil)
    }
    func send(api: Base, data: Data?, type: HttpType) {
        webService?.retrieve(api: api, url: nil, data: data, imageData: nil, type: type, completion: nil)
    }
    
}


extension Interactor : PostInteractorOutputProtocol {

    func on(api: Base, response: Data) {
        
        switch api {
        case .signUp:
            //self.presenter?.SendAuth(api: api, data: response)
            break
        default :
            break
            
        }
    }
    
    func on(api: Base, error: CustomError) {
        
        presenter?.onError(api: api, error: error)
        
    }
    
    
}

