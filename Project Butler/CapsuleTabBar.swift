//
//  CapsuleTabBar.swift
//  Project Butler
//
//  Created by Asaduzzaman Anik on 10/4/22.
//

import UIKit

class CapsuleTabBarController: UITabBarController {
    let capsulBar = CapsulTabBar()
    let capsul: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.cornerRadius(38)
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
//        setValue(capsulBar, forKey: "tabBar")
        tabBar.cornerRadius(38)
        self.tabBar.backgroundColor = .white
        
        self.additionalSafeAreaInsets = UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0)
//        self.tabBar.addSubview(capsul)
//        capsul.centerInSuperview()
//        capsul.setDimensions(width: 350, height: 76)

        let vc1 = UINavigationController(rootViewController: ViewController())
        vc1.view.backgroundColor = .red
        vc1.tabBarItem = UITabBarItem(title: "dsdsdsd", image: UIImage(systemName: "star.fill"), selectedImage: UIImage(systemName: "star"))
        vc1.tabBarItem.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        vc1.isNavigationBarHidden = true
        
        let vc2 = UINavigationController(rootViewController: ViewController())
        vc2.view.backgroundColor = .green
        vc2.tabBarItem = UITabBarItem(title: "dsdsd", image: UIImage(systemName: "star.fill"), selectedImage: UIImage(systemName: "star"))
        vc2.isNavigationBarHidden = true
        
        let vc3 = UINavigationController(rootViewController: ViewController())
        vc3.view.backgroundColor = .blue
        vc3.tabBarItem = UITabBarItem(title: "dsdsd", image: UIImage(systemName: "star.fill"), selectedImage: UIImage(systemName: "star"))
        vc3.isNavigationBarHidden = true
        
        self.viewControllers = [vc1, vc2, vc3]
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame.size.width = 350
        tabBar.frame.size.height = 76
        tabBar.center.x = self.view.center.x
        tabBar.frame.origin.y = view.frame.height - 200
    }
}


class CapsulTabBar: UITabBar{
    private var shapeLayer: CALayer?
    private func addShape() {
        let shapeLayer = CAShapeLayer()
        let path = UIBezierPath(roundedRect: CGRect(origin: CGPoint(x: 0, y: 0 ), size: CGSize(width: 350, height: 76)), cornerRadius: 38)
        
        shapeLayer.path = path.cgPath
        
        shapeLayer.fillColor = UIColor.white.cgColor

        if let oldShapeLayer = self.shapeLayer {
            self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
        } else {
            self.layer.insertSublayer(shapeLayer, at: 0)
        }

        self.shapeLayer = shapeLayer
    }
    override func draw(_ rect: CGRect) {
        addShape()
    }
}
