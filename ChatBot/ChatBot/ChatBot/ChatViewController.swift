//
//  ChatViewController.swift
//  ChatBot
//
//  Created by Takanori.H on 2016/11/26.
//  Copyright © 2016年 Takanori.H. All rights reserved.
//

import UIKit

class ChatViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logoutDidTapped(_ sender: AnyObject) {
        // 名前を指定して Storyboard を取得する(Main.storyboard の場合) nameのところにMain.storyboardのMainが入る
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // From main storyboard instantiate a navigation controller
        // ここでのNavigationVCはStoryboard IDである
        let LoginVC = storyboard.instantiateViewController(withIdentifier: "LoginVC") as! LoginViewController
        // Get the app delegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        // Set Navigation Controller as root view controller
        appDelegate.window?.rootViewController = LoginVC
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
