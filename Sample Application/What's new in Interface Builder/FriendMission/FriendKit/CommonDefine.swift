//
//  CommonDefine.swift
//  FriendMission
//
//  Created by csnguyen on 7/18/14.
//  Copyright (c) 2014 csnguyen. All rights reserved.
//

import Foundation
// define
let closeFriendMeetingTime:CGFloat = 10
// utility functions
func strokeColorByPercent(percent:Double)->UIColor {
    var strokeColor:UIColor?
    switch percent {
    case let r where r > 0.8:
        strokeColor = UIColor(hue: 359.0/360.0, saturation: 0.39, brightness: 0.85, alpha: 1.0)
    case let r where r > 0.5:
        strokeColor = UIColor(hue: 208.0/360.0, saturation: 0.51, brightness: 0.75, alpha: 1.0)
    case let r where r > 0.3:
        strokeColor = UIColor(hue: 112.0/360.0, saturation: 0.39, brightness: 0.85, alpha: 1.0)
    default:
        strokeColor = UIColor(hue: 40.0/360.0, saturation: 0.39, brightness: 0.85, alpha: 1.0)
    }
    return strokeColor!
}