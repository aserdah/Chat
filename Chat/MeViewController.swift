//
//  MeViewController.swift
//  Chat
//
//  Created by Ahmed Serdah on 4/17/18.
//  Copyright © 2018 Ahmed. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class MeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func ExitBtnTapped(_ sender: Any) {
       print("exit btn tappe")
       try! Auth.auth().signOut()
       // self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let SignInVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignInViewController")
        UIApplication.shared.keyWindow?.rootViewController = SignInVC
     //   UIWindow(frame: UIScreen.main.bounds).rootViewController = SignInVC

        self.dismiss(animated: true, completion: nil)
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
