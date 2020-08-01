//
//  ApproveView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/28.
//  Copyright © 2020 松岡奈央. All rights reserved.
//  試合承認

import SwiftUI

struct ApproveView: View {
    @ObservedObject var gamedata = getGameCompleteList()
    @ObservedObject var data = getManagerList()
    var body: some View {
        VStack{
            ForEach(self.gamedata.data,id: \.id){i in
                List(self.data.data,id: \.id){m in
                CellApproveView(gamelist: i, managerlist: m)
                }
            }
        }
    }
}

struct ApproveView_Previews: PreviewProvider {
    static var previews: some View {
        ApproveView()
    }
}

struct CellApproveView: View {
    var gamelist : gamecomplete
    var managerlist : managerlist
var body: some View {
    VStack{
        if gamelist.grouppass == managerlist.grouppass && gamelist.groupname == gamelist.groupname{
        Text(gamelist.gamename)
            }
        }
    }
}
