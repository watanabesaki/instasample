//
//  editUserInfoViewController.swift
//  InstaSample
//
//  Created by 渡辺早紀 on 2017/10/01.
//  Copyright © 2017年 Saki Watanabe. All rights reserved.
//

import UIKit
import NCMB

class editUserInfoViewController: UIViewController,UITextFieldDelegate,UITextViewDelegate {
    
    
    @IBOutlet var userImageView : UIImageView!
    @IBOutlet var usernameTextField : UITextField!
    @IBOutlet var useridTextField : UITextField!
    @IBOutlet var introductionTextView : UITextView!


    override func viewDidLoad() {
        super.viewDidLoad()

        usernameTextField.delegate = self
        useridTextField.delegate = self
        introductionTextView.delegate = self
        
        
        //ユーザの情報を読み込む
        let userId = NCMBUser.current().userName
        useridTextField.text = userId
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textViewShouldEndEditing(_ textView: UITextView) -> Bool {
        textView.resignFirstResponder()
        return true
    }
    
    
    //キャンセルボタン
    @IBAction func closeEdit(){
        self.dismiss(animated: true, completion: nil)
    }

}
