//
//  CustomCollectionview.swift
//  Project Butler
//
//  Created by Asaduzzaman Anik on 24/1/22.
//

import SwiftUI

struct smallCellBunchModel: Identifiable {
    var id: UUID
    var cellCount = 0
    init(cellCount: Int) {
        self.cellCount = cellCount
        self.id = UUID()
    }
}

struct CustomCollectionview: View {
    
    @State var cells = [0,0,0,0,0,0,1,1,1,1,2,2,2,2]
    
    var mediumCellsCount: Int{
        return cells.filter({$0 == 1}).count
    }
    
    var largeCellsCount: Int{
        return cells.filter({$0 == 2}).count
    }
    
    var smallViewsCount : Int  {
        return cells.filter({$0==0}).count
    }
    
    var smallBunches: [smallCellBunchModel] {
    
        let isEven = (smallViewsCount%2==0)
        var buncs : [smallCellBunchModel] = []
        
        if isEven{
            buncs = [smallCellBunchModel](repeating: smallCellBunchModel(cellCount: 2), count: smallViewsCount/2)
        }
        else{
            buncs = [smallCellBunchModel](repeating: smallCellBunchModel(cellCount: 2), count: Int((Double(smallViewsCount)/2.0).rounded(.down)))
            buncs.append(smallCellBunchModel(cellCount: 1))
        }
        
        
        
        return buncs
    }
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center, spacing: 10) {
                ForEach(smallBunches){i in
                    HStack{
                        ForEach(0..<i.cellCount){_ in
                            RoundedRectangle(cornerRadius: 20)
                                .frame(width: 150, height: 150, alignment: .leading)
                        }
                    }
                }
               
                
                VStack{
                    ForEach(0..<mediumCellsCount){i in
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 300, height: 150, alignment: .center)
                    }
                    ForEach(0..<largeCellsCount){i in
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 300, height: 300, alignment: .center)
                    }
                }
                    
                
            }
        }
    }
}

struct CustomCollectionview_Previews: PreviewProvider {
    static var previews: some View {
        CustomCollectionview()
    }
}

struct smallCell: View {
    var cells = [0,1]
    var body: some View {
        HStack{
            ForEach(0..<cells.count){_ in
                RoundedRectangle(cornerRadius: 20)
                    .frame(width: 100, height: 100, alignment: .center)
            }
        }
    }
}
