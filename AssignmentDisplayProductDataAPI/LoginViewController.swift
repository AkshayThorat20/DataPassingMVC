//
//  LoginViewController.swift
//  AssignmentDisplayProductDataAPI
//
//  Created by Mac on 12/10/22.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var userNameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.hidesBarsOnTap.self = true
        
}
func showAlertForEmpty(){
    let alert = UIAlertController(title: title,message:"TextField Should Not Empty", preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel,handler: { action in
        print("Tapped Dismiss")
    }))
    present(alert,animated: true)
}
func showAlertForCheck(){
 let checkAlert = UIAlertController(title: title, message: "Plase Entet Valid Username And Password", preferredStyle: .alert)
    checkAlert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { action in
        print("Tapped Dismiss")
    }))
    present(checkAlert,animated: true)
}
func showAlertForLoginSuccessFully(){
    let checkOnAlert = UIAlertController(title: title, message: "Login SuccessFully", preferredStyle: .alert)
    checkOnAlert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: { action in
        print("Tapped Dismiss")
    }))
    present(checkOnAlert,animated: true)
}
    //Loging button
@IBAction func loginButton(_ sender: Any) {
    let loginPage = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
    if(self.userNameText.text == "" || self.passwordText.text == ""){
       showAlertForEmpty()
    }
    if(self.userNameText.text != "Akshay" || self.passwordText.text != "Akshay@1234"){
       showAlertForCheck()
    }
        
    if(self.userNameText.text == "Akshay"){
    if(self.passwordText.text == "Akshay@1234"){
        self.navigationController?.pushViewController(loginPage, animated: true)
        showAlertForLoginSuccessFully()
    }
}
}
}
