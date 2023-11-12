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
        viewImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5).isActive = true
        viewImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5).isActive = true
        viewImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        viewImage.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 0.3).isActive = true
        
        viewImage.image = UIImage(named: "ErrorChannel.jpeg")
        viewImage.contentMode = .scaleAspectFit
        
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: viewImage.trailingAnchor, constant: 5).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        titleLabel.text = "nameCannel"
        titleLabel.backgroundColor = .blue
        
        contentView.addSubview(descLabel)
        descLabel.translatesAutoresizingMaskIntoConstraints = false
        descLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5).isActive = true
        descLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        descLabel.leadingAnchor.constraint(equalTo: viewImage.trailingAnchor, constant: 5).isActive = true
        descLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5).isActive = true
        descLabel.text = "desc"
        descLabel.backgroundColor = .gray
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setValueMyCell(nameviewImage: String, textTitleLabel: String, textDescLabel: String){
        viewImage.image = UIImage(named: nameviewImage)
        titleLabel.text = textTitleLabel
        descLabel.text = textDescLabel
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        viewImage.image = nil
        titleLabel.text = nil
        descLabel.text = nil
    }
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        // Initialization code
//    }
//
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }

}
