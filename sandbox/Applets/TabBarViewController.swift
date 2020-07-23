//
//  TabBarViewController.swift
//  sandbox
//
//  Created by Alex  Hu on 2020-07-20.
//  Copyright © 2020 Alex  Hu. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    var visualDiffs = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //visualDifferences()
    }
    
    func viewWillDissapear(_ animated: Bool) {
        visualDiffs = settings.visualDiffsOn
        if (visualDiffs){
            visualDifferences()
        }
        else{
            originalVisual()
        }
    }
    
    
    func visualDifferences(){
        let myTabBarItem1 = (self.tabBar.items?[0])! as UITabBarItem
        myTabBarItem1.image = #imageLiteral(resourceName: "icons8-bookmark-30").withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem1.selectedImage = #imageLiteral(resourceName: "icons8-bookmark-30").withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        /*
        self.tabBarController?.tabBar.items![0].image = #imageLiteral(resourceName: "icons8-bookmark-30")
            // items![0] index of your tab bar item.items![0] means tabbar first item
        self.tabBarController?.tabBar.items![0].selectedImage = #imageLiteral(resourceName: "icons8-bookmark-30")
 */
    }
    func originalVisual(){
        let myTabBarItem1 = (self.tabBar.items?[0])! as UITabBarItem
        myTabBarItem1.image = #imageLiteral(resourceName: "homeCombined Shape").withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        myTabBarItem1.selectedImage = #imageLiteral(resourceName: "homeCombined Shape").withRenderingMode(UIImage.RenderingMode.alwaysOriginal)
        
        /*
        self.tabBarController?.tabBar.items![0].image = #imageLiteral(resourceName: "homeCombined Shape")
            // items![0] index of your tab bar item.items![0] means tabbar first item
        self.tabBarController?.tabBar.items![0].selectedImage =
 */
    }
    
}
