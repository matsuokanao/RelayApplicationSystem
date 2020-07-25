//
//  managerView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/21.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import Firebase

struct ManagerView: View {
    var body: some View {
        Button(action: {
                try! Auth.auth().signOut()
        UserDefaults.standard.set(false, forKey: "status")
            NotificationCenter.default.post(name: NSNotification.Name("status"),
                    object: nil)
                                
            }){
        Text("ログアウト")
            .foregroundColor(.white)
            .padding(.vertical)
            .frame(width: UIScreen.main.bounds.width - 250)
                }
            .background(Color("blackcolor"))
            .cornerRadius(10)
            .padding(.top, 10)
    }
}

struct ManagerView_Previews: PreviewProvider {
    static var previews: some View {
        ManagerView()
    }
}
