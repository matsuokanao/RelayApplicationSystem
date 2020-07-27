//
//  authoritydatabase.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/26.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import Foundation
import Firebase


struct authority: Identifiable {
var id: String
var email: String
}

//読み込み
class getAuthorityList : ObservableObject{
    @Published var data = [authority]()
    
    init() {
        let db = Firestore.firestore()
        db.collection("authority").getDocuments{ (snap, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            for i in snap!.documents{
                
                let id = i.documentID
                let email = i.get("email") as! String
                
                self.data.append(authority(id: id, email: email))
            }
        }
    }
}




