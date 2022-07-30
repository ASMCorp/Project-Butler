//
//  ViewController.swift
//  Project Butler
//
//  Created by Asaduzzaman Anik on 21/12/21.
//

import UIKit
import SwiftUI
//import SwiftUI
//import Combine
//
//struct tag: Identifiable {
//    let id = UUID()
//    var tag: Int
//    var isHidden: Bool
//}
//
//class customModel: ObservableObject {
//    @Published var count: Int = 4
//    @Published var tags: [tag] = [tag(tag: 1, isHidden: false),
//                                  tag(tag: 2, isHidden: true),
//                                  tag(tag: 3, isHidden: false),
//                                  tag(tag: 4, isHidden: false),]
//    func add(){
//        count += 1
//    }
//
//    func minus(){
//        count -= 1
//    }
//
//}
//
//class ViewController: UIViewController {
//
//    let label = UILabel()
//
//    let countLabel: UILabel = {
//       let lab = UILabel()
//
//        return lab
//    }()
//
//    private var cancellable: AnyCancellable?
//
//    let containerView: UIView = {
//        let v = UIView()
//        v.layer.borderColor = UIColor.gray.cgColor
//        v.layer.borderWidth = 1
//
//        return v
//    }()
//
//    var count: Int = 0
//
//    var countModel = customModel()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
////        view.addSubview(label)
////        view.addSubview(countLabel)
////        countLabel.anchorView(top: label.bottomAnchor)
////        countLabel.centerX(inView: view)
////
////        label.text = "Press For magic"
////        label.textColor = .red
////        countLabel.textColor = .green
////        label.centerX(inView: view)
////        label.centerY(inView: view)
////        label.isUserInteractionEnabled = true
////
////        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped))
////        label.addGestureRecognizer(tapGesture)
////
////        view.addSubview(containerView)
////        containerView.anchorView( bottom: label.topAnchor,paddingBottom: 50, width: 200, height: 200)
////        containerView.centerX(inView: view)
//
//        setupSwiftuiView()
//
//        setupStuffs()
//    }
//
//    func setupStuffs(){
//        cancellable = countModel.$count.sink(receiveValue: { count in
//            self.count = count
//            self.changeLabel()
//        })
//    }
//
//    func setupSwiftuiView(){
//        let swiftuiVC = UIHostingController(rootView: CustomCollectionview())
//        view.addSubview(swiftuiVC.view)
//        swiftuiVC.view.fillSuperview()
//    }
//
//    func changeLabel(){
//        countLabel.text = count.description
//    }
//
//    @objc func tapped(){
//        countModel.minus()
//        changeLabel()
//    }
//
//}
//

class ViewController: UIViewController {
    
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
        
//        let hostingController = UIHostingController(rootView: PannableView())
//        hostingController.view.backgroundColor = .clear
//
//        view.addSubview(hostingController.view)
//        hostingController.view.fillSuperview()
        
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
