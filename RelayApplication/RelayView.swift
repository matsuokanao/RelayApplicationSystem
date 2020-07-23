//
//  RelayView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/23.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct RelayView: View {
    @ObservedObject var userdata = getUserdataList()
    @ObservedObject var gamedata = getGamedataList()
    var body: some View {
        VStack{
            List(self.userdata.data,id: \.id){i in
                List(self.gamedata.data,id: \.id){g in
                CellInformationView(gamedata: g, userdata: i)
                }

            }}}
}

struct RelayView_Previews: PreviewProvider {
    static var previews: some View {
        RelayView()
    }
}
 struct CellInformationView :View {
 @State var color = Color.black.opacity(0.7)
 @State var show = false
    var gamedata : gamelist
    var userdata : userlist
 var body: some View {
    VStack{
        Text(gamedata.gamename)
        Text(userdata.username)
    }
}
}
