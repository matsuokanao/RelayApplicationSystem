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
    var year: String
    var month: String
    var day: String
    var place: String
    var gamevenue: String
    var png: String
    var link: String
    var groupname : String
    var groupnum : String
    var email : String
    var grouppass : String
    var relay : String
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
                let year = i.get("year") as! String
                let month = i.get("month") as! String
                let day = i.get("day") as! String
                let place = i.get("place") as! String
                let gamevenue = i.get("gamevenue") as! String
                let png = i.get("png") as! String
                let link = i.get("link") as! String
                let groupname = i.get("groupname") as! String
                let groupnum = i.get("groupnum") as! String
                let email = i.get("email") as! String
                let grouppass = i.get("grouppass") as! String
                let relay = i.get("relay") as! String

                self.data.append(gamelist(id: id, gamename: gamename, year: year, month: month, day: day, place: place, gamevenue: gamevenue, png: png, link: link, groupname: groupname, groupnum: groupnum, email: email,grouppass :grouppass,relay : relay))
            }
        }
    }
}




