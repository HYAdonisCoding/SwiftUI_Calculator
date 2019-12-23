//
//  BlurView.swift
//  Adam_20191218_PokeMaster
//
//  Created by Adonis_HongYang on 2019/12/20.
//  Copyright © 2019 Adam. All rights reserved.
//

import SwiftUI
import UIKit

struct BlurView: UIViewRepresentable {
    
    let style: UIBlurEffect.Style
    
    func makeUIView(context: UIViewRepresentableContext<BlurView>) -> UIView {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        
        let blurEffect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: blurEffect)
        
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(blurView)
        NSLayoutConstraint.activate([
            blurView.heightAnchor.constraint(equalTo: view.heightAnchor),
            blurView.widthAnchor.constraint(equalTo: view.widthAnchor)])
        return view
    }
    func updateUIView(
        _ uiView: UIView,
        context: UIViewRepresentableContext<BlurView>) {
        
    }
    
}

extension View {
    func blurBackground(style: UIBlurEffect.Style) -> some View {
        ZStack {
            BlurView(style: style)
            self
        }
    }
}


class MainTabbarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        //设置系统默认的蓝色
        self.tabBar.tintColor = UIColor(red: 0/255, green:169/255, blue:169/255, alpha:1)
        addNormalTabbar()
    }
    // MARK: -FirstNormalTabba 第一种常用的tabbar
    /**
     优点可以拿到单独子控制器 做相应的设置
     */
    func addNormalTabbar() {
        //这里针对updateVc 改变其背景色
        let updateVc = UITabBarController.init()
        updateVc.view.backgroundColor = UIColor.red
        
        setupOneChildViewController(title: "小精灵", image: "flame", seletedImage: "flame.fill", controller: UIHostingController(rootView: PokemonRootView()))
        setupOneChildViewController(title: "我的", image: "person", seletedImage: "person.fill", controller: UIHostingController(rootView: SettingRootView.init()))
    }
    fileprivate func  setupOneChildViewController(title: String,image: String,seletedImage: String,controller: UIViewController){
        controller.tabBarItem.title = title
        controller.title = title
        //这里设置背景色 是每一个vc设置的都一样
        controller.view.backgroundColor = UIColor.white
        controller.tabBarItem.image = UIImage(systemName: image)
        controller.tabBarItem.selectedImage = UIImage(systemName: seletedImage)
        let naviController = UINavigationController.init(rootViewController: controller)
        addChild(naviController)
    }
}
