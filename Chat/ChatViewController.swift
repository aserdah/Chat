//
//  ChatViewController.swift
//  Chat
//
//  Created by Ahmed on 12/26/17.
//  Copyright © 2017 Ahmed. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController,UITabBarDelegate,UITableViewDataSource {

    
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_1", for: indexPath)
       
        return cell
    }
    
    

}
