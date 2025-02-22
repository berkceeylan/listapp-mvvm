//
//  InfoView.swift
//  ListAppMVVM
//
//  Created by Berk Ceylan on 22.02.2025.
//


import UIKit
import SnapKit

class InfoView: UIView {
    let name: String?
    let email: String?
    let phone: String?
    let website: String?
    
    init(name: String?, email: String?, phone: String?, website: String?) {
        self.name = name
        self.email = email
        self.phone = phone
        self.website = website
        super.init(frame: .zero)
        setupSubView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupSubView(){
        lazy var nameLabel = UILabel()
        nameLabel.text = name
        nameLabel.font = .detailVCLabelFont
        nameLabel.textColor = .detailVCTextColor
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(20)
            make.left.equalToSuperview().offset(20)
            
        }
        
        lazy var emailLabel = UILabel()
        emailLabel.text = email
        emailLabel.font = .detailVCLabelFont
        emailLabel.textColor = .detailVCTextColor
        addSubview(emailLabel)
        emailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.left.equalTo(nameLabel)
            
        }
        
        lazy var phoneLabel = UILabel()
        phoneLabel.text = phone
        phoneLabel.font = .detailVCLabelFont
        phoneLabel.textColor = .detailVCTextColor
        addSubview(phoneLabel)
        phoneLabel.snp.makeConstraints { make in
            make.top.equalTo(emailLabel.snp.bottom).offset(5)
            make.left.equalTo(nameLabel)
            
        }
        
        lazy var websiteLabel = UILabel()
        websiteLabel.text = website
        websiteLabel.font = .detailVCLabelFont
        websiteLabel.textColor = .detailVCTextColor
        addSubview(websiteLabel)
        websiteLabel.snp.makeConstraints { make in
            make.top.equalTo(phoneLabel.snp.bottom).offset(5)
            make.left.equalTo(nameLabel)
            
        }
        
    }
    
    
    
    
}
