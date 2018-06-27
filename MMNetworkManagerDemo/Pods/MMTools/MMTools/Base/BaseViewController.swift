//
//  BaseViewController.swift
//  mts-manager
//
//  Created by lizhe on 2018/2/23.
//  Copyright © 2018年 com.ctsi.mts.iphone. All rights reserved.
//

import UIKit
//import RxSwift
enum Direction : String {
    case left, right
}
open class BaseViewController: UIViewController {
    // MARK: Initializing
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required convenience public init?(coder aDecoder: NSCoder) {
        self.init()
    }
    
    
    // MARK: Rx
    
//    let disposeBag = DisposeBag()
    
    // MARK: Override
    override open func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.mtsWhite
        self.edgesForExtendedLayout = UIRectEdge()
        self.automaticallyAdjustsScrollViewInsets = false;
        self.navigationController?.navigationBar.backgroundColor = UIColor.mtsWhite
        // Do any additional setup after loading the view.
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

extension BaseViewController
{
    
    //设置左边item以及返回方式
    open func baseSetNavLeftButtonIsBack()
    {
        baseSetNavButtonWith(nil, imageName: "navigationBack", button: nil, direction: .left, tag: 100)
    }
    open func baseSetNavLeftButtonIsDismiss()
    {
        baseSetNavButtonWith(nil, imageName: "navigationBack", button: nil, direction: .left, tag: 200)
    }
    
    // 设置左边
    open func baseSetNavLeftButtonWithTitle(_ title : String) {
        baseSetNavButtonWith(title, imageName: nil, button: nil, direction: .left, tag : 0)
    }
    open func baseSetNavLeftButtonWithImage(_ imageName :String) {
        baseSetNavButtonWith(nil, imageName: imageName, button: nil, direction: .left, tag : 0)
    }
    open func baseSetNavLeftButtonWithButton(_ button : UIButton) {
        baseSetNavButtonWith(nil, imageName: nil, button: button, direction: .left, tag : 0)
    }
    
    // 设置右边
    open func baseSetNavRightButtonWithTitle(_ title : String) {
        self.baseSetNavButtonWith(title, imageName: nil, button: nil, direction: .right, tag: 0)
    }
    open func baseSetNavRightButtonWithImage(_ imageName : String) {
        self.baseSetNavButtonWith(nil, imageName: imageName, button: nil, direction: .right, tag : 0)
    }
    open func baseSetNavRightButtonWithButton(_ button : UIButton) {
        self.baseSetNavButtonWith(nil, imageName: nil, button: button, direction: .right, tag : 0)
    }
    
    // 默认设置导航栏左右按钮
    fileprivate func baseSetNavButtonWith(_ title : String?, imageName : String?, button : UIButton?, direction : Direction, tag : Int){
        
        var btn : UIButton! = UIButton.init(type: .custom)
        
        var action : Selector? = nil
        
        switch direction{
        case .left :
            action = #selector(self.baseNavLeftButtonPressed(_:))
        case .right :
            action = #selector(self.baseNavRightButtonPressed(_:))
        }
        if title != nil {
            btn.setTitle(title, for: UIControlState())
            btn.titleLabel?.font = UIFont.systemFont(ofSize: 16)
            btn.setTitleColor(UIColor.white, for: UIControlState())
            btn.addTarget(self, action: action!, for: .touchUpInside)
        }
        if imageName != nil {
            btn.setImage(UIImage(named: imageName!), for: UIControlState())
            btn.addTarget(self, action: action!, for: .touchUpInside)
        }
        if button != nil {
            btn = button
        }
        btn.tag = tag
        btn.sizeToFit()
        let barItem = UIBarButtonItem(customView: btn)
        let spaceItem = UIBarButtonItem(barButtonSystemItem: .fixedSpace, target:nil, action: nil)
        
        switch direction {
        case .left :
            navigationItem.leftBarButtonItems = [spaceItem,barItem]
        case .right:
            navigationItem.rightBarButtonItems = [barItem,spaceItem]
        }
    }
    //右边按钮点击方法
    @objc func baseNavRightButtonPressed(_ button : UIButton){
        
    }
    @objc func baseNavLeftButtonPressed(_ button : UIButton)
    {
        switch button.tag
        {
        case 100:
            _ = navigationController?.popViewController(animated: true)
        case 200:
            _ = dismiss(animated: true, completion: nil)
        default: break
        }
    }
    
}
