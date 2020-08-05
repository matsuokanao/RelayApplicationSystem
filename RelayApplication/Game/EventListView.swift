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
            "男子100m",
            "女子100m",
            "男子200m",
            "女子200m",
            "男子400m",
            "女子400m",
            "男子110mH",
            "女子100mH",
            "男子走り幅跳び",
            "女子走り幅跳び",
            "男子砲丸投げ",
            "女子砲丸投げ",
            "男子走り高跳び",
            "女子走り高跳び",
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
