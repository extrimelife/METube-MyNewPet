//
//  TabBarViewController.swift
//  MeTube Pet
//
//  Created by roman Khilchenko on 22.02.2023.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    let mainViewController = MainViewController()
    let secondVC = SecondViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        setupNavigationBar()
    }
    
    private func setupNavigation() {
        let mainVC = UINavigationController(rootViewController: mainViewController)
        mainVC.tabBarItem.title = "Home"
        mainVC.tabBarItem.image = UIImage(systemName: "house")
        
        let secondVC = UINavigationController(rootViewController: secondVC)
        secondVC.tabBarItem.title = "Favorite"
        secondVC.tabBarItem.image = UIImage(systemName: "heart")
        
        viewControllers = [mainVC, secondVC]
    }
    
    private func setupNavigationBar() {
        // mainViewController.navigationItem.title =  "MeTube"
       // mainViewController.navigationController?.navigationBar.prefersLargeTitles = true
        
        let label = UILabel()
        label.text = "MeTube"
        label.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        label.textColor = .white
        
        let imageView = UIImageView(image: UIImage(named: "MeTube@3x.png"))
        imageView.frame = CGRect(x: 0, y: 0, width: 20, height: 20)
        imageView.contentMode = .scaleAspectFit
        
        let stackView = UIStackView(arrangedSubviews: [imageView, label])
        stackView.axis = .horizontal
        //stackView.distribution = .fillEqually
        stackView.alignment = .leading
        stackView.frame.size = CGSize(width: imageView.frame.size.width + label.frame.size.width,
                                      height: max(imageView.frame.size.height, label.frame.size.height
                                                 ))
        mainViewController.navigationItem.titleView = stackView
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.backgroundColor = UIColor(hexString: "#2e0142")
        
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        mainViewController.navigationController?.navigationBar.standardAppearance = navBarAppearance
        mainViewController.navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
        mainViewController.navigationController?.navigationBar.tintColor = .white
    }
}
