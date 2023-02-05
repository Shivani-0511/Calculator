//
//  ResultViewController.swift
//  calculator1
//
//  Created by Apple on 16/01/23.
//

import UIKit

class ResultViewController: UIViewController,UITableViewDataSource, UITextFieldDelegate {
    @IBOutlet var result:UITableView!
    
    
    public var historyList = [String]()
    override func viewDidLoad(){
        super.viewDidLoad()
        
        result.dataSource = self
        getData()
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return historyList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = historyList[indexPath.row]
        return cell
    }
    
    func getData(){
        guard let count = UserDefaults().value(forKey: "count") as? Int else{
            return
        }
        
        for i in 0..<count{
            if let data = UserDefaults().value(forKey: "history_\(i)") as? String{
                historyList.append(data)
            }
        }
        result.reloadData()
        
    }
   
        // Do any additional setup after loading the view.
        
   
    
}
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


  
