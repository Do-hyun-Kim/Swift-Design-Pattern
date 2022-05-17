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
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        return $0
    }(UILabel())
    
    private var subTitleLabel: UILabel = {
        $0.textColor = .lightGray
        $0.textAlignment = .left
        $0.numberOfLines = 0
        $0.font = .systemFont(ofSize: 9)
        $0.lineBreakMode = .byTruncatingTail
        $0.translatesAutoresizingMaskIntoConstraints = false
    
        return $0
    }(UILabel())
    
    private var patternLabel: UILabel = {
        $0.textColor = .darkGray
        $0.textAlignment = .center
        $0.numberOfLines = 1
        $0.font = .systemFont(ofSize: 9)
        $0.translatesAutoresizingMaskIntoConstraints = false
        
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
        self.backgroundColor = .white
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        titleLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 100).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        subTitleLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        subTitleLabel.widthAnchor.constraint(lessThanOrEqualToConstant: 300).isActive = true
        subTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        patternLabel.topAnchor.constraint(equalTo: subTitleLabel.bottomAnchor, constant: 10).isActive = true
        patternLabel.leftAnchor.constraint(equalTo: subTitleLabel.leftAnchor).isActive = true
        patternLabel.widthAnchor.constraint(equalToConstant: 40).isActive = true
        patternLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
    }
    
    public func bind(viewmodel: MainViewModel, indexPath: IndexPath) {
        DispatchQueue.main.async { [self] in
            titleLabel.text = viewmodel.entities[indexPath.row].title
            subTitleLabel.text = viewmodel.entities[indexPath.row].subTitle
            patternLabel.text = viewmodel.entities[indexPath.row].pattern
        }
        
    }
    
    
}
