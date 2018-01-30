//
//  ChatViewController.swift
//  Chat
//
//  Created by Ahmed on 12/26/17.
//  Copyright © 2017 Ahmed. All rights reserved.
//

import UIKit

class Chat2ViewController: UIViewController,UITabBarDelegate,UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell_2", for: indexPath)
        
        if(indexPath.row == 0){
         cell = tableView.dequeueReusableCell(withIdentifier: "cell_2", for: indexPath)
        }
        else if(indexPath.row == 2){
             cell = tableView.dequeueReusableCell(withIdentifier: "cell_2", for: indexPath)
        }
        else if(indexPath.row == 4){
             cell = tableView.dequeueReusableCell(withIdentifier: "cell_2", for: indexPath)
        }
            
        else{
         cell = tableView.dequeueReusableCell(withIdentifier: "cell_3", for: indexPath)
        }
        return cell
    }
    
    
    
}

