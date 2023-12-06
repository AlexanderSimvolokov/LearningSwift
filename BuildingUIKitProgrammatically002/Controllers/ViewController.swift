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
        
        addListChannelsTableView(view: view, listChannelsTableView: listChannelsTableView)
        listChannelsTableView.register(TableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        listChannelsTableView.dataSource = self
        listChannelsTableView.delegate = self
        
        addLeftUIButton(view: view, leftUIButton: leftUIButton, listChannelsTableView: listChannelsTableView)
        
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
        
        

    }

    deinit {
        print("Память освобождена")
    }
    
    @objc func targetMyButton(){
        
//        let fileJson = Bundle.main.path(forResource: "channels", ofType: "json") ?? "nil"
        
        let url = URL(string: "https://www.motodolphin.com/channels.json")!
        
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let data = data,
                error == nil
            else {
                print("error data")
                return
            }
            let decoder = JSONDecoder()
            
            do {
                let jsonData = try decoder.decode(ResponseData.self, from: data)
                
                DispatchQueue.main.async() { [weak self] in
                    self?.myArray = jsonData.channels
                    self?.listChannelsTableView.reloadData()
                }
              
            }catch{
                print(error)
                return
            }

        }.resume()
        
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
        cell.setValueMyCell(nameviewImage: myArray[indexPath.row].image ?? "", textTitleLabel: myArray[indexPath.row].name_ru, textDescLabel: myArray[indexPath.row].showingNow?.desc ?? "")
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
