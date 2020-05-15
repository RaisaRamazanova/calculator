//
//  ViewController.swift
//  calculator
//
//  Created by Дмитрий Рудановский on 08/05/2020.
//  Copyright © 2020 Ramazanova Raisat. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var results: UILabel!
    
    var numberDouble: Double = 0
    var firstNum: Double = 0
    var operation: Int = 0
    var mathSign: Bool = false
    
    @IBAction func digits(_ sender: UIButton) {
        if mathSign == true {
            results.text = String(sender.tag)
            mathSign = false
        }
        else {
            results.text = results.text! + String(sender.tag)
        }
        numberDouble = Double(results.text!)!
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if results.text != "" && sender.tag != 10 && sender.tag != 15 {
            firstNum = Double(results.text!)!
            if sender.tag == 11 {
                results.text = "/"
            }else if sender.tag == 12 {
                results.text = "x"
            }else if sender.tag == 13 {
                results.text = "-"
            }else if sender.tag == 14 {
                results.text = "+"
            }
            operation = sender.tag
            mathSign = true
        }else if sender.tag == 15 {
            if operation == 11{
                results.text = String(firstNum / numberDouble)
            }else if operation == 12{
                results.text = String(firstNum * numberDouble)
            }else if operation == 13{
                results.text = String(firstNum - numberDouble)
            }else if operation == 14{
                results.text = String(firstNum + numberDouble)
            }
        }else if sender.tag == 10 {
            results.text = ""
            firstNum = 0
            numberDouble = 0
            operation = 0
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

