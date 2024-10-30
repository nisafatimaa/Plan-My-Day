//
//  TabBarController.swift
//  Plan My Day
//
//  Created by Nisa on 23/10/2024.
//

import UIKit

class TabBarController: UITabBarController {

    
    // MARK: - Properties
    var upperLineView: UIView!
    let spacing: CGFloat = 12
    let centerButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        
        //delay of 0.2 sec
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
            self.addTabbarIndicatorView(index: 0, isFirstTime: true)
        }
        
        //item text color
        UITabBar.appearance().tintColor = .black
        setupMiddleButton()
    }
    
    
    // MARK: - Functions
    func addTabbarIndicatorView (index: Int, isFirstTime: Bool = false) {
        guard let tabView = tabBar.items?[index].value(forKey: "view") as? UIView else {
             return
         }
        
        if !isFirstTime {
            upperLineView.removeFromSuperview()
        }
        
        upperLineView = UIView(frame: CGRect(x: tabView.frame.minX + spacing, y: tabView.frame.minY + 0.1, width: tabView.frame.size.width - spacing * 2, height: CGFloat(4)))
        
        upperLineView.backgroundColor = UIColor.purple1
        tabBar.addSubview(upperLineView)
    }
   
    
    //Central Button
    func setupMiddleButton() {
        
        let buttonSize: CGFloat = 64.0
        centerButton.frame = CGRect(x: (self.view.bounds.width / 2) - (buttonSize / 2),
                                    y: -20,  //button sits above tabbar
                                    width: buttonSize,
                                    height: buttonSize)
        
        centerButton.layer.cornerRadius = buttonSize / 2
        centerButton.backgroundColor = UIColor.purple1
        centerButton.setImage(UIImage(systemName: "plus"), for: .normal)
        centerButton.tintColor = .white
        
        centerButton.addTarget(self, action: #selector(centerButtonTapped), for: .touchUpInside)
        
        centerButton.layer.shadowColor = UIColor.purple1.cgColor
        centerButton.layer.shadowOpacity = 0.9
        centerButton.layer.shadowRadius = 12
        
        self.tabBar.addSubview(centerButton)
    }
        
    @objc func centerButtonTapped() {
    }
}


//to respond to tabbar interaction events
extension TabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        addTabbarIndicatorView(index: self.selectedIndex)
    }
}
