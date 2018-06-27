//
//  BaseNavigationViewController.swift
//  SwiftLearn
//
//  Created by panhongliu on 2017/6/28.
//  Copyright © 2017年 wangsen. All rights reserved.
//

import UIKit

open class BaseNavigationViewController: UINavigationController {

    override open func viewDidLoad() {
        super.viewDidLoad()
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = UIColor.red
        navBar.tintColor = UIColor.white
        navBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: UIColor.white, NSAttributedStringKey.font: UIFont.systemFont(ofSize: 18)]
        // Do any additional setup after loading the view.
    }
    
    override open func pushViewController(_ viewController: UIViewController, animated: Bool) {
        /// 这时push进来的控制器viewController，不是第一个子控制器（不是根控制器）
        if viewControllers.count > 0 {
            // push 后隐藏 tabbar
            viewController.hidesBottomBarWhenPushed = true
       viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(named: "app_b_back"), style: .plain, target: self, action: #selector(navigationBackClick))
            self.interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate;

        }
        
        super.pushViewController(viewController, animated: true)
    }
    /// 返回按钮
    @objc func navigationBackClick() {
        if ((self.navigationController != nil) || (self.presentedViewController != nil ) && self.childViewControllers.count == 1) {
            _ = dismiss(animated: true, completion: nil)
            
        }else{
        _ = popViewController(animated: true)
        }
    }
    


    override open func didReceiveMemoryWarning() {
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
