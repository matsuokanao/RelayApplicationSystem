//
//  gamedatabase.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/24.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import Foundation
import FirebaseFirestore


struct gamelist: Identifiable {
var id: String
var gamename: String
var place: String
}

//読み込み
class getGamedataList : ObservableObject{
    @Published var data = [gamelist]()
    
    init() {
        let db = Firestore.firestore()
        db.collection("gamelist").getDocuments{ (snap, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            for i in snap!.documents{
                
                let id = i.documentID
                let gamename = i.get("gamename") as! String
                let place = i.get("place") as! String
                
                self.data.append(gamelist(id: id, gamename: gamename, place: place))
            }
        }
    }
}




