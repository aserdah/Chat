//
//  SigUpViewController.swift
//  Chat
//
//  Created by Ahmed Serdah on 4/15/18.
//  Copyright © 2018 Ahmed. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import FirebaseAuth

class SignUpViewController: UIViewController {

    @IBOutlet weak var Name: UITextField!
    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var Phone: UITextField!
    var userDic:Dictionary<String, String> = [String:String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func SignUpBtnTapped(_ sender: Any) {
        guard let userEmail = Email.text, !userEmail.isEmpty else {print ("Email is empty"); return}
        guard let userName = Name.text, !userName.isEmpty else {print ("Email is empty"); return}
        guard let userPassword = Password.text, !userPassword.isEmpty else {print ("Email is empty"); return}
        guard let userPhone = Phone.text, !userPhone.isEmpty else {print ("Email is empty"); return}

        
        let ref = Database.database().reference().root
        if userEmail != "" && userPassword != "" {
            Auth.auth().createUser(withEmail: userEmail, password: userPassword, completion: { (user, error) in
                if error == nil {
                    self.userDic["email"] = userEmail
                    self.userDic["name"] = userName
                    self.userDic["phone"] = userPhone

                    ref.child("users").child((user?.uid)!).child("details").setValue(self.userDic)
                 
                 print ("Sign UP Sucess")
                 self.dismiss(animated: true, completion: nil)

                }
                else{
                     print ("Sign UP Falied")
                    print (error!)
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
