//
//  ItemView.swift
//  BuildingUIKitProgrammatically002
//
//  Created by Alexander Simvolokov on 02.12.2023.
//

import Foundation
import UIKit

func addListChannelsTableView(view: UIView, listChannelsTableView: UITableView) -> Void {
 
    view.addSubview(listChannelsTableView)
    
    listChannelsTableView.translatesAutoresizingMaskIntoConstraints = false
    
    listChannelsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
    listChannelsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150).isActive = true
    listChannelsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
    listChannelsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
    
    listChannelsTableView.backgroundColor = .brown
    
}

func addLeftUIButton(view: UIView, leftUIButton: UIButton, listChannelsTableView: UITableView) -> Void {
 
    view.addSubview(leftUIButton)
    leftUIButton.translatesAutoresizingMaskIntoConstraints = false
    leftUIButton.topAnchor.constraint(equalTo: listChannelsTableView.bottomAnchor, constant: 15).isActive = true
    leftUIButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    leftUIButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
    leftUIButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -150).isActive = true
    leftUIButton.backgroundColor = .gray
    
}
