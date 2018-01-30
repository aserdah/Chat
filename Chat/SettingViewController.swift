//
//  SettingViewController.swift
//  Chat
//
//  Created by Ahmed on 12/30/17.
//  Copyright © 2017 Ahmed. All rights reserved.
//

import UIKit
import JTMaterialSwitch

class SettingViewController: UIViewController {
    
    @IBOutlet weak var PushNotificationsView: UIView!
    
    @IBOutlet weak var EmailNotificationsView: UIView!
    
    @IBOutlet weak var SoundNotificationsView: UIView!
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let PushNotificationsSwitch = JTMaterialSwitch()
        let EmailNotificationsSwitch = JTMaterialSwitch()
        let SoundNotificationsSwitch = JTMaterialSwitch()
        PushNotificationsSwitch?.thumbOnTintColor = UIColor.init(hex: 0xF9D059)
        PushNotificationsSwitch?.trackOnTintColor = UIColor.black
        PushNotificationsSwitch?.thumbOffTintColor = UIColor.init(hex: 0x008FFF)
        PushNotificationsSwitch?.trackOffTintColor = UIColor.black
        
        EmailNotificationsSwitch?.thumbOnTintColor = UIColor.init(hex: 0xF9D059)
        EmailNotificationsSwitch?.trackOnTintColor = UIColor.black
        EmailNotificationsSwitch?.thumbOffTintColor = UIColor.init(hex: 0x008FFF)
        EmailNotificationsSwitch?.trackOffTintColor = UIColor.black
        
        SoundNotificationsSwitch?.thumbOnTintColor = UIColor.init(hex: 0xF9D059)
        SoundNotificationsSwitch?.trackOnTintColor = UIColor.black
        SoundNotificationsSwitch?.thumbOffTintColor = UIColor.init(hex: 0x008FFF)
        SoundNotificationsSwitch?.trackOffTintColor = UIColor.black
        
        PushNotificationsView.addSubview(PushNotificationsSwitch!)
        EmailNotificationsView.addSubview(EmailNotificationsSwitch!)
        SoundNotificationsView.addSubview(SoundNotificationsSwitch!)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
