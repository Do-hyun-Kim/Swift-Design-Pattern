//
//  MainTableViewCell.swift
//  Swift-Clean_Architecture
//
//  Created by Kim dohyun on 2022/05/17.
//

import UIKit


class MainTableViewCell: UITableViewCell {
    
    //MARK: Property
    static let reuseIdentifier: String = String(describing: MainTableViewCell.self)
    
    private var titleLabel: UILabel = {
        $0.textColor = .black
        $0.textAlignment = .left
        $0.font = .boldSystemFont(ofSize: 14)
        $0.numberOfLines = 0
        
        return $0
    }(UILabel())
    
    private var subTitleLabel: UILabel = {
        $0.textColor = .lightGray
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 9)
    
        return $0
    }(UILabel())
    
    private var patternLabel: UILabel = {
        $0.textColor = .darkGray
        $0.textAlignment = .center
        $0.numberOfLines = 1
        $0.font = .systemFont(ofSize: 9)
        
        return $0
    }(UILabel())
    
    
    //MARK: Initialize
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    //MARK: Configure
    private func configure() {
        [titleLabel,subTitleLabel,patternLabel].forEach {
            addSubview($0)
        }
        
    }
    
    
}
