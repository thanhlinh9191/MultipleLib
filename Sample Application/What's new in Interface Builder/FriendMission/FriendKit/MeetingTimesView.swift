//
//  MeetingTimesView.swift
//  FriendMission
//
//  Created by csnguyen on 7/18/14.
//  Copyright (c) 2014 csnguyen. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable public class MeetingTimesView: UIView {

    var backgroundLayer:CAShapeLayer!
    var rateLayer:CAShapeLayer!
    var timesLbl:UILabel!
    let lineWidth:CGFloat = 2.0
    
    
    @IBInspectable var width:CGFloat = 150.0 {
    didSet {invalidateIntrinsicContentSize()}
    }
    @IBInspectable var height:CGFloat = 25.0 {
    didSet {invalidateIntrinsicContentSize()}
    }
    @IBInspectable public var meetingTimes:CGFloat = 7{
    didSet {updateLayerProperty()}
    }
    @IBInspectable var strokeColor:UIColor = UIColor(white: 0.5, alpha: 0.3)
    {
    didSet {updateLayerProperty()}
    }
    @IBInspectable var labelColor:UIColor = UIColor.darkGrayColor(){
    didSet {updateLayerProperty()}
    }
    
    override public func layoutSubviews()  {
        super.layoutSubviews()
        if !backgroundLayer {
            backgroundLayer = CAShapeLayer()
            layer.addSublayer(backgroundLayer)
            
            let rect = bounds
            backgroundLayer.fillColor = nil
            backgroundLayer.lineWidth = lineWidth
            backgroundLayer.frame = bounds
        }
        
        if !rateLayer {
            rateLayer = CAShapeLayer()
            layer.addSublayer(rateLayer)
            rateLayer.frame = bounds
        }
        if !timesLbl {
            timesLbl = UILabel()
            timesLbl.setTranslatesAutoresizingMaskIntoConstraints(false)
            
            addSubview(timesLbl)
            addConstraint(NSLayoutConstraint(item:timesLbl, attribute:.CenterY, relatedBy:.Equal, toItem:self, attribute:.CenterY, multiplier:1, constant:0))
            addConstraint(NSLayoutConstraint(item:timesLbl, attribute:.Right, relatedBy:.Equal, toItem:self, attribute:.Right, multiplier:1, constant:0))
        }
        updateLayerProperty()
    }
    //MARK: Helper functions
    func updateLayerProperty() {
        var rect = bounds
        if timesLbl {
            timesLbl.text = "Met \(meetingTimes) times"
            timesLbl.textColor = labelColor
            rect.size.width -= timesLbl.intrinsicContentSize().width + 5.0
        }
        if backgroundLayer {
            backgroundLayer.path = UIBezierPath(roundedRect: rect, cornerRadius: 5.0).CGPath
            backgroundLayer.fillColor = nil
            backgroundLayer.lineWidth = lineWidth
            backgroundLayer.strokeColor = strokeColor.CGColor
            backgroundLayer.frame = bounds
        }
        if rateLayer {
            rect = CGRectInset(rect, lineWidth, lineWidth)
            let percent = self.meetingTimes / closeFriendMeetingTime
            rect.size.width *= (percent > 1.0 ? 1.0 : percent)
            rateLayer.path = UIBezierPath(roundedRect: rect, cornerRadius: 5.0).CGPath
            rateLayer.fillColor = strokeColorByPercent(Double(percent)).CGColor
        }
    }
    //MARK: For layout
    override public func intrinsicContentSize() -> CGSize {
        return CGSize(width: width, height: height)
    }
    
    override public func viewForBaselineLayout() -> UIView! {
        return timesLbl
    }
}
