//
//  HandDrawingVC.swift
//  Project Butler
//
//  Created by Asaduzzaman Anik on 30/7/22.
//

import UIKit

class HandDrawingVC: UIViewController {
    
    let circleView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }()
    
    let drawableView: UIView = {
        let view = UIView()
        return view
    }()
    
    var points: [CGPoint] = []
    
    override func viewDidLoad() {
        
        view.addSubview(drawableView)
        drawableView.fillSuperview()
        
        view.addSubview(circleView)
        circleView.frame = CGRect(origin: .zero, size: CGSize(width: 10, height: 10))
        circleView.cornerRadius(5)
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(handlePaGesture))
        view.addGestureRecognizer(panGesture)
    }
    
    @objc func tapGesure(){
        print("tapped")
    }
    
    
    
    //MARK:- Pan to move
    @objc func handlePaGesture(gesture: UIPanGestureRecognizer){
        let translation = gesture.location(in: view)
        if gesture.state == .began || gesture.state == .changed {
            circleView.center = translation
            points.append(circleView.center)
            gesture.setTranslation(.zero, in: view)
            drawPath()
        }
        if gesture.state == .ended{
            circleView.center = points[0]
            drawPath(shouldClosesubpath: true)
            points = []
        }
    }
    
    
    func drawPath(shouldClosesubpath: Bool = false){
        let shapeLayer = CAShapeLayer()
        let path = CGMutablePath()
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = UIColor.black.cgColor
        shapeLayer.borderWidth = 2
        
        for i in points.indices{
            if i == 0{
                path.move(to: points[i])
            }
            else{
                path.addLine(to: points[i])
                if i == points.count-1{
                    if shouldClosesubpath{
                        path.closeSubpath()
                    }
                }
            }
        }
        
        shapeLayer.path = path
        drawableView.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
        drawableView.layer.addSublayer(shapeLayer)
    }
    
}
