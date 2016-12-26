//
// BeatAnimator.swift
//
// Copyright (c) 2014 Josip Cavar
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:

// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.

// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import Foundation
import Refresher
import QuartzCore


class BeatAnimator: UIView, PullToRefreshViewDelegate {
    
    private let layerLoader = CAShapeLayer()
    private let layerSeparator = CAShapeLayer()
    
    
    var labelTitle: UILabel!

    var shapeLayer:CAShapeLayer!
    
    var atioAnmition:CABasicAnimation!
    
    var tmpProcess:CGFloat!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        tmpProcess = 0.0
        
        layerLoader.lineWidth = 4
        layerLoader.strokeColor = UIColor(red: 0.13, green: 0.79, blue: 0.31, alpha: 1).cgColor
        layerLoader.strokeEnd = 0
        
        layerSeparator.lineWidth = 1
        layerSeparator.strokeColor = UIColor(red: 0.7, green: 0.7, blue: 0.7, alpha: 1).cgColor
        
        self.addSubview(self.activityIndicator)
        
        self.initLayer()
        }
    
    
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initLayer() -> Void {
        
        let rect = self.frame
        
        shapeLayer = CAShapeLayer.init()
        
        shapeLayer.frame = rect
        
        let height = rect.size.height
        
//        let width = rect.size.width / 3
        
        let aPath:UIBezierPath = UIBezierPath.init()
        
        //1.
        aPath.move(to: CGPoint(x: rect.size.width / 2, y: 10))
        
        //2.
        aPath.addLine(to: CGPoint(x: rect.size.width / 10 * 6, y: height / 10 * 3.5))
        
        //3.
        aPath.addLine(to: CGPoint(x: rect.size.width / 10 * 7.5, y: height / 10 * 3.5))
        
        //4.
        aPath.addLine(to: CGPoint(x: rect.size.width / 10 * 6.3 , y: height / 10 * 6))
        
        //5.
        aPath.addLine(to: CGPoint(x: rect.size.width / 10 * 6.6, y: height - 10))
        
        //6.
        aPath.addLine(to: CGPoint(x: rect.size.width / 2, y: height / 10 * 7))
        
        //7.
        aPath.addLine(to: CGPoint(x: rect.size.width / 10 * 3.4, y: height - 10))
        
        //8.
        aPath.addLine(to: CGPoint(x: rect.size.width / 10 * 3.7 , y: height / 10 * 6))
        
        //9.
        aPath.addLine(to: CGPoint(x: rect.size.width / 10 * 2.5, y: height / 10 * 3.5))
        
        //10.
        aPath.addLine(to: CGPoint(x: rect.size.width / 10 * 4, y: height / 10 * 3.5))
        
        //1.
        aPath.addLine(to: CGPoint(x: rect.size.width / 2, y: 10))
        
        aPath.close()
        
        
        shapeLayer.path = aPath.cgPath
        
        shapeLayer.lineWidth = 1
        
        let ca:CAShapeLayer = CAShapeLayer.init()
        
        ca.shadowPath = aPath.cgPath
        
//        ca.shadowColor = UIColor.blue.cgColor
        
//        ca.strokeColor = UIColor.red.cgColor
        
//        ca.fillColor = UIColor.clear.cgColor
        
        ca.shadowOffset = CGSize(width: 4, height: 0)
        
        ca.shadowRadius = 15
        
        ca.shadowOpacity = 0.1
        
        shapeLayer.strokeColor = UIColor.gray.cgColor
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        
//        shapeLayer.addSublayer(ca)
        
        self.layer.addSublayer(shapeLayer)
        
        self.ratioAnmition_left(process: 1.0)

        
    }
    
    func startAnimation() -> Void {
        
        let ratioAnination:CABasicAnimation = CABasicAnimation.init(keyPath: "transform.rotation.z")
        
        ratioAnination.duration = 2
        
        ratioAnination.repeatCount = 1000
        
        ratioAnination.fromValue = NSNumber(value: 0)
        
        ratioAnination.toValue = NSNumber(value: M_PI * 2)
        
        shapeLayer.add(ratioAnination, forKey: "ratio-layer")
        
        
    }
    
    func ratioAnmition_left(process:CGFloat) -> Void {
        
        atioAnmition = CABasicAnimation.init(keyPath: "transform.rotation.z")
        
        atioAnmition.duration = 0.3
        
        atioAnmition.repeatCount = 1
        
        atioAnmition.fromValue = NSNumber(value: (-M_PI * 2 * Double(tmpProcess)))
        
        atioAnmition.toValue = NSNumber(value: (-M_PI * 2 * Double(process)))
        
        tmpProcess = process
        
        atioAnmition.isRemovedOnCompletion = false

        atioAnmition.fillMode = kCAFillModeForwards;
        
        shapeLayer.add(atioAnmition, forKey: "ratio-layer-left")
    }
    
    lazy var activityIndicator: UIActivityIndicatorView = {
        
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle:
            UIActivityIndicatorViewStyle.gray)
        
        var center:CGPoint = self.center
        
//        center.y = center.y * 2 / 3 * 2
        
        activityIndicator.center = center
        
        //activityIndicator.backgroundColor = UIColor.white
        
        return activityIndicator
    }()
    
    func pullToRefresh(_ view: PullToRefreshView, progressDidChange progress: CGFloat) {
        
        layerLoader.strokeEnd = progress
        
        print("progress = ",progress)
    
        shapeLayer.strokeEnd = progress
        
        shapeLayer.removeAnimation(forKey: "ratio-layer-left")
        
        self.ratioAnmition_left(process: progress)
        
        
        }
    
    func pullToRefresh(_ view: PullToRefreshView, stateDidChange state: PullToRefreshViewState) {
        
        if state == PullToRefreshViewState.loading {
            
            self.activityIndicator.startAnimating()
            
            self.startAnimation()
            
        }else if state == PullToRefreshViewState.pullToRefresh{
            
            self.activityIndicator.stopAnimating()
            
            shapeLayer.removeAnimation(forKey: "ratio-layer")

            
        }
        
        
        
    }
    
    func pullToRefreshAnimationDidEnd(_ view: PullToRefreshView) {
        
        layerLoader.removeAllAnimations()
        
    }
    
    func pullToRefreshAnimationDidStart(_ view: PullToRefreshView) {
        let pathAnimationEnd = CABasicAnimation(keyPath: "strokeEnd")
        pathAnimationEnd.duration = 0.5
        pathAnimationEnd.repeatCount = 100
        pathAnimationEnd.autoreverses = true
        pathAnimationEnd.fromValue = 1
        pathAnimationEnd.toValue = 0.8
        layerLoader.add(pathAnimationEnd, forKey: "strokeEndAnimation")
        
        let pathAnimationStart = CABasicAnimation(keyPath: "strokeStart")
        pathAnimationStart.duration = 0.5
        pathAnimationStart.repeatCount = 100
        pathAnimationStart.autoreverses = true
        pathAnimationStart.fromValue = 0
        pathAnimationStart.toValue = 0.2
        layerLoader.add(pathAnimationStart, forKey: "strokeStartAnimation")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        if let superview = superview {
            if layerLoader.superlayer == nil {
                superview.layer.addSublayer(layerLoader)
            }
            if layerSeparator.superlayer == nil {
                superview.layer.addSublayer(layerSeparator)
            }
            let bezierPathLoader = UIBezierPath()
            bezierPathLoader.move(to: CGPoint(x: 0, y: superview.frame.height - 3))
            bezierPathLoader.addLine(to: CGPoint(x: superview.frame.width, y: superview.frame.height - 3))
            
            let bezierPathSeparator = UIBezierPath()
            bezierPathSeparator.move(to: CGPoint(x: 0, y: superview.frame.height - 1))
            bezierPathSeparator.addLine(to: CGPoint(x: superview.frame.width, y: superview.frame.height - 1))
            
            layerLoader.path = bezierPathLoader.cgPath
            layerSeparator.path = bezierPathSeparator.cgPath
        }
    }
    
    
}
