//
//  TableViewCell.swift
//  BuildingUIKitProgrammatically002
//
//  Created by Alexander Simvolokov on 12.11.2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    static let identifier = "MyCell"
    let viewImage = UIImageView()
    let titleLabel = UILabel()
    let descLabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .tertiarySystemFill
        
        contentView.addSubview(viewImage)
        
        viewImage.translatesAutoresizingMaskIntoConstraints = false
        viewImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        viewImage.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -5).isActive = true
        viewImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        viewImage.widthAnchor.constraint(equalToConstant: 50).isActive = true
        viewImage.heightAnchor.constraint(equalToConstant: 50).isActive = true
        //viewImage.backgroundColor = .green
        viewImage.image = UIImage(named: "ErrorChannel.jpeg")
        viewImage.contentMode = .scaleToFill
        
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: viewImage.trailingAnchor, constant: 5).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        titleLabel.text = "nameCannel"
        
        contentView.addSubview(descLabel)
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        descLabel.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -5).isActive = true
        descLabel.leadingAnchor.constraint(equalTo: viewImage.trailingAnchor, constant: 5).isActive = true
        descLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        descLabel.text = "desc"

        descLabel.numberOfLines = 0
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func prepareForReuse() {
        super.prepareForReuse()
        viewImage.image = nil
        titleLabel.text = nil
        descLabel.text = nil
    }

}
