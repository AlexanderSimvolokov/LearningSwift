//
//  ViewController.swift
//  BuildingUIKitProgrammatically002
//
//  Created by Alexander Simvolokov on 24.10.2023.
//

import UIKit

class ViewController: UIViewController {//, UITableViewDelegate, UITableViewDataSource {

    //var myArray = ["First","Second","Third"]
    var myArray: [Channel] = []
    let listChannelsTableView = UITableView()
    let cellIdentifier = "MyCell"
    let rightUIButton = UIButton()
    let leftUIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .yellow
        
        view.addSubview(listChannelsTableView)
        
        listChannelsTableView.translatesAutoresizingMaskIntoConstraints = false
        
        listChannelsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        listChannelsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -150).isActive = true
        listChannelsTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        listChannelsTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true

        listChannelsTableView.register(TableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        listChannelsTableView.dataSource = self
        listChannelsTableView.delegate = self
        
        listChannelsTableView.backgroundColor = .brown
        
        view.addSubview(leftUIButton)
        leftUIButton.translatesAutoresizingMaskIntoConstraints = false
        leftUIButton.topAnchor.constraint(equalTo: listChannelsTableView.bottomAnchor, constant: 15).isActive = true
        leftUIButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        leftUIButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 15).isActive = true
        leftUIButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -150).isActive = true
        leftUIButton.backgroundColor = .gray
        
        view.addSubview(rightUIButton)
        rightUIButton.translatesAutoresizingMaskIntoConstraints = false
        rightUIButton.topAnchor.constraint(equalTo: listChannelsTableView.bottomAnchor, constant: 15).isActive = true
        rightUIButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        rightUIButton.leadingAnchor.constraint(equalTo: leftUIButton.trailingAnchor, constant: 15).isActive = true
        rightUIButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -15).isActive = true
        
        //rightUIButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3)
        rightUIButton.backgroundColor = .red
        rightUIButton.setTitle("123", for: .normal)
        rightUIButton.addTarget(self, action: #selector(targetMyButton), for: .touchUpInside)
        
        
        
       // rightUIButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.3).isActive = true
        //rightUIButton.contentMode = .right
    }

    struct ResponseData: Decodable {
        var channels: [Channel]
    }
    struct Channel : Decodable {
        var id: Int
        var name_ru: String
        var current: Current
        var image: String
    }
    struct Current : Decodable{
        var desc: String
    }
    
    @objc func targetMyButton(){
        print("111")
        let fileJson = Bundle.main.path(forResource: "channels", ofType: "json") ?? "nil"
        
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: fileJson), options: .alwaysMapped) else {
            print("error data")
            return
        }
        let decoder = JSONDecoder()
        guard let jsonData = try? decoder.decode(ResponseData.self, from: data) else {
            print("error jsonData")
            return
        }
            print(type(of: jsonData))
            print(type(of: jsonData.channels))
            print(jsonData.channels.count)
            
        myArray = jsonData.channels
        listChannelsTableView.reloadData()
            
    }
    
    @objc func targetMyButton2() {
        //print("") - как обратиться при втором нажатии к уже прочитанным ранее данным
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else {return UITableViewCell()}
        //cell.textLabel!.text = "\(myArray[indexPath.row].name_ru)"
        cell.setValueMyCell(nameviewImage: myArray[indexPath.row].image, textTitleLabel: myArray[indexPath.row].name_ru, textDescLabel: myArray[indexPath.row].current.desc)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(myArray[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
        
    }
}
