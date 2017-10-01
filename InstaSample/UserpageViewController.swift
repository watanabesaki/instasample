//
//  UserpageViewController.swift
//  InstaSample
//
//  Created by 渡辺早紀 on 2017/10/01.
//  Copyright © 2017年 Saki Watanabe. All rights reserved.
//

import UIKit
import NCMB


class UserpageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showmenu(){
        let alertContoller = UIAlertController(title: "メニュー", message: "メニューを選択してください", preferredStyle: .actionSheet)
        //ログアウトボタン
        let signoutAction = UIAlertAction(title: "ログアウト", style: .default) { (action) in
            NCMBUser.logOutInBackground({ (error) in
                if error != nil{
                  //ログアウトのエラー
                    print("ログアウトエラー")
                }else{
                    //ログインアウト成功
                    //登録が成功した場合
                    //スト-リーボードの取得
                    let storyboard = UIStoryboard(name: "signin", bundle: Bundle.main)
                    let rootviewcontroller = storyboard.instantiateViewController(withIdentifier: "RootnavigationController")
                    //画面の一番奥の画面に設定する appdeligateのwindowsと同じ意味
                    UIApplication.shared.keyWindow?.rootViewController = rootviewcontroller
                    
                    //ログインアウトしたらuserdefaultに保存
                    let ud = UserDefaults.standard
                    ud.set(false, forKey: "isLogin")
                    ud.synchronize()

                }
            })
        }
        //キャンセルボタン
        let canselAction = UIAlertAction(title: "キャンセル", style: .cancel) { (action) in
            alertContoller.dismiss(animated: true, completion: nil)
        }
        
        alertContoller.addAction(canselAction)
        alertContoller.addAction(signoutAction)
        self.present(alertContoller, animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
}
