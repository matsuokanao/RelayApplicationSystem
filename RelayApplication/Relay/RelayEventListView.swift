//
//  RelayEventListView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/05.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct RelayEventListView: View {
    var event = [
        "男子4*100mR",
        "女子4*100mR",
        "男子4*400mR",
        "女子4*400mR",
        "男女混合4*400mR"
    ]
    
    var body: some View {
        VStack{
            Text("種目表通りに出場種目を記入して下さい。出場種目がない場合は　なし と記入して下さい。")
            List(self.event,id: \.self){i in
                
                Text(i)
                
            }
        }.frame(width: 300, height: 600)
    }
}


struct RelayEventListView_Previews: PreviewProvider {
    static var previews: some View {
        RelayEventListView()
    }
}
