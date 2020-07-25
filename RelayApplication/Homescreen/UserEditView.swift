//
//  UserEditView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/24.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI

struct UserEditView: View {
    @ObservedObject var userdata = getUserdataList()
    @State var PassEmail = ""
    @State var PassPass = ""
    
    var body: some View {
        ZStack{
        Color("skyblue")
            .edgesIgnoringSafeArea(.all)
            

        VStack(alignment: .leading, spacing: 20){
            Text("編集するユーザーのメールアドレスとユーザーパスを入力して下さい")
                .fontWeight(.bold)
                .foregroundColor(.white)
            Text("メールアドレス")
                .fontWeight(.bold)
                .foregroundColor(.white)
            TextField("メールアドレス", text: self.$PassEmail)
                .foregroundColor(Color("blackcolor"))
                .background(RoundedRectangle(cornerRadius: 4).stroke(self.PassEmail != "" ? Color("blackcolor") : (Color.white),lineWidth:  2))
                .background(Color.white)
            
            Text("ユーザーパス")
                .fontWeight(.bold)
                .foregroundColor(.white)
            
            TextField("ユーザーパス", text: self.$PassPass)
                .foregroundColor(Color("blackcolor"))
                .background(RoundedRectangle(cornerRadius: 4).stroke(self.PassPass != "" ? Color("blackcolor") : (Color.white),lineWidth:  2))
                .background(Color.white)


            
        
        VStack{
        List(self.userdata.data,id: \.id){i in
            CellView(userdata: i)
                    }
                }
            }
        }
    }
}

struct UserEditView_Previews: PreviewProvider {
        static var previews: some View {
        UserEditView()
    }
}

 struct CellView :View {
 @State var color = Color.black.opacity(0.7)
 @State var show = false
        var userdata : userlist
 var body: some View {
    HStack{
        Text(userdata.username)
        }
    }
}


