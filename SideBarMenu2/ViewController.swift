//
//  ViewController.swift
//  SideBarMenu2
//
//  Created by Jorge Pinedo on 6/29/19.
//  Copyright © 2019 Jorge Pinedo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var menu_vc: MenuViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menu_vc = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(self.responseToGesture))
        swipeRight.direction = UISwipeGestureRecognizer.Direction.right
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(self.responseToGesture))
        swipeLeft.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipeRight)
        self.view.addGestureRecognizer(swipeLeft)
    }
    
    @objc func responseToGesture(gesture: UISwipeGestureRecognizer){
        switch gesture.direction {
        case UISwipeGestureRecognizer.Direction.right:
            print("right")
            showMenu()
        case UISwipeGestureRecognizer.Direction.left:
            print("left")
            close_menu_swipe()
        default:
            break
        }
    }
    
    func close_menu_swipe(){
        if AppDelegate.menu_bool{
            
        }else{
            closeMenu()
        }
    }

    @IBAction func menu_action(_ sender: UIBarButtonItem) {
        if AppDelegate.menu_bool {
            showMenu()
        }else{
            closeMenu()
        }
    }

    func showMenu(){
        UIView.animate(withDuration: 0.6) {
            self.menu_vc.view.frame = CGRect(x: 0, y: 60, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
            self.menu_vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
            self.addChild(self.menu_vc)
            self.view.addSubview(self.menu_vc.view)
            
        }
        AppDelegate.menu_bool = false
      
    }
    
    func closeMenu(){
        UIView.animate(withDuration: 0.3, animations: {
            self.menu_vc.view.frame = CGRect(x: -UIScreen.main.bounds.size.width, y: 60, width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.height)
        }) { (finished) in
            self.menu_vc.view.removeFromSuperview()
        }
        AppDelegate.menu_bool = true
    }
}

