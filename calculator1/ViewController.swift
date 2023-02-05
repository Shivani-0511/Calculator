//
//  ViewController.swift
//  calculator1
//
//  Created by Apple on 17/12/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var valueUILabel: UILabel!
    var number1 = 0.0
    var number2 = 0.0
    var operation = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if !UserDefaults().bool(forKey: "setup"){
            UserDefaults().set(true,forKey: "setup")
            UserDefaults().setValue(0, forKey: "count")
        }
        // Do any additional setup after loading the view.
    }
    @IBAction func HistoryAction(_ sender: UIButton) {
       
        let vc = storyboard?.instantiateViewController(withIdentifier: "result") as! ResultViewController
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    @IBAction func ButtonAction(_ sender: UIButton) {
    }
    @IBAction func perButtonAction(_ sender: UIButton) {
    }
    @IBAction func oneButtonAction(_ sender: UIButton) {
    let numberstring = (sender.title(for: .normal)) ?? "0.0"
        valueUILabel.text = numberstring
        let number = Double(numberstring) ?? 0.0
        if number1 == 0.0 {
            number1 = number
        }else if number2 == 0.0 {
            number2 = number
        }
    }
    @IBAction func addButtonAction(_ sender: UIButton) {
        operation = (sender.title(for: .normal)) ?? ""
    }
    @IBAction func cutButtonAction(_ sender: UIButton) {
    }
    @IBAction func dotButtonAction(_ sender: UIButton) {
    }
    @IBAction func equalButtonAction(_ sender: UIButton) {
        if operation == "+" {
        let sum = number1 + number2
        valueUILabel.text = "\(number1) \(operation) \(number2) = \(sum)"
            number1 = 0.0
            number2 = 0.0
        }else if operation == "-" {
            let sub = number1 - number2
            valueUILabel.text = "\(number1) \(operation) \(number2) = \(sub)"
                number1 = 0.0
                number2 = 0.0
    }else if operation == "*" {
        let multi = number1 * number2
        valueUILabel.text = "\(number1) \(operation) \(number2) = \(multi)"
            number1 = 0.0
            number2 = 0.0
    }else if operation == "/" {
        let div = number1 / number2
        valueUILabel.text = "\(number1) \(operation) \(number2) = \(div)"
            number1 = 0.0
            number2 = 0.0

   }
        saveData(data: valueUILabel.text)
  }
    func saveData(data: String?){
        guard let text = data, !text.isEmpty else{
            return
        }
        guard let count =  UserDefaults().value(forKey: "count") as? Int else{
            return
        }
        UserDefaults().setValue(text, forKey: "history_\(count)")
        let newCount = count + 1
        UserDefaults().setValue(newCount, forKey: "count")
    }
    
}
