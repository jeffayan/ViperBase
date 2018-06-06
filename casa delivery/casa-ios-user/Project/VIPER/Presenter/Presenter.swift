//
//  Presenter.swift
//  User
//
//  Created by imac on 12/19/17.
//  Copyright © 2017 Appoets. All rights reserved.
//

import Foundation


class Presenter  {
    
    var interactor: PostInteractorInputProtocol?
    var controller: PostViewProtocol?
}

//MARK:- Implementation PostPresenterInputProtocol

extension Presenter : PostPresenterInputProtocol {

    func put(api: Base, url: String, data: Data?) {
        interactor?.send(api: api, url: url, data: data, type: .PUT)
    }
    
    func delete(api: Base, url: String, data: Data?) {
        interactor?.send(api: api, url: url, data: data, type: .DELETE)
    }
    
    func patch(api: Base, url: String, data: Data?) {
        interactor?.send(api: api, url: url, data: data,type: .PATCH)
    }
    
    func post(api: Base, data: Data?) {
        interactor?.send(api: api, data: data, paramters: nil, type: .POST)
    }
    
    func get(api: Base, parameters: [String : Any]?) {
        interactor?.send(api: api, data: nil, paramters: parameters, type: .GET)
    }
    
    func get(api : Base, url : String){
        
        interactor?.send(api: api, url: url, data: nil, type: .GET)

    }
    
    func post(api: Base, imageData: [String : Data]?, parameters: [String : Any]?) {
        interactor?.send(api: api, imageData: imageData, parameters: parameters)
    }
   
    
    func post(api: Base, url: String, data: Data?) {
        interactor?.send(api: api, url: url, data: data,type: .POST)
    }
    
}


//MARK:- Implementation PostPresenterOutputProtocol

extension Presenter : PostPresenterOutputProtocol {
    func onError(api: Base, error: CustomError) {
        print(error)
    }
    
//    func sendOnlineStatus(api: Base, data: Data) {
//        controller?.getOnlineStatus(api: api, data: PresenterProcessor.shared.OnlineStatus(data: data))
//    }
//    
//    func sendLocationupadate(api: Base, date: Data) {
//        controller?.getLoactionUpadate(api: api, data: PresenterProcessor.shared.updateLocation(data: date))
//    }
//    
//    func sendResetPassword(api: Base, data: Data) {
//        controller?.getResetpassword(api: api, data: PresenterProcessor.shared.resetPassword(data: data))
//    }
//    
//    
//    func sendlogin(api: Base, data: Data) {
//        controller?.getLogin(api: api, data: PresenterProcessor.shared.login(data: data))
//    }
//    
//    
    func SendAuth(api: Base, data: Data) {
        controller?.getAuth(api: api, data: PresenterProcessor.shared.signUpAuth(data: data))
    }
//
//    func onError(api: Base, error: CustomError) {
//        
//        controller?.onError(api: api, message: error.localizedDescription , statusCode: error.statusCode)
//    }
    
}


