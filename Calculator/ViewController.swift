//
//  ViewController.swift
//  Calculator
//
//  Created by student on 17.11.2020.
//

import UIKit

class ViewController: UIViewController {
    var currentScreenDigit:Double = 0
    var firstNum:Double = 0
    var operation:Int = 0
    var triger: Bool = false
    var temp:Double = 0
    var isSign: Bool = false
    var isResult: Bool = false
    var DedidedByZero: Bool = false
    var pointPressed: Bool = false
    var screenIsEmpty: Bool = true
    var screenDigitBool : Bool = false
    
    @IBOutlet weak var screen: UILabel!
    @IBOutlet weak var Plusbutton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var divideButton: UIButton!
    @IBOutlet weak var CancelButton: UIButton!
    @IBOutlet weak var equalButton: UIButton!
    
    
    func GetResult(firstnum: Double, secondnum: Double, operation: Int) -> Double{
        isResult = true
        switch operation {
        case 11:
            return firstnum / secondnum
        case 12:
            return firstnum * secondnum
        case 13:
            return firstnum - secondnum
        case 14:
            return firstnum + secondnum
        default:
            return 6.00
        }
    }
    
    
    
    
    @IBAction func Numbers(_ sender: UIButton) {
        if !DedidedByZero {
            if screen.text!.count < 20 {
                if triger == true {
                    screen.text = String(sender.tag)
                    triger = false
                }
                else{
                    if Int(screen.text!) == 0{
                        screen.text = String(sender.tag)
                    } else{
                        screen.text = screen.text! + String(sender.tag)
                    }
                }
                isResult = false
                currentScreenDigit = Double(screen.text!)!
                screenIsEmpty = false
            }
        }
    }
    
    @IBAction func ConvertSign(_ sender: UIButton) {
        if !DedidedByZero {
            if !screenIsEmpty {
                screen.text = String(-Double(screen.text!)!)
                currentScreenDigit = Double(screen.text!)!
                pointPressed = true
            }
        }
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if !DedidedByZero {
            if screen.text != "" && sender.tag != 10 && sender.tag != 15 && sender.tag != 16{
                if operation == 11 && currentScreenDigit == 0{
                    screen.text = "error, pass C"
                    CancelButton.backgroundColor = UIColor.systemGreen
                    DedidedByZero = true
                } else{
                    Plusbutton.backgroundColor = UIColor.lightGray
                    minusButton.backgroundColor = UIColor.lightGray
                    multiplyButton.backgroundColor = UIColor.lightGray
                    divideButton.backgroundColor = UIColor.lightGray
                    if sender.tag == 11{
                        divideButton.backgroundColor = UIColor.darkGray
                        if isSign && !isResult { // |
                            screen.text = String(GetResult(firstnum: firstNum, secondnum: currentScreenDigit, operation: operation))
                        } else{
                            isSign = true
                        }
                        triger = true
                    }
                    else if sender.tag == 12{ // *
                        multiplyButton.backgroundColor = UIColor.darkGray
                        if isSign && !isResult{
                            screen.text = String(GetResult(firstnum: firstNum, secondnum: currentScreenDigit, operation: operation))
                        } else{
                            isSign = true
                        }
                        triger = true
                    }
                    else if sender.tag == 13{ // -
                        minusButton.backgroundColor = UIColor.darkGray
                        if isSign && !isResult {
                            screen.text = String(GetResult(firstnum: firstNum, secondnum: currentScreenDigit, operation: operation))
                        } else{
                            isSign = true
                        }
                        triger = true
                    }
                    else if sender.tag == 14{ // +
                        Plusbutton.backgroundColor = UIColor.darkGray
                        if isSign && !isResult  {
                        screen.text = String(GetResult(firstnum: firstNum, secondnum: currentScreenDigit, operation: operation))
                        } else{
                            isSign = true
                        }
                        triger = true
                    }
                    pointPressed = false
                    if screen.text?.last == "."{
                        screen.text = screen.text! + "0"
                    }
                    firstNum = Double(screen.text!)!
                    operation = sender.tag
                } //konec cikla else
            } // konec cikla 10 15
            
            if sender.tag == 16{
                if !pointPressed && !screenIsEmpty && !isResult{
                    screen.text = String(screen.text! + ".")
                    pointPressed = true
                } else if !pointPressed && screenIsEmpty {
                    screen.text = "0."
                    pointPressed = true
                }
            }
            
            if sender.tag == 15 {
                    if operation == 11 && currentScreenDigit == 0{
                    screen.text = "error, pass C"
                    CancelButton.backgroundColor = UIColor.systemGreen
                    DedidedByZero = true
                    } else if !isResult{
                    if operation == 11 {
                        screen.text = String(firstNum / currentScreenDigit)
                    }
                    else if operation == 12  {
                        screen.text = String(firstNum * currentScreenDigit)
                    }
                    else if operation == 13 {
                        screen.text = String(firstNum - currentScreenDigit)
                    }
                    else if operation == 14 {
                        screen.text = String(GetResult(firstnum: firstNum, secondnum: currentScreenDigit, operation: operation))
                    }
                        pointPressed = true
                        firstNum = Double(screen.text!)!
                        isSign = false
                        currentScreenDigit = 0
                  }
            }
        }
        
            if sender.tag == 10{
            Plusbutton.backgroundColor = UIColor.lightGray
            minusButton.backgroundColor = UIColor.lightGray
            multiplyButton.backgroundColor = UIColor.lightGray
            divideButton.backgroundColor = UIColor.lightGray
            CancelButton.backgroundColor = UIColor.lightGray
            screen.text = ""
            operation = 0
            firstNum = 0
            currentScreenDigit = 0
            triger = false
            temp = 0
            isSign = false
            DedidedByZero = false
            isResult = false
            pointPressed = false
            screenIsEmpty = true
            }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

