//
//  DiaryView.swift
//  RelayApplication
//
//  Created by 松岡奈央 on 2020/07/26.
//  Copyright © 2020 松岡奈央. All rights reserved.
//

import SwiftUI
import Firebase

struct DiaryView: View {
    @ObservedObject var authority = getAuthorityList()

    var body: some View {
        VStack{
            VStack{
                ForEach(self.authority.data,id: \.id){i in
                        DiaryCellView(authority: i)
                }
            }
        }
    }
}



struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView()
    }
}

struct DiaryCellView: View {
    @State var show = false
    @State var diaryfinishshow = false
    var authority : authority
    
    //日記内容
    @State var diary = ""
    //日付　年
    @State var year = ""
    //日付　月
    @State var month = ""
    //日付　日
    @State var day = ""
    //天気
    @State var weather = ""
    //気持ち
    @State var mental = ""
    //大会名
    @State var tournamentname = ""
    @State var alert = false

    var body: some View {
    VStack{
        VStack{
           Text("今日の陸上はどうでしたか？")
            .fontWeight(.bold)
            .foregroundColor(.white)
            Text("思った事を書き出してみましょう")
            .fontWeight(.bold)
            .foregroundColor(.white)
        }.frame(width:500,height: 100)
            .background(Color("red3"))
        ScrollView{
            VStack(alignment: .leading, spacing: 20){
                HStack{
                Image(systemName: "calendar")
                        .foregroundColor(Color("red3"))
                Text("日付")
                    Spacer()
                Button(action: {
                    self.show.toggle()
                        }) {
                    Text("日記一覧")
                        .padding(.vertical)
                        .frame(width: 100,height: 30)
                        .sheet(isPresented: $show){
                            DiaryListView()
                                    }
                                }.background(Color("red3"))
                                .foregroundColor(.white)

                }
            HStack{
            TextField("", text: self.$year)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color("red3"))
            Text("年")
                
            TextField("", text: self.$month)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color("red3"))
            Text("月")
                
            TextField("", text: self.$day)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color("red3"))
            Text("日")
                    }
            HStack{
                Image(systemName: "sun.max.fill")
                        .foregroundColor(Color("red3"))
            Text("天気")
            TextField("", text: self.$weather)
                    .keyboardType(.numberPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .background(Color("red3"))
              
                
            Image(systemName: "heart.fill")
                .foregroundColor(Color("red3"))
            Text("気持ち")
            TextField("", text: self.$mental)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color("red3"))
                    }
            HStack{
                Image(systemName: "sparkles")
                .foregroundColor(Color("red3"))
                Text("項目（大会名や題名など）")
                }
                
                
            VStack{
            TextField("", text: self.$tournamentname)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .background(Color("red3"))
                }
                HStack{
                    Image(systemName: "book.fill")
                    .foregroundColor(Color("red3"))
                    Text("気持ち")
                    }
                VStack{
                MultilineTextField(text: self.$diary)
                    .frame(width: UIScreen.main.bounds.width * 0.8, height: 500)
                    .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.black))
                    }
                
                
                Button(action: {
                    self.diaryfinishshow.toggle()
                    let db = Firestore.firestore()
                    let data: [String : Any] = ["diary": self.diary, "year": self.year, "month": self.month, "day": self.day, "weather": self.weather, "mental": self.mental, "tournamentname": self.tournamentname, "email": self.authority.email]
                    //試合申し込み完了テーブルに入れる
                    db.collection("diarylist")
                        .addDocument(data:data)
                            { (err) in
                                if err != nil{
                                    print((err?.localizedDescription)!)
                                        return
                            }
                        }
                }){
                    Text("保存する")
                        .foregroundColor(Color.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 50)
                        .background(Color("red3"))
                        .cornerRadius(30)
                        .padding(.top, 10)

                    .sheet(isPresented: $diaryfinishshow){
                        DiaryFinishView()
                        }
                    }
                }
            }
        }.frame(width: 300, height: 600)
    }
}



// 複数行入力するためのTextField
struct MultilineTextField: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.delegate = context.coordinator
        view.isScrollEnabled = true
        view.isEditable = true
        view.isUserInteractionEnabled = true
        view.font = UIFont.systemFont(ofSize: 18)
        return view
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        if uiView.text != text {
            uiView.text = text
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator : NSObject, UITextViewDelegate {

        var parent: MultilineTextField

        init(_ textView: MultilineTextField) {
            self.parent = textView
        }

        func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
            return true
        }

        func textViewDidChange(_ textView: UITextView) {
            self.parent.text = textView.text
        }
    }
}
