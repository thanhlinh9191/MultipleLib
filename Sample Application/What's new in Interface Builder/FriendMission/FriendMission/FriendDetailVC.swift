//
//  FriendDetailVC.swift
//  FriendMission
//
//  Created by csnguyen on 7/18/14.
//  Copyright (c) 2014 csnguyen. All rights reserved.
//

import UIKit
import FriendKit

@IBDesignable class FriendDetailVC: UIViewController {
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var timesView: MeetingTimesView!
    @IBOutlet var bottomBarView: UIView!
    
    var friendInfo:FriendInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.tintColor = UIColor.orangeColor()

        if let fi = friendInfo {
            imageView.image = UIImage(named: fi.fullImageName)
            timesView.meetingTimes = CGFloat(fi.meetingTimes)
            title = fi.name
            addBlurEffectToView(bottomBarView)
        }
        // in case no Friend selected yet
        else {
            let view = UIView()
            view.backgroundColor = UIColor.blackColor()
            
            let label = UILabel()
            label.setTranslatesAutoresizingMaskIntoConstraints(false)
            label.text = "Not selected Friend yet"
            label.textColor = UIColor.whiteColor()
            label.font = UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline)
            
            view .addSubview(label)
            view.addConstraint(NSLayoutConstraint(item:label, attribute:.CenterX, relatedBy:.Equal, toItem:view, attribute:.CenterX, multiplier:1, constant:0))
            view.addConstraint(NSLayoutConstraint(item:label, attribute:.CenterY, relatedBy:.Equal, toItem:view, attribute:.CenterY, multiplier:1, constant:0))
            self.view = view
        }
    }
    
    //MARK: Helper functions
    func addBlurEffectToView(view:UIView) {
        let visualEffectView = UIVisualEffectView(effect: UIBlurEffect(style:UIBlurEffectStyle.Light))
        
        // Setting frame of our new view using superview bounds
        visualEffectView.frame = view.bounds
        visualEffectView.autoresizingMask = UIViewAutoresizing.FlexibleHeight|UIViewAutoresizing.FlexibleWidth
        view.addSubview(visualEffectView)
        
        // Sending blurred view to back because we want to use it as background of our view
        view.sendSubviewToBack(visualEffectView)
    }
}
