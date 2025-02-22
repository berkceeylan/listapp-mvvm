//
//  DetailVC.swift
//  ListAppMVVM
//
//  Created by Berk Ceylan on 22.02.2025.
//

import UIKit
import SnapKit

class DetailVC: UIViewController {
    var user: User?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        self.title = "Detail"
        setupUI()
        
    }
    deinit {
        print("Deinit for DetailVC")
    }
    func setupUI(){
        guard let user = user else {
            print("Veriler yok")
            return
        }
        
        let infoView = InfoView(name: user.name, email: user.email, phone: user.phone, website: user.website)
        view.addSubview(infoView)
        infoView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
   
}
