//
//  RootTabBarController.swift
//  SaleDemo
//
//  Created by UnRafe on 19/1/2567 BE.
//

import UIKit
import SocketIO

class RootTabBarController: UITabBarController {

    enum Tab: Int {
        case Home = 0, Wallet, Achievement, Profile
    }
    
    /// Controllers
    private var homeViewController: UIViewController!
    private var walletViewController: UIViewController!
    private var achievementViewController: UIViewController!
    private var profileViewController: UIViewController!
    var socket: SocketIOClient!
    let manager = SocketManager(
        socketURL: URL(string: "wss://px-socket-emitter.saleherethailand.com")!,
        config: [.log(true), .compress]
    )
    
    /// List of controller
    private var listController: [UIViewController]!
    private var height = 100.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabbarInterface()
        initialTabbar()
        setupSocket()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        self.setupCustomTabBarFrame()
    }
    
    func setupTabbarInterface() {
        tabBar.backgroundColor = .white
        tabBar.tintColor = .red
        tabBar.isTranslucent = false
        UITabBar.appearance().barTintColor = .white
    }
    
    /// Setup controller
    func initialTabbar() {
        
        let homeVC: UIViewController? = HomeConfigurator().configured(nil)
        homeViewController = RootNavigationController.init(rootViewController: homeVC!)
        
        let walletVC: UIViewController? = UIViewController()
        walletViewController = RootNavigationController.init(rootViewController: walletVC!)
        walletVC?.view.backgroundColor = .white
        
        let achmVC: UIViewController? = AchievementConfigurator().configured(nil)
        achievementViewController = RootNavigationController.init(rootViewController: achmVC!)
        
        let profileVC: UIViewController? = UIViewController()
        profileViewController = RootNavigationController.init(rootViewController: profileVC!)
        profileVC?.view.backgroundColor = .white
        
        setupTabIcon()
        listController = [
            homeViewController,
            walletViewController,
            achievementViewController,
            profileViewController
        ]
        viewControllers = listController
        setBadge(badge: "67", in: .Profile)
    }
    
    private func setupTabIcon() {
        self.tabBar.backgroundColor = .white
        
        // Set icon tabbar
        homeViewController.tabBarItem.image = UIImage(named: "ic_tabbar_home")
        walletViewController.tabBarItem.image = UIImage(named: "ic_tabbar_wallet")
        achievementViewController.tabBarItem.image = UIImage(named: "ic_tabbar_badge")
        profileViewController.tabBarItem.image = UIImage(named: "ic_tabbar_user")
    }
    
    private func setupCustomTabBarFrame() {
        let height = view.safeAreaInsets.bottom + 70
        var tabFrame = tabBar.frame
        tabFrame.size.height = height
        tabFrame.origin.y = self.view.frame.size.height - height
        tabBar.frame = tabFrame
        tabBar.setNeedsLayout()
        tabBar.layoutIfNeeded()
        
        tabBar.layer.borderWidth = 0.50
        tabBar.layer.borderColor = UIColor.lightGray.cgColor
        tabBar.clipsToBounds = true
    }
    
    func setBadge(badge: String, in tab: RootTabBarController.Tab) {
        if let item = self.tabBar.items?[tab.rawValue] {
            item.badgeValue = badge
        }
    }
    
    func setupSocket() {
        socket = manager.defaultSocket
        subscribe()
    }
    
    func subscribe() {
        socket.on("new-notification") { data, ack in
            if let title = data[0] as? String {
                self.setBadge(badge: title, in: .Profile)
            }
        }
        
        // For test
        socket.onAny {
            let random = Int.random(in: 1..<20)
            self.setBadge(badge: "\(random)", in: .Profile)
            print("Got event: \($0.event), with items: \($0.items!)")
        }
        socket.connect()
    }
}
