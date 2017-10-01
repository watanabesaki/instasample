//
//  AppDelegate.swift
//  InstaSample
//
//  Created by 渡辺早紀 on 2017/10/01.
//  Copyright © 2017年 Saki Watanabe. All rights reserved.
//

import UIKit
import NCMB

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    //アプリが起動するときに最初に呼ばれる
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        NCMB.setApplicationKey("df89d23e1848185a9f61a815c07122da2efe675d467832fc8adb87bc5bd859b3",clientKey:"2a9fc3efe6e6ce275dfe9757f922072199f11b01e6fc0304eb7e6a7b380c9faa")
        
        
        //ログイン状態かどうかを判断する
        let ud = UserDefaults.standard
        let islogin = ud.bool(forKey: "isLogin")
        
        if islogin == true{
            //ログイン中だったら
            //iphoneのサイズに合わせて画面を作成してくれる
            self.window = UIWindow(frame: UIScreen.main.bounds)
            //ストーリーボードの最初の画面　Bundle.mainはこのプロジェクト内にあるストーリーボードということ
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            //最初の画面の生成
            let rootviewcontroller =  storyboard.instantiateViewController(withIdentifier: "RootTabBarController")
            self.window?.rootViewController = rootviewcontroller
            //デフォルトは黒
            self.window?.backgroundColor = UIColor.white
            //画面を出す
            self.window?.makeKeyAndVisible()
        }else{
            //ログインしていなかったら
            //iphoneのサイズに合わせて画面を作成してくれる
            self.window = UIWindow(frame: UIScreen.main.bounds)
            //ストーリーボードの最初の画面 Bundle.mainはこのプロジェクト内にあるストーリーボードということ
            let storyboard = UIStoryboard(name: "signin", bundle: Bundle.main)
            //最初の画面の生成
            let rootviewcontroller =  storyboard.instantiateViewController(withIdentifier: "RootnavigationController")
            self.window?.rootViewController = rootviewcontroller
            //デフォルトは黒
            self.window?.backgroundColor = UIColor.white
            //画面を出す
            self.window?.makeKeyAndVisible()

        }
        
        
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

