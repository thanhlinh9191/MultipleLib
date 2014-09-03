//
//  MapVC.swift
//  FriendMission
//
//  Created by csnguyen on 7/22/14.
//  Copyright (c) 2014 csnguyen. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController, UIPopoverPresentationControllerDelegate, UIAdaptivePresentationControllerDelegate {
    
    @IBInspectable var popoverOniPhone:Bool = false
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
        //cancel button
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Cancel, target: self, action: "doneTapped:")
        
        // popover settings
        modalPresentationStyle = .Popover
        popoverPresentationController.delegate = self
        
        self.preferredContentSize = CGSize(width:320, height:400)
    }

    func doneTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    //MARK: UIAdaptivePresentationControllerDelegate
    func adaptivePresentationStyleForPresentationController(PC: UIPresentationController!) -> UIModalPresentationStyle {
        // this methods is only called by System when the screen has compact width
        if popoverOniPhone {
            return .None
        }
        return .FullScreen
    }
    //MARK: UIAdaptivePresentationControllerDelegate
    func presentationController(_: UIPresentationController!, viewControllerForAdaptivePresentationStyle _: UIModalPresentationStyle) -> UIViewController!{
        // this methods is only called by System when the screen has compact width
        return UINavigationController(rootViewController: self)
    }

}

