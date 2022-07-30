//
//  PannableView.swift
//  Project Butler
//
//  Created by Asaduzzaman Anik on 26/7/22.
//

import SwiftUI
import UIKit

struct PannableView: View {
    @State var postion: CGPoint = .zero
    @State var points: [CGPoint] = []
    @State var shouldCloseSubpath: Bool = false
    
    var body: some View {
        ZStack{
            Circle()
                .frame(width: 10, height: 10, alignment: .center)
                .position(x: postion.x, y: postion.y)
                .gesture(
                    DragGesture().onChanged({ value in
                        let posX = (value.translation.width + value.startLocation.x)-5
                        let posY = (value.translation.height + value.startLocation.y)-5
                        postion = CGPoint(x: posX, y: posY)
                        points.append(postion)
                        shouldCloseSubpath = false
                    })
                    .onEnded({ value in
                        shouldCloseSubpath = true
                    })
                )
            Path{path in
                path.move(to: .zero)
                points.forEach { point in
                    //last point
                    if points[points.count-1] == point && shouldCloseSubpath{
                        path.closeSubpath()
                    }
                    else{
                        path.addLine(to: point)
                    }
                }
            }
            .stroke(lineWidth: 5)
            
        }
    }
}

struct PannableView_Previews: PreviewProvider {
    static var previews: some View {
        PannableView()
    }
}


extension Path {
    var reversed: Path {
        let reversedCGPath = UIBezierPath(cgPath: cgPath)
            .reversing()
            .cgPath
        return Path(reversedCGPath)
    }
}
