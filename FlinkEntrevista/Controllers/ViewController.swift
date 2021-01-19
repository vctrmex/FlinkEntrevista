//
//  ViewController.swift
//  FlinkEntrevista
//
//  Created by victor manzanero on 18/01/21.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var txtUser: UITextField!
    @IBOutlet var txtPass: UITextField!
    @IBOutlet var remember: UISwitch!
    let userDefauld = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboard()
        let user = userDefauld.string(forKey: "user")
        let pass = userDefauld.string(forKey: "pass")
        if user != ""{
            
            remember.isOn = true
            
        }
        txtUser.text = user
        txtPass.text = pass
        // Do any additional setup after loading the view.
    }
    
    @IBAction func doLogin(_ sender: Any) {
        
        if txtUser.text?.lowercased() == "user".lowercased() && txtPass.text == "User"{
            
            if remember.isOn{
                
                userDefauld.set(txtUser.text?.lowercased(), forKey: "user")
                userDefauld.set(txtPass.text,forKey: "pass")
                
                
            }else{
                
                userDefauld.set("", forKey: "user")
                userDefauld.set("",forKey: "pass")
                
            }
            
            performSegue(withIdentifier: "main", sender: nil)
            
        }else{
            
            let alert = UIAlertController(title: "Error al intentar entrar", message: "Uno o màs datos son invalidos intente de nuevo", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))

            self.present(alert, animated: true)
            
        }
        
    }
    


}

