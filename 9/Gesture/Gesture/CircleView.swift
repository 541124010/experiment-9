//
//  CircleView.swift
//  Gesture
//
//  Created by liguiyang on 2018/11/7.
//  Copyright © 2018年 xionghuan. All rights reserved.
//

import UIKit

@IBDesignable
class CircleView: UIView {

    @IBInspectable var color: UIColor?
    
    var radius:Float?
    func setup() {
        let panRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(recognizer:)))
        self.addGestureRecognizer(panRecognizer)
        
        let pinchRecognizer = UIPinchGestureRecognizer(target: self, action: #selector(pinch(recognizer:)))
        self.addGestureRecognizer(pinchRecognizer)
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tap(recognizer:)))
        self.addGestureRecognizer(tapRecognizer)
        tapRecognizer.numberOfTapsRequired = 2
        
        let rotationgesture = UIRotationGestureRecognizer(target: self, action: #selector(rotation(gesture:)))
        self.addGestureRecognizer(rotationgesture)
        
        

    }
    
    @objc func pan(recognizer: UIPanGestureRecognizer) {
        if recognizer.state == .changed  || recognizer.state == .ended {
            let translation = recognizer.translation(in: self)
            self.center.x += translation.x
            self.center.y += translation.y
            recognizer.setTranslation(.zero, in: self)
        }
    }
    
    @objc func pinch(recognizer: UIPinchGestureRecognizer) {
        if recognizer.state == .changed  || recognizer.state == .ended {
            bounds = CGRect(x: 0, y: 0, width: bounds.width * recognizer.scale, height: bounds.height * recognizer.scale)
            recognizer.scale = 1
            
        }
    }
    
    @objc func tap(recognizer: UITapGestureRecognizer) {
        if recognizer.state == .recognized {
           print("tap recognized")
            
        }
    }
    
    @objc func rotation(gesture:UIRotationGestureRecognizer){
        let rotation=gesture.rotation
        self.transform=self.transform.rotated(by: rotation)
        gesture.rotation=0//必须有
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath(ovalIn: rect)
        color?.setFill()
      //  radius=self.bounds.height/(Float)10
        path.fill()
    }
    

}
