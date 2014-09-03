//
//  TraitOverrideVC.swift
//  FriendMission
//
//  Created by csnguyen on 7/20/14.
//  Copyright (c) 2014 csnguyen. All rights reserved.
//

import UIKit

class TraitOverrideVC: UIViewController, UISplitViewControllerDelegate {
    var splitVC:UISplitViewController!
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        splitVC = segue.destinationViewController as? UISplitViewController
        splitVC.preferredDisplayMode = UISplitViewControllerDisplayMode.AllVisible
        splitVC.delegate = self
    }

    //This is the magic - override UI Traits in landscape mode
//    override func viewWillTransitionToSize(size: CGSize, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator!)
//    {
//        // width large enough to see bot Master and Detail
//        if (size.width > 320.0) {
//            let tc1 = self.traitCollection;
//            let tc2 = UITraitCollection(horizontalSizeClass: UIUserInterfaceSizeClass.Regular)
//            let traits = UITraitCollection(traitsFromCollections: [tc1, tc2])
//            self.setOverrideTraitCollection(traits, forChildViewController: splitVC)
//            // set childs viewcontroller of split become horizon compact
//            for vc in splitVC.viewControllers{
//                let tc1 = UITraitCollection(verticalSizeClass: UIUserInterfaceSizeClass.Compact)
//                let tc2 = UITraitCollection(horizontalSizeClass: UIUserInterfaceSizeClass.Compact)
//                let traits = UITraitCollection(traitsFromCollections: [tc1, tc2])
//                splitVC.setOverrideTraitCollection(traits, forChildViewController: vc as UIViewController)
//            }
//
//        } else {
//            self.setOverrideTraitCollection(nil, forChildViewController: splitVC)
//        }
//        super.viewWillTransitionToSize(size, withTransitionCoordinator: coordinator)
//    }
    
    //MARK: Split view controller delegate
    // decide whether show Detail as first or not
    func splitViewController(splitViewController: UISplitViewController!, collapseSecondaryViewController secondaryViewController: UIViewController!, ontoPrimaryViewController primaryViewController: UIViewController!) -> Bool {
        // in case Master not show and Detail is not set, then show Master view
        if !(secondaryViewController as FriendDetailVC).friendInfo {
            return true
        }
        return false
    }
}
