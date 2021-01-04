//
//  ViewController.swift
//  Navigation Practice Myself
//
//  Created by Stas Borovtsov on 04.01.2021.
//

import UIKit

class ViewController: UIViewController {

    let loginText = "Stas"
    let passwordText = "123654"
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard segue.identifier == "Authorised Segue" || segue.identifier == "Forgot Segue" else {
            return
        }
        
        if segue.identifier == "Authorised Segue"{
        if loginTextField.text == loginText && passwordTextField.text == passwordText{
            segue.destination.navigationItem.title = loginTextField.text
        }else{
            segue.destination.navigationItem.title = "Autorization error"
            segue.destination.navigationItem.rightBarButtonItem?.title = "back"
            segue.destination.view.backgroundColor = .red
        }
        }else if segue.identifier == "Forgot Segue"{
            if loginTextField.text == loginText{
                segue.destination.navigationItem.title = "Password for login \(loginText): \(passwordText)"
            }else{
                segue.destination.navigationItem.title = "Unknown login \(loginTextField.text!)"
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
        performSegue(withIdentifier: "Authorised Segue", sender: nil)
    }
    @IBAction func forgotButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "Forgot Segue", sender: nil)
    }
    
    @IBAction func unwind(_ segue: UIStoryboardSegue) {
        
    }
    
    
}

