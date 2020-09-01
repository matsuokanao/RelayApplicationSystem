//
//  EventListView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/04.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct EventListView: View {
    
    
    var event = [
        "100m",
        "200m",
        "400m",
        "ハードル走",
        "走り幅跳び",
        "砲丸投げ",
        "走り高跳び",
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


struct EventListView_Previews: PreviewProvider {
    static var previews: some View {
        EventListView()
    }
}
