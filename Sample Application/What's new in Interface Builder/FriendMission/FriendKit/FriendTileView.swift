//
//  FriendTileView.swift
//  FriendMission
//
//  Created by csnguyen on 7/18/14.
//  Copyright (c) 2014 csnguyen. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable public class FriendTileView: UIView {
    var backgroundRingLayer:CAShapeLayer!
    var ringLayer:CAShapeLayer!
    var imageLayer:CAShapeLayer!
    
    @IBInspectable public var portraitImage:UIImage?{
    didSet {updateLayerProperty()}
    }
    
    @IBInspectable var lineWidth:CGFloat = 4.0 {
    didSet {updateLayerProperty()}
    }
    
    @IBInspectable public var meetingTimes:CGFloat = 7{
    didSet {updateLayerProperty()}
    }
    
    override public func layoutSubviews()  {
        super.layoutSubviews()
        if !imageLayer {
            let imageMaskLayer = CAShapeLayer()
            layer.addSublayer(imageMaskLayer)
            let rect = CGRectInset(bounds, lineWidth + 3.0, lineWidth + 3.0)
            imageMaskLayer.path = UIBezierPath(ovalInRect: rect).CGPath
            imageMaskLayer.frame = bounds
            
            imageLayer = CAShapeLayer()
            layer.addSublayer(imageLayer)
            imageLayer.mask = imageMaskLayer
            imageLayer.backgroundColor = UIColor.lightGrayColor().CGColor
            imageLayer.contentsGravity = kCAGravityResizeAspectFill
            imageLayer.frame = bounds
        }
        
        if !backgroundRingLayer {
            backgroundRingLayer = CAShapeLayer()
            layer.addSublayer(backgroundRingLayer)
            
            let rect = CGRectInset(bounds, lineWidth/2, lineWidth/2)
            backgroundRingLayer.path = UIBezierPath(ovalInRect: rect).CGPath
            backgroundRingLayer.fillColor = nil
            backgroundRingLayer.lineWidth = lineWidth
            backgroundRingLayer.strokeColor = UIColor(white: 0.5, alpha: 0.3).CGColor
            backgroundRingLayer.frame = bounds
        }
        
        if !ringLayer {
            ringLayer = CAShapeLayer()
            layer.addSublayer(ringLayer)
            
            let rect = CGRectInset(bounds, lineWidth/2, lineWidth/2)
            ringLayer.path = UIBezierPath(ovalInRect: rect).CGPath
            ringLayer.fillColor = nil
            ringLayer.lineWidth = lineWidth
            ringLayer.anchorPoint = CGPointMake(0.5, 0.5)
            ringLayer.transform = CATransform3DRotate(ringLayer.transform, CGFloat(-M_PI/2), 0, 0, 1)
            ringLayer.frame = bounds
        }
        
        updateLayerProperty()
    }
    //MARK: Helper functions
    func updateLayerProperty() {
        if ringLayer {
            let percent = meetingTimes / closeFriendMeetingTime
            ringLayer.strokeEnd = percent
            ringLayer.strokeColor = strokeColorByPercent(Double(percent)).CGColor
        }
        if imageLayer {
            if let i = portraitImage{
                imageLayer.contents = i.CGImage
            }
        }
    }
    //MARK: Design time only
    override public func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        if let projectPaths = NSProcessInfo.processInfo().environment["IB_PROJECT_SOURCE_DIRECTORIES"]?.componentsSeparatedByString(",") {
            if projectPaths.count > 0 {
                if let projectPath = projectPaths[0] as? String {
                    let imagePath = projectPath.stringByAppendingPathComponent("TestImages/Theron.jpg")
                    portraitImage = UIImage(contentsOfFile: imagePath)
                    println(imagePath)
                }
            }
        }
        
    }
}
