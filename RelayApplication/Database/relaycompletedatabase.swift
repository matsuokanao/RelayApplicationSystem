//
//  relaycompletedatabase.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/02.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import Foundation
import Firebase

struct relaycomplete: Identifiable {
    var id: String
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
    var member1 :String
    var member2 :String
    var member3 :String
    var member4 :String
    var member5 :String
    var member6 :String

}

//読み込み
class getRelayCompleteList : ObservableObject{
    @Published var data = [relaycomplete]()
    
    init() {
        let db = Firestore.firestore()
        db.collection("relaycomplete").getDocuments{ (snap, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            for i in snap!.documents{
                let id = i.documentID
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
                let member1 = i.get("member1") as! String
                let member2 = i.get("member2") as! String
                let member3 = i.get("member3") as! String
                let member4 = i.get("member4") as! String
                let member5 = i.get("member5") as! String
                let member6 = i.get("member6") as! String
                
                
                self.data.append(relaycomplete(id: id, userpass: userpass, email: email, pay: pay, gamename: gamename, year: year, month: month, day: day, place: place, gamevenue: gamevenue, groupname: groupname, groupnum: groupnum, grouppass: grouppass, jaaf: jaaf, belong: belong, phonenumber: phonenumber, ceo: ceo,username:username,member1:member1,member2:member2,member3:member3,member4:member4,member5:member5,member6:member6))
                
            }
        }
    }
}
