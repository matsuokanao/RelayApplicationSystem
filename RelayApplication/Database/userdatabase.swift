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
var username: String
var email: String
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
                let email = i.get("email") as! String
                
                
                self.data.append(userlist(id: id, username: username, email: email))
            }
        }
    }
}


