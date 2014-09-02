//
//  ViewController.swift
//  MonkeyPinch
//
//  Created by Caroline on 31/07/2014.
//  Copyright (c) 2014 Caroline. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIGestureRecognizerDelegate {
  @IBOutlet var monkeyPan: UIPanGestureRecognizer!
  @IBOutlet var bananaPan: UIPanGestureRecognizer!
  var chompPlayer:AVAudioPlayer? = nil
  var hehePlayer:AVAudioPlayer? = nil
  
  func loadSound(filename:NSString) -> AVAudioPlayer {
    let url = NSBundle.mainBundle().URLForResource(filename, withExtension: "caf")
    var error:NSError? = nil
    let player = AVAudioPlayer(contentsOfURL: url, error: &error)
    if error != nil {
      println("Error loading \(url): \(error?.localizedDescription)")
    } else {
      player.prepareToPlay()
    }
    return player
  }
  override func viewDidLoad() {
    super.viewDidLoad()
    
    //1
    let filteredSubviews = self.view.subviews.filter({
      $0.isKindOfClass(UIImageView) })
    
    // 2
    for view in filteredSubviews  {
      // 3
      let recognizer = UITapGestureRecognizer(target: self, action:Selector("handleTap:"))
      // 4
      recognizer.delegate = self
      view.addGestureRecognizer(recognizer)
      
      recognizer.requireGestureRecognizerToFail(monkeyPan)
      recognizer.requireGestureRecognizerToFail(bananaPan)
      
      //TODO: Add a custom gesture recognizer too
      
      let recognizer2 = TickleGestureRecognizer(target: self, action: Selector("handleTickle:"))
      recognizer2.delegate = self
      view.addGestureRecognizer(recognizer2)
    }
    self.chompPlayer = self.loadSound("chomp")
    self.hehePlayer = self.loadSound("hehehe1")
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  
  @IBAction func handlePan(recognizer:UIPanGestureRecognizer) {
    //comment for panning
    //uncomment for tickling
    return;
    
    let translation = recognizer.translationInView(self.view)
    recognizer.view.center = CGPoint(x:recognizer.view.center.x + translation.x,
      y:recognizer.view.center.y + translation.y)
    recognizer.setTranslation(CGPointZero, inView: self.view)
    
    if recognizer.state == UIGestureRecognizerState.Ended {
      // 1
      let velocity = recognizer.velocityInView(self.view)
      let magnitude = sqrt((velocity.x * velocity.x) + (velocity.y * velocity.y))
      let slideMultiplier = magnitude / 200
      println("magnitude: \(magnitude), slideMultiplier: \(slideMultiplier)")
      
      // 2
      let slideFactor = 0.1 * slideMultiplier     //Increase for more of a slide
      // 3
      var finalPoint = CGPoint(x:recognizer.view.center.x + (velocity.x * slideFactor),
        y:recognizer.view.center.y + (velocity.y * slideFactor))
      // 4
      finalPoint.x = min(max(finalPoint.x, 0), self.view.bounds.size.width)
      finalPoint.y = min(max(finalPoint.y, 0), self.view.bounds.size.height)
      
      // 5
      UIView.animateWithDuration(Double(slideFactor * 2),
        delay: 0,
        // 6
        options: UIViewAnimationOptions.CurveEaseOut,
        animations: {recognizer.view.center = finalPoint },
        completion: nil)
    }
  }
  
  @IBAction func handlePinch(recognizer : UIPinchGestureRecognizer) {
    recognizer.view.transform = CGAffineTransformScale(recognizer.view.transform,
      recognizer.scale, recognizer.scale)
    recognizer.scale = 1
  }
  
  @IBAction func handleRotate(recognizer : UIRotationGestureRecognizer) {
    recognizer.view.transform = CGAffineTransformRotate(recognizer.view.transform, recognizer.rotation)
    recognizer.rotation = 0
  }
  
  
  
  func gestureRecognizer(UIGestureRecognizer,
    shouldRecognizeSimultaneouslyWithGestureRecognizer:UIGestureRecognizer) -> Bool {
      return true
  }
  
  func handleTap(recognizer: UITapGestureRecognizer) {
    self.chompPlayer?.play()
  }
  
  func handleTickle(recognizer:TickleGestureRecognizer) {
    self.hehePlayer?.play()
  }
}

