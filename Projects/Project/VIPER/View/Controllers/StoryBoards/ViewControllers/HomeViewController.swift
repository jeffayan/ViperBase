    //
    //  HomeViewController.swift
    //  User
    //
    //  Created by CSS on 02/05/18.
    //  Copyright © 2018 Appoets. All rights reserved.
    //
    
    import UIKit
    import Foundation
    
    class HomeViewController: UIViewController {
        
        @IBOutlet private var viewSideMenu : UIView!

        override func viewDidLoad() {
            super.viewDidLoad()
            self.initialLoads()
            
        }
     
    }
    
    // MARK:- Methods
    
    extension HomeViewController {
        
        private func initialLoads() {
            self.viewSideMenu.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.sideMenuAction)))
        }
        
        // MARK:- SideMenu Button Action
        
        @IBAction private func sideMenuAction(){
            
                self.drawerController?.openSide(.left)
                self.viewSideMenu.addPressAnimation()
         }
        
    }
    
    // MARK:- PostViewProtocol
    
    extension HomeViewController : PostViewProtocol {
        
        func onError(api: Base, message: String, statusCode code: Int) {
            
            DispatchQueue.main.async {
                showAlert(message: message, okHandler: nil, fromView: self)
            }
        }
        
        
    }
    
    
    
