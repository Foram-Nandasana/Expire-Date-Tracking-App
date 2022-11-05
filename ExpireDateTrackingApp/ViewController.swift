//
//  ViewController.swift
//  ExpireDateTrackingApp
//
//  Created by CSPIT-IT on 27/08/22.
//  Copyright © 2022 Student. All rights reserved.
//

import UIKit
import GoogleSignIn
import FirebaseAuth
class ViewController: UIViewController,GIDSignInUIDelegate,GIDSignInDelegate {
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let error = error{
            print("Error because of \(error.localizedDescription)")
            return
        }else{
            guard let auth = user.authentication else {return}
            let credentials = FIRGoogleAuthProvider.credential(withIDToken: auth.idToken, accessToken: auth.accessToken)
         
           
            
            
            
            FIRAuth.auth()?.signIn(with: credentials,completion: { (authResult, error) in
                if let error  =  error{
                print("Error because \(error.localizedDescription)")

                    return
                }else{
                    print("Sucessfully")
                   
                    
                 
                    
                  
                    
                   
                }
            }
          
            )
            

        }
        
    }
    

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
       GIDSignIn.sharedInstance()?.uiDelegate = self
        
        
    }
    
    
    @IBAction func signInWithGoogle(_ sender: UIButton) {
        GIDSignIn.sharedInstance()?.delegate = self
        GIDSignIn.sharedInstance()?.uiDelegate = self
        GIDSignIn.sharedInstance()?.signIn()
        
        
        
    }
    
    @IBAction func ForgotPasswordBtn(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "productViewController") as! productViewController
        self.navigationController?.pushViewController(vc, animated: true)
        self.present(vc, animated: true, completion: nil)
        
        
       
       
       
    }
    
   
}

