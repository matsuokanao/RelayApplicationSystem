//
//  managerdatabase.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/28.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import Foundation
import Firebase


struct managerlist: Identifiable {
    var id: String
    var groupname : String
    var groupnum : String
    var grouppass :String
    var email: String
}

//読み込み
class getManagerList : ObservableObject{
    @Published var data = [managerlist]()
    
    init() {
        let db = Firestore.firestore()
        db.collection("managerlist").getDocuments{ (snap, err) in
            if err != nil{
                print((err?.localizedDescription)!)
                return
            }
            for i in snap!.documents{
                let id = i.documentID
                let groupname = i.get("groupname") as! String
                let groupnum = i.get("groupnum") as! String
                let grouppass = i.get("grouppass") as! String
                let email = i.get("email") as! String

                
                self.data.append(managerlist(id: id, groupname: groupname, groupnum: groupnum, grouppass: grouppass, email: email))
            }
        }
    }
}

