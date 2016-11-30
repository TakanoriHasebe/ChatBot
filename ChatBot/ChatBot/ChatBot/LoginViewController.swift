//
//  LoginViewController.swift
//  ChatBot
//
//  Created by Takanori.H on 2016/11/26.
//  Copyright © 2016年 Takanori.H. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var anonymousButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        anonymousButton.layer.borderWidth = 1.2
        anonymousButton.layer.borderColor = UIColor.white.cgColor
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LoginAnonymouslyDidTapped(_ sender: AnyObject) {
        print("login anonymously did tapped")
        /* 以下のコードを画面遷移したいところ（ボタンなど）に加える */
        // 名前を指定して Storyboard を取得する(Main.storyboard の場合)
        Helper.helper.LoginAnonymously()
        
    }
    
    @IBAction func googleLoginDidTapped(_ sender: AnyObject) {
        print("google login did tapped")
        /* 以下のコードを画面遷移したいところ（ボタンなど）に加える */
        // 名前を指定して Storyboard を取得する(Main.storyboard の場合)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // From main storyboard instantiate a navigation controller
        let naviVC = storyboard.instantiateViewController(withIdentifier: "NavigationVC") as! UINavigationController
        // Get the app delegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        // Set Navigation Controller as root view controller
        appDelegate.window?.rootViewController = naviVC
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
