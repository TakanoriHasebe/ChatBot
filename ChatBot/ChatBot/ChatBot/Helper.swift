//
//  Helper.swift
//  ChatBot
//
//  Created by Takanori.H on 2016/11/30.
//  Copyright © 2016年 Takanori.H. All rights reserved.
//

import Foundation
import FirebaseAuth
import UIKit
import GoogleSignIn

class Helper{
    static let helper = Helper()
    
    func LoginAnonymously() {
        print("login anonymously did tapped")
        /* 以下のコードを画面遷移したいところ（ボタンなど）に加える */
        // 名前を指定して Storyboard を取得する(Main.storyboard の場合)
        
        FIRAuth.auth()?.signInAnonymously() { (user, error) in
            if error == nil{ /* errorでなかったとき */
                print("UserId: \(user!.uid)")
                
                self.switchToNavigationViewController()
            }else{ /* errorが生じたとき */
                print("Error")
                print(error!.localizedDescription)
                return
            }
        }
        
    }

    func logInWithGoogle(authentication: GIDAuthentication){
        
        print("logInWithGoogle")
        let credential = FIRGoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
        
        FIRAuth.auth()?.signIn(with: credential) { (user, error) in
            if error != nil{ /* errorであったとき */
                print(error!.localizedDescription)
                return
            }else{
                print(user?.email)
                print(user?.displayName)
                
                self.switchToNavigationViewController()
            }
        }
    }
    
    private func switchToNavigationViewController(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        // From main storyboard instantiate a navigation controller
        let naviVC = storyboard.instantiateViewController(withIdentifier: "NavigationVC") as! UINavigationController
        // Get the app delegate
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        // Set Navigation Controller as root view controller
        appDelegate.window?.rootViewController = naviVC

        
    }
    
    
}



