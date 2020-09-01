//
//  timedatabase.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/08/01.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import Foundation
import Firebase


struct timelist: Identifiable {
    var id: String
    //日記内容
    var diary: String
    //日付　年
    var year: String
    //日付　月
    var month: String
    //日付　日
    var day: String
    //天気
    var weather: String
    //気持ち
    var mental: String
    //大会名
    var tournamentname: String
    var email : String
    var userpass :String
    //種目
    var event : String
    //記録
    var time : String
    
}

//読み込み
class getTimeList : ObservableObject{
    @Published var data = [timelist]()
    
    init() {
        let db = Firestore.firestore()
        db.collection("timelist").getDocuments{ (snap, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            for i in snap!.documents{
                let id = i.documentID
                let diary = i.get("diary") as! String
                let year = i.get("year") as! String
                let month = i.get("month") as! String
                let day = i.get("day") as! String
                let weather = i.get("weather") as! String
                let mental = i.get("mental") as! String
                let tournamentname = i.get("tournamentname") as! String
                let email = i.get("email") as! String
                let userpass = i.get("userpass") as! String
                let event = i.get("event") as! String
                let time = i.get("time") as! String
                
                self.data.append(timelist(id: id, diary: diary, year: year, month: month, day: day, weather: weather, mental:mental,tournamentname: tournamentname,email: email,userpass : userpass,event  :event,time:time))
            }
        }
    }
}




