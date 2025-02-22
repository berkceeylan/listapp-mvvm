//
//  TableViewCell.swift
//  ListAppMVVM
//
//  Created by Berk Ceylan on 22.02.2025.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    static let identifier = "cell"
    let nameLabel = UILabel()
    let eMailLabel = UILabel()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupSubView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupSubView(){
        nameLabel.textColor = .mainVCTextColor
        nameLabel.font = .mainVCLabelFont
        addSubview(nameLabel)
        nameLabel.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(10)
            make.top.equalToSuperview().offset(15)
        }
        
        eMailLabel.textColor = .mainVCTextColor
        eMailLabel.font = .mainVCLabelFont
        addSubview(eMailLabel)
        eMailLabel.snp.makeConstraints { make in
            make.left.equalTo(nameLabel)
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
        }
        
    }

}
