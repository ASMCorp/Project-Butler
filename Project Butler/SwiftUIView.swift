//
//  SwiftUIView.swift
//  Project Butler
//
//  Created by Asaduzzaman Anik on 26/12/21.
//

import SwiftUI

struct SwiftUIView: View {
    
    @State var viewSize: CGSize = CGSize(width: 200, height: 200)
    var initialPoint: CGPoint {
        return CGPoint(x: 0, y: viewSize.height)
    }
    
    var body: some View {
        LinearGradient(colors: [Color(UIColor(hexString: "#430E84")),Color(UIColor(hexString: "#3C055E")),Color(UIColor(hexString: "#2F065A"))], startPoint: .top, endPoint: .bottom)
            
    }
}



struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIView()
    }
}
