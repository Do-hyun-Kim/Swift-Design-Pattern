//
//  MainTableViewCell.swift
//  Dependency-MVVM
//
//  Created by Kim dohyun on 2022/05/12.
//

import UIKit


final class MainTableViewCell: UITableViewCell {
    
    private var titleLabel: UILabel = {
        $0.textColor = .black
        $0.font = .boldSystemFont(ofSize: 11)
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    private var subTitleLabel: UILabel = {
        $0.textColor = .lightGray
        $0.font = .systemFont(ofSize: 9)
        $0.textAlignment = .left
        $0.translatesAutoresizingMaskIntoConstraints = false
        return $0
    }(UILabel())
    
    static let reuseIdentifier = String(describing: MainTableViewCell.self)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    private func configure() {
        [titleLabel,subTitleLabel].forEach {
            addSubview($0)
        }
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        subTitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10).isActive = true
        subTitleLabel.leftAnchor.constraint(equalTo: titleLabel.leftAnchor).isActive = true
        subTitleLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
        subTitleLabel.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        backgroundColor = .white
    }
    
    public func bindUI(viewModel: MainViewModel, indexPath: IndexPath) {
        DispatchQueue.main.async { [weak self] in
            guard let `self` = self else { return }
            self.titleLabel.text = viewModel.mainEntities[indexPath.row].person
            self.subTitleLabel.text = "\(viewModel.mainEntities[indexPath.row].age)"
            print("Data \(viewModel.mainEntities)")
        }
    }
    
}
