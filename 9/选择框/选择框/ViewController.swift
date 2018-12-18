//
//  ViewController.swift
//  选择框
//
//  Created by student on 2018/11/7.
//  Copyright © 2018年 xh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    

    @IBAction func actionSheet(_ sender: Any) {
        let alert=UIAlertController(title: "bear*choose", message:"this is my homework", preferredStyle: .actionSheet)
        //default
        alert.addAction(UIAlertAction(title: "red", style: .default, handler: { //默认
            (action)in
            print("ok cliked")
            self.view.backgroundColor=UIColor.red
        }))
        
      
        
        //.destructive
        alert.addAction(UIAlertAction(title: "green", style: .destructive, handler: {
            (action)in
            print("destructive clicked")
            self.view.backgroundColor=UIColor.green
            
        }))
        
        let purple=UIAlertAction(title: "purple", style: .default) { (action) in
            self.view.backgroundColor=UIColor.purple
        }
        alert.addAction(purple)
        
        //.cancel
        alert.addAction(UIAlertAction(title: "cancel", style: .cancel, handler: {  //取消
            (action)in
            print("cancel clicked")
            self.view.backgroundColor=UIColor.white
            
        }))
        present(alert,animated: true,completion: nil)
        
    }
    
    @IBAction func login(_ sender: Any) {
        let alert=UIAlertController(title: "login", message: "this is a login page", preferredStyle: .alert) //login框
        alert.addAction(UIAlertAction(title: "Login", style: .default, handler: { //确认
            (action) in
//            alert.textFields![1].text!  取得输入框内的值
            if let userNameTextField=alert.textFields?.first,let passwordtextfield=alert.textFields?.last{ //注意取值
                print("username:\(userNameTextField.text!)"+"  "+"password:\(passwordtextfield.text!)")
            }
        }))
        alert.addAction(UIAlertAction(title: "**cancel**", style: .cancel, handler:{ //取消
            (action) in
            //空
        }))
        alert.addTextField{   //添加值
            (textField) in
            textField.placeholder="username"
        }
        alert.addTextField{
            (textField) in
                textField.placeholder="password"
            textField.isSecureTextEntry=true
            
        }
    
    
        present(alert,animated: true,completion: nil)
    
    }

}


