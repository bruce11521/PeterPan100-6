//
//  PlayTogether.swift
//  PeterPan100#6
//
//  Created by 林伯翰 on 2019/10/28.
//  Copyright © 2019 林伯翰. All rights reserved.
//

import SwiftUI

struct PlayTogether: View {
    //@State var inputTextField = ""
    
    var body: some View {
        VStack{
            Text("持續開發中....").font(.largeTitle)
//            TextField("來個數字吧！", text: $inputTextField)
//                .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 5))
//                .foregroundColor(Color.white)
            
        }//VStadk end
        .navigationBarTitle("Play Together")
    }//body View End
    
}//ContentView End

struct PlayTogether_Previews: PreviewProvider {
    static var previews: some View {
        PlayTogether()
    }
}
