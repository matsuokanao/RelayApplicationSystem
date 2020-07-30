//
//  provisionaldatabase.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/30.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import Foundation
import Firebase


struct provisionallist: Identifiable {
    var id: String
    var event1 : String
    var event2 : String
    var event3 :String
    var userpass: String
    var email: String
    var pay: String
    var gamename :String
    var year: String
    var month: String
    var day: String
    var place: String
    var gamevenue: String
    
}

//読み込み
class getProvisionalList : ObservableObject{
    @Published var data = [provisionallist]()
    
    init() {
        let db = Firestore.firestore()
        db.collection("provisionallist").getDocuments{ (snap, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            for i in snap!.documents{
                let id = i.documentID
                let event1 = i.get("event1") as! String
                let event2 = i.get("event2") as! String
                let event3 = i.get("event3") as! String
                let userpass = i.get("userpass") as! String
                let email = i.get("email") as! String
                let pay = i.get("pay") as! String
                let gamename = i.get("gamename") as! String
                let year = i.get("year") as! String
                let month = i.get("month") as! String
                let day = i.get("day") as! String
                let place = i.get("place") as! String
                let gamevenue = i.get("gamevenue") as! String
                
                self.data.append(provisionallist(id: id, event1: event1, event2: event2, event3: event3, userpass: userpass, email: email, pay: pay,gamename:gamename,year: year,month : month,day :day,place :place,gamevenue : gamevenue))
            }
        }
    }
}

