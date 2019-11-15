//
//  ContentView.swift
//  PeterPan100#6
//
//  Created by 林伯翰 on 2019/10/28.
//  Copyright © 2019 林伯翰. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    //@State var inputTextField = ""
    @State var btnStr: String = "Play Alone"
    @State var isPlayAlone = true
    @State var alertTrigger = false
    
    struct BtnStyle: ViewModifier {
        func body(content: Content) -> some View{
            return content
            .foregroundColor(Color.white)
            .font(.largeTitle)
            .padding()
            .overlay(RoundedRectangle(cornerRadius: 44).stroke(lineWidth: 5))
            .background(Color.orange)
            .cornerRadius(44)
        }
    }
    
    
    var body: some View {
        //NavigationView {
        VStack{
            Divider()
            Text("1A2B:\(String(isPlayAlone))")
                .fontWeight(.bold)
                .font(.largeTitle)
            Divider()
            Spacer()
                HStack{
                    VStack{
                        Button(action: {
                            self.btnPlayAlone()
                        }){
                        Image("PlayAlone")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color.black)
                            
                        }
                    }
                    VStack{
                        Button(action: {
                            self.btnPlayTogether()
                        }){
                        Image("PlayTogether")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(Color.black)
                        }
                    }
                }
            Spacer()
            if isPlayAlone{
                VStack{
                    NavigationLink(destination: PlayAlone()){
                        Text("\(btnStr)!")
                        .fontWeight(.bold)
                        .modifier(BtnStyle())
                    }
                }
            }else{
                VStack{
                    Button(action: {
                        self.alertTrigger = true
                    }){
                        Text("\(btnStr)").fontWeight(.bold)
                    }.modifier(BtnStyle())
                        .alert(isPresented: $alertTrigger) { () -> Alert in
                            return Alert(
                                title: Text("Sorry!"),
                                message: Text("Still Building...."),
                                dismissButton: .default(Text("Acknowledge!"))
                            )}
                    /*
                    NavigationLink(destination: PlayTogether()){
                        
                            Text("\(btnStr)").fontWeight(.bold)
                        .modifier(BtnStyle())
                    }
                    */
                }
            }
            Spacer()
        }//VStadk end
        .navigationBarTitle("1A2B")
        .background(Color.white)
        //}//navigationView end
    }//body View End
    
    func btnPlayAlone(){
        isPlayAlone = true
        btnStr = "Play Alone"
    }
    func btnPlayTogether(){
        isPlayAlone = false
        btnStr = "Play Together"
    }
}//ContentView End

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
