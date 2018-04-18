//
//  RestPassViewController.swift
//  Chat
//
//  Created by Ahmed Serdah on 4/16/18.
//  Copyright © 2018 Ahmed. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class RestPassViewController: UIViewController {
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Phone: UITextField!
    @IBOutlet weak var Password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func RestBtnTapped(_ sender: Any) {
        guard let userEmail = Email.text, !userEmail.isEmpty else {print ("Email is empty"); return}
        guard let userPassword = Password.text, !userPassword.isEmpty else {print ("Email is empty"); return}
        guard let userPhone = Phone.text, !userPhone.isEmpty else {print ("Email is empty"); return}
        
        
   //     let ref = Database.database().reference().root
        if userEmail != "" && userPassword != "" {
            Auth.auth().sendPasswordReset(withEmail: userEmail, completion: { (error) in
                if(error == nil){
                    print("Password Rest Success")
                    self.dismiss(animated: true, completion: nil)

                    
                }
                else{
                    print(error!)
                }
            })
            
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
