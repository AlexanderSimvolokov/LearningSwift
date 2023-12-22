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
    
    public func setValueMyCell(nameviewImage: String, textTitleLabel: String, textDescLabel: String){
        //viewImage.image = UIImage(named: nameviewImage)
        viewImage.downloaded(from: nameviewImage)
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

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
