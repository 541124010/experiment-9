//
//  ViewController.swift
//  Gesture
//
//  Created by liguiyang on 2018/11/7.
//  Copyright © 2018年 xionghuan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    var circle:CircleView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let circle=CircleView(frame: CGRect(x: 100, y: 70, width: 100, height: 100))
        circle.color=#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        circle.backgroundColor=UIColor.red
        view.addSubview(circle)
        
    }

    @IBAction func add(_ sender: Any) {
        
        let x = Int(arc4random()) % Int(self.view.bounds.width)
        let y = Int(arc4random()) % Int(self.view.bounds.height)

        let label = UILabel(frame: CGRect(x: x, y: y, width: 100, height: 100))
        label.text = "A"
        label.textAlignment = .center
        label.backgroundColor = UIColor.red
        
        label.layer.shadowColor = UIColor.gray.cgColor
        label.layer.shadowOffset = CGSize(width: 10, height: 10)
        label.layer.shadowOpacity = 1
        
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer:)))
        label.addGestureRecognizer(panRecognizer)
        label.isUserInteractionEnabled = true
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(recognizer:)))
        label.addGestureRecognizer(tapRecognizer)
        tapRecognizer.numberOfTapsRequired = 2
        
        let rotationgesture = UIRotationGestureRecognizer(target: self, action: #selector(rotation(gesture:)))
        label.addGestureRecognizer(rotationgesture)
        
        self.view.addSubview(label)
        
    }
    
    @objc func pan(recognizer: UIPanGestureRecognizer) {
        if recognizer.state == .changed  || recognizer.state == .ended {
            let translation = recognizer.translation(in: self.view)
            recognizer.view?.center.x += translation.x
            recognizer.view?.center.y += translation.y
            recognizer.setTranslation(.zero, in: self.view)
        }
    }
    
    @objc func tap(recognizer: UITapGestureRecognizer) {
        if recognizer.state == .recognized {
            recognizer.view?.removeFromSuperview()
            
        }
    }
    
    @objc func rotation(gesture:UIRotationGestureRecognizer){
            let rotation=gesture.rotation
            //    self.view.transform=self.view.transform.rotated(by: rotation)
        gesture.view!.transform=CGAffineTransform(rotationAngle: rotation) //可以了
      
            gesture.rotation=0//必须有
            
        
      
    }
    
    @IBAction func deleteView(_ sender: Any) {
        for label in self.view.subviews {
            if label is UILabel {
               label.removeFromSuperview()
            }
        }
        
    }
    @IBAction func move(_ sender: Any) {
        for label in self.view.subviews {
            if label is UILabel {
                UIView.animate(withDuration: 1) {
                    let x = Int(arc4random()) % Int(self.view.bounds.width)
                    let y = Int(arc4random()) % Int(self.view.bounds.height)
                    label.center = CGPoint(x: x, y: y)
                }
            }
        }
        
    }
    
    @IBAction func movecircle(_ sender: Any) {
       // circle.color=UIColor.purple
     //circle.radius+=CGFloat(10)
     circle?.setNeedsDisplay()
        
    }
    
    
}

