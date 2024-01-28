//
//  DescSelectChannelViewController.swift
//  BuildingUIKitProgrammatically002
//
//  Created by Alexander Simvolokov on 28.01.2024.
//

import UIKit

class DescSelectChannelViewController: UIViewController {

    public let imageView = UIImageView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(imageView)
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        view.backgroundColor = .brown
            
    }
    
}
