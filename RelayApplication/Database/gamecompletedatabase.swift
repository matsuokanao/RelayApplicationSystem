//
//  gamecompletedatabase.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/31.
//  Copyright © 2020 松岡奈央. All rights reserved.
//
import Foundation
import Firebase

struct gamecomplete: Identifiable {
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
    var groupname : String
    var groupnum : String
    var grouppass : String
    var jaaf : String
    var belong : String
    var phonenumber : String
    var ceo : String
    var username : String
    var end : String
    var sex : String
}

//読み込み
class getGameCompleteList : ObservableObject{
    @Published var data = [gamecomplete]()
    
    init() {
        let db = Firestore.firestore()
        db.collection("gamecomplete").getDocuments{ (snap, err) in
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
                let groupname = i.get("groupname") as! String
                let groupnum = i.get("groupnum") as! String
                let grouppass = i.get("grouppass") as! String
                let jaaf = i.get("jaaf") as! String
                let belong = i.get("belong") as! String
                let phonenumber = i.get("phonenumber") as! String
                let ceo = i.get("ceo") as! String
                let username = i.get("username") as! String
                let end = i.get("end") as! String
                let sex = i.get("sex") as! String
                
                
                self.data.append(gamecomplete(id: id, event1: event1, event2: event2, event3: event3, userpass: userpass, email: email, pay: pay, gamename: gamename, year: year, month: month, day: day, place: place, gamevenue: gamevenue, groupname: groupname, groupnum: groupnum, grouppass: grouppass, jaaf: jaaf, belong: belong, phonenumber: phonenumber, ceo: ceo,username:username,end: end,sex: sex))
                
            }
        }
    }
}
