//
//  SignInViewController.swift
//  DemoLumiq
//
//  Created by Mobikasa on 5/31/19.
//  Copyright © 2019 Ashutosh. All rights reserved.
//

import Foundation
import UIKit


class AppInitializer: NSObject{
    static let shared = AppInitializer()
    private override init() {
    }
    //MARK:- Set initial function that call from app delegate
    func setInitials() {
        
        let defaults = UserDefaults.standard
        let isUserLoggedIn = defaults.bool(forKey: "isUserLoggedIn")
        
        if(isUserLoggedIn) {
            moveToHomeScreen()
        }else{
            moveToLandingScreen()
        }
    }
    
    //MARK:- Move to main screen
    func moveToHomeScreen(){
        let mainStoryboard = UIStoryboard(name: "Main" , bundle: nil)
        let MainViewController = mainStoryboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        createRootViewWith(rootView: MainViewController)
    }
    //MARK:- Move to sign in screen
    func moveToLandingScreen(){
        let mainStoryboard = UIStoryboard(name: "Main" , bundle: nil)
        let signInViewController = mainStoryboard.instantiateViewController(withIdentifier: "SignInViewController") as! SignInViewController
        let navVC = UINavigationController.init(rootViewController: signInViewController)
        createRootViewWith(rootView: navVC)
        
    }
    
    
    fileprivate func createRootViewWith(rootView:UIViewController) {
        AppDelegate.shared.window?.rootViewController = rootView
        AppDelegate.shared.window?.makeKeyAndVisible()
    }
    
    
}
