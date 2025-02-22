//
//  AppDelegate.swift
//  ListAppMVVM
//
//  Created by Berk Ceylan on 22.02.2025.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        startScreen()
        return true
    }

    func startScreen(){
        window = UIWindow()
        let vc = MainVC()
        let viewModel = MainViewModel(service: NetworkManager())
        vc.viewModel = viewModel
        window?.rootViewController = UINavigationController(rootViewController: vc)
        window?.makeKeyAndVisible()
    }

}

