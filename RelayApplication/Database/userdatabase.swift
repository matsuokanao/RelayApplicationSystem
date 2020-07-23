//
//  userdatabase.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/23.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import Foundation
import FirebaseFirestore


struct userdatalist: Identifiable {
var id: String
var username: String
var email: String
}

//読み込み
class getUserdataList : ObservableObject{
    @Published var data = [userdatalist]()
    
    init() {
        let db = Firestore.firestore()
        db.collection("userdatalist").getDocuments{ (snap, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            for i in snap!.documents{
                
                let id = i.documentID
                let username = i.get("username") as! String
                let email = i.get("email") as! String
                
                
                self.data.append(userdatalist(id: id, username: username, email: email))
            }
        }
    }
}


