//
//  ViewController.swift
//  Chat
//
//  Created by Ahmed on 12/25/17.
//  Copyright © 2017 Ahmed. All rights reserved.
//

import UIKit
import Firebase
import GoogleSignIn
import FirebaseDatabase
import FirebaseAuth

class SignInViewController: UIViewController, GIDSignInUIDelegate {

    @IBOutlet weak var Email: UITextField!
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var signInButton: GIDSignInButton!
     let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RAMAnimatedTabBarController")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Auth.auth().currentUser!")

       // print(Auth.auth().currentUser!)
      
        if Auth.auth().currentUser != nil {
            self.present(vc, animated: true, completion: nil)
            
        }
        
        GIDSignIn.sharedInstance().uiDelegate = self
        
     //   GIDSignIn.sharedInstance().signIn()
       
       // signInButton.
//       signInButton.addTarget(self, action: #selector(GIDSignIn.sharedInstance().signIn()), for: UIControlEvents.touchUpInside)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func GoogleBtnTapped(_ sender: Any) {
   //     let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "RAMAnimatedTabBarController")
        
      //  self.present(vc, animated: true, completion: nil)
         GIDSignIn.sharedInstance().signIn()
        
        
    }
    
   func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        // ...
      print("google log in tapped")
        if let error = error {
            print("\(error.localizedDescription)")
            return
        }
    
        
        guard let authentication = user.authentication else {
            print("log in")
            return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken,
                                                       accessToken: authentication.accessToken)
    
    
    Auth.auth().signIn(with: credential) { (user, error) in
        if let error = error {
          print("\(error.localizedDescription)")
            return
        }
        let email = user?.email
        let userId = user?.refreshToken               // For client-side use only!
        let idToken = user?.providerID
        let fullName = user?.displayName
      
        print(email!+" "+userId!+" "+idToken!+" "+fullName!)
        print(credential.description)
        // User is signed in
        // ...
    }
    print("credential.description")
    print(credential.description)
    
   
    
    self.present(vc, animated: true, completion: nil)
    
    }
  
    @IBAction func SingInBtnTapped(_ sender: Any) {
        guard let userEmail = Email.text, !userEmail.isEmpty else {print ("Email is empty"); return}
        guard let userPassword = Password.text, !userPassword.isEmpty else {print ("Email is empty"); return}
        
        let ref = Database.database().reference().root
        if userEmail != "" && userPassword != "" {
            Auth.auth().signIn(withEmail: userEmail, password: userPassword, completion: { (user, error) in
                if error == nil {
                   print(ref.child("users").child((user?.uid)!).child("email").key)
                   print(ref.child("users").child((user?.uid)!).child("name").key)
                  
                    
                    print ("Sign IN Sucess")
                    let vc = UIStoryboard.mainStoryboard?.instantiateViewController(withIdentifier: "RAMAnimatedTabBarController")
                    self.present(vc!, animated: true, completion: nil)

                    
                }
                else{
                    print ("Sign IN Falied")
                    print (error!)
                }
                
            })
         
        }
        
        
    }
    
    //let vc = UIStoryboard.mainStoryboard?.instantiateViewController(withIdentifier: "RAMAnimatedTabBarController")
    

    }
    


