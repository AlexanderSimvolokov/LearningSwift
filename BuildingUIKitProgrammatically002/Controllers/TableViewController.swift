//
//  TableViewController.swift
//  BuildingUIKitProgrammatically002
//
//  Created by Alexander Simvolokov on 14.12.2023.
//

import UIKit

class TableViewController: UITableViewController {
    
    let cellIdentifier = "MyCell"
    var myArray: [Channel] = []
    
    var incrHeihth = 59
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.register(TableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        
        downloadChannels()
        
//        tableView.rowHeight = UITableView.automaticDimension
//        self.dataSource = self
//        self.delegate = self
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return myArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else {return UITableViewCell()}
        // Configure the cell...
        cell.setValueMyCell(nameviewImage: myArray[indexPath.row].image ?? "", textTitleLabel: myArray[indexPath.row].name_ru, textDescLabel: myArray[indexPath.row].showingNow?.desc ?? "")
        //print(cell.descLabel.frame.height)
        //descLabel.numberOfLines = 1
        //cell.textLabel?.numberOfLines = 0
        cell.autoresizingMask = .flexibleHeight
        return cell
    }
    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
////        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath) as? TableViewCell else {return 0}
////        return CGFloat(cell.descLabel.frame.height + 20)
//        return UITableView.automaticDimension
//    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func downloadChannels() {
        
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
                    self?.tableView.reloadData()
                }
              
            }catch{
                print(error)
                return
            }

        }.resume()
        
    }

}
