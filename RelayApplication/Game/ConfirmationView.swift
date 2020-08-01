//
//  ConfirmationView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/29.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import Firebase

struct ConfirmationView: View {
    
  @ObservedObject var provisionaldata = getProvisionalList()
  @ObservedObject var userdata = getUserdataList()
    
    var body: some View {
        VStack{
            ForEach(self.provisionaldata.data,id: \.id){i in
                ForEach(self.userdata.data,id: \.id){u in
                    
            CellConfirmationView(provisionallist: i, userlist: u)
                }
            }
        }
    }
}

struct ConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        ConfirmationView()
    }
}


struct CellConfirmationView: View {
    
    var provisionallist : provisionallist
    var userlist : userlist
    @State var show = false
    
    var body: some View {
        VStack{
            if provisionallist.userpass == userlist.userpass && provisionallist.email == userlist.email{
                Group{
                Text("試合名")
                Text(provisionallist.gamename)
                Text("開催都道府県")
                Text(provisionallist.place)
                Text("試合会場")
                Text(provisionallist.gamevenue)
                Text("名前")
                Text(userlist.username)
                Text("登録陸連")
                Text(userlist.jaaf)
                }
                Text("所属名")
                Text(userlist.belong)
                Text("参加種目")
                Text(provisionallist.event1)
                Text(provisionallist.event2)
                Text(provisionallist.event3)

                HStack{
                    Spacer()
                Button(action: {
                    self.show.toggle()
                    let db = Firestore.firestore()
                    let data: [String : Any] = ["event1": self.provisionallist.event1, "event2": self.provisionallist.event2, "event3": self.provisionallist.event3, "userpass": self.provisionallist.userpass, "email": self.provisionallist.email, "pay": self.provisionallist.pay,"gamename":self.provisionallist.gamename,"year":self.provisionallist.year,"month":self.provisionallist.month,"day":self.provisionallist.day,"place":self.provisionallist.place,"gamevenue":self.provisionallist.gamevenue,"groupnum":self.provisionallist.groupnum,"groupname":self.provisionallist.groupname,"grouppass": self.provisionallist.grouppass,"jaaf":self.userlist.jaaf,"belong":self.userlist.belong,"phonenumber":self.userlist.phonenumber,"ceo":self.userlist.ceo,"username":self.userlist.username]
                    //試合申し込み完了テーブルに入れる
                    db.collection("gamecomplete")
                        .document(self.provisionallist.id)
                        .setData(data)
                            { (err) in
                                if err != nil{
                                        return
                            }
                        }
                }){
                    Text("完了")
                        .fontWeight(.bold)
                        .foregroundColor(Color("blue1"))
                        .padding(.vertical)
                        .padding(.horizontal,45)
                        .background(Color.white)
                        .clipShape(Capsule())
                        
                    .sheet(isPresented: $show){
                        GameApplicationFinishView()
                
                                }
                            }
                            Spacer()
                        }
            }
        }
    }
}
