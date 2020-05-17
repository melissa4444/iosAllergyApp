//
//  ContentView.swift
//  iosAllergyApp
//
//  Created by Melissa Nguyen on 5/16/20.
//  Copyright © 2020 Melissa Nguyen. All rights reserved.
//

import SwiftUI
import Firebase

struct ContentView: View {
    
    @ObservedObject var data = getData()
    
    var body: some View {
       
        NavigationView{
            
            ZStack(alignment: .top){
                
                GeometryReader{_ in
                    
                    // Home View....
                    Text("Home")
                    
                }.background(Color("Color").edgesIgnoringSafeArea(.all))
                
                UserSearchBar(data: self.$data.datas).padding(.top)
                
            }.navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct UserSearchBar : View {
    
    @State var txt = ""
    @Binding var data : [dataType]
    
    var body : some View{
        
        VStack(spacing: 0){
            
            HStack{
                
                TextField("Search", text: self.$txt)
                
                if self.txt != ""{
                    
                    Button(action: {
                        
                        self.txt = ""
                        
                    }) {
                        
                        Text("Cancel")
                    }
                    .foregroundColor(.black)
                    
                }

            }.padding()
            
            if self.txt != ""{
                
                if  self.data.filter({$0.name.lowercased().contains(self.txt.lowercased())}).count == 0{
                    
                    Text("No Results Found").foregroundColor(Color.black.opacity(0.5)).padding()
                }
                else{
                    
                List(self.data.filter{$0.name.lowercased().contains(self.txt.lowercased())}){i in
                            
                    NavigationLink(destination: Detail(data: i)) {
                        
                        Text(i.name)
                    }
                            
                        
                    }.frame(height: UIScreen.main.bounds.height / 5)
                }

            }
            
            
        }.background(Color.white)
        .padding()
    }
}

class getData : ObservableObject{
    
    @Published var datas = [dataType]()
    
    init() {
        
        let db = Firestore.firestore()
        
        db.collection("items").getDocuments { (snap, err) in
            
            if err != nil{
                
                print((err?.localizedDescription)!)
                return
            }
            
            for i in snap!.documents{
                
                let id = i.documentID
                let name = i.get("name") as! String
                let msg = i.get("msg") as! String
                
                self.datas.append(dataType(id: id, name: name, msg: msg))
            }
        }
    }
}

struct dataType : Identifiable {
    
    var id : String
    var name : String
    var msg : String
}

struct Detail : View {
    
    var data : dataType
    
    var body : some View{
        
        Text(data.msg)
    }
}
