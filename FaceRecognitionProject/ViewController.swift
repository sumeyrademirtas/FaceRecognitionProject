//
//  ViewController.swift
//  FaceRecognitionProject
//
//  Created by Sümeyra Demirtaş on 11.06.2024.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func signInClicked(_ sender: Any) {
        
        let authContext = LAContext() // Dogrulama islemleri icin kullanilan bir obje
        
        var error : NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "Is it you?") { (success, error) in
                
                DispatchQueue.main.async {
                    if success == true {
                        //successfull aut
                        self.performSegue(withIdentifier: "toSecond", sender: nil)
                    } else {
                        self.myLabel.text = "Error!"
                    }
                }
            }
            
        }
        
    }
    
}
