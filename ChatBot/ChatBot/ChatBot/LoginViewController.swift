//
//  LoginViewController.swift
//  ChatBot
//
//  Created by Takanori.H on 2016/11/26.
//  Copyright © 2016年 Takanori.H. All rights reserved.
//

import UIKit
import FirebaseAuth
import GoogleSignIn

class LoginViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {

    @IBOutlet weak var anonymousButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        anonymousButton.layer.borderWidth = 1.2
        anonymousButton.layer.borderColor = UIColor.white.cgColor
        GIDSignIn.sharedInstance().clientID = "910080858401-gnmi65bfn882dohov4smpopv3uvf2cp2.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func LoginAnonymouslyDidTapped(_ sender: AnyObject) {
        print("login anonymously did tapped")
        /* 以下のコードを画面遷移したいところ（ボタンなど）に加える */
        // 名前を指定して Storyboard を取得する(Main.storyboard の場合)
        //Helper.helper.LoginAnonymously()
        
        FIRAuth.auth()?.signInAnonymously() { (user, error) in
            if error == nil{ /* errorでなかったとき */
                print("UserId: \(user!.uid)")
                
                
                 let select = self.storyboard!.instantiateViewController(withIdentifier: "select")
                 self.present(select, animated: false, completion: nil)
                //self.switchToNavigationViewController()
            }else{ /* errorが生じたとき */
                print("Error")
                print(error!.localizedDescription)
                return
            }
        }

        
        //let next = storyboard!.instantiateViewController(withIdentifier: "next")
        //self.present(next,animated: false, completion: nil)
        
    }
    
    @IBAction func googleLoginDidTapped(_ sender: AnyObject) {
        print("google login did tapped")
        GIDSignIn.sharedInstance().signIn()
        
        
        /*
        /* 以下のコードを画面遷移したいところ（ボタンなど）に加える */
        // 名前を指定して Storyboard を取得する(Main.storyboard の場合)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // From main storyboard instantiate a navigation controller
        let naviVC = storyboard.instantiateViewController(withIdentifier: "NavigationVC") as! UINavigationController
        // Get the app delegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        // Set Navigation Controller as root view controller
        appDelegate.window?.rootViewController = naviVC*/
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if error != nil{
            print(error!.localizedDescription)
        }
        print(user.authentication)
        Helper.helper.logInWithGoogle(authentication: user.authentication)
        //authentication: user.authentication

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
