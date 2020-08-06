//
//  ordercompletedatabase.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/03.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import Foundation
import Firebase

struct ordercomplete: Identifiable {
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
    var order1 :String
    var order2 :String
    var order3 :String
    var order4 :String
    var set : String
    var lanes : String
    var event : String


}

//読み込み
class getOrderCompleteList : ObservableObject{
    @Published var data = [ordercomplete]()
    
    init() {
        let db = Firestore.firestore()
        db.collection("ordercomplete").getDocuments{ (snap, err) in
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
                let order1 = i.get("order1") as! String
                let order2 = i.get("order2") as! String
                let order3 = i.get("order3") as! String
                let order4 = i.get("order4") as! String
                let set = i.get("set") as! String
                let lanes = i.get("lanes") as! String
                let event = i.get("event") as! String
                
                self.data.append(ordercomplete(id: id, userpass: userpass, email: email, pay: pay, gamename: gamename, year: year, month: month, day: day, place: place, gamevenue: gamevenue, groupname: groupname, groupnum: groupnum, grouppass: grouppass, jaaf: jaaf, belong: belong, phonenumber: phonenumber, ceo: ceo,username:username,order1:order1,order2:order2,order3:order3,order4:order4,set:set,lanes:lanes,event:event))
                
            }
        }
    }
}
