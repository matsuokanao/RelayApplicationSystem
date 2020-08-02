//
//  userdatabase.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/23.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import Foundation
import FirebaseFirestore


struct userlist: Identifiable {
var id: String
//名前
var username : String
//登録陸連
    var jaaf : String
//所属名
    var belong : String
//代表者名
    var ceo : String
//メールアドレス
    var email : String
//電話番号
    var phonenumber : String
//ユーザーパスワード
    var userpass : String

}

//読み込み
class getUserdataList : ObservableObject{
    @Published var data = [userlist]()
    
    init() {
        let db = Firestore.firestore()
        db.collection("userlist").getDocuments{ (snap, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            for i in snap!.documents{
                let id = i.documentID
                let username = i.get("username") as! String
                let jaaf = i.get("jaaf") as! String
                let email = i.get("email") as! String
                let belong = i.get("belong") as! String
                let ceo = i.get("ceo") as! String
                let phonenumber = i.get("phonenumber") as! String
                let userpass = i.get("userpass") as! String
                                
                self.data.append(userlist(id: id,username: username, jaaf: jaaf, belong: belong, ceo: ceo, email: email, phonenumber: phonenumber, userpass: userpass))
            }
        }
    }
}


