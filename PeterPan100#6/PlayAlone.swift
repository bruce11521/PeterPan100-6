//
//  PlayAlone.swift
//  PeterPan100#6
//
//  Created by 林伯翰 on 2019/10/28.
//  Copyright © 2019 林伯翰. All rights reserved.
//

import SwiftUI

struct PlayAlone: View {
    @State var inputTextField = ""
    @State var errorStr = ""
    @State var errorStatus = false
    @State var enterStrAryResult = [String]()
    @State var enterStrAry = [String]()
    @State var randomQuestionAry = [String]()
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
        VStack{
            Text("Qus:\(showRandomNumber())")
            Text("Input:\(showEnterStrAry())")
            Text("Result:\(showenterStrAryResult())")
            if errorStatus{
                Text("\(errorStr)")
            }
            VStack{
                HStack(){
                    Text("Input:")
                    TextField("來個數字吧！", text: $inputTextField)
                        .overlay(RoundedRectangle(cornerRadius: 5).stroke(lineWidth: 3))
                        .foregroundColor(Color.white)
                        .font(.title)
                }
                Button(action: {
                    self.conversionStr()
                    self.randomQuestionAryNumber()
                    self.processDataResult()
                }){
                    Text("Submit").modifier(BtnStyle())
                }
            }
            Spacer()
            VStack{
                ForEach(enterStrAryResult, id: \.self){ (index) in
                    Text("\(index),").foregroundColor(Color.white).font(.title)
                }
            }
            
        }//VStadk end
        .navigationBarTitle("Play Alone")
    }//body View End
    
    func conversionStr(){
        errorStr = ""
        var invalidCharDetected = false
        var tempStrAry = [String]()
        tempStrAry = self.inputTextField.compactMap{"\($0)"}
        //print("tempStrAry = \(tempStrAry)&isempty?\(tempStrAry.isEmpty)")
        if tempStrAry.count > 4{
            enterStrAry.removeAll()
            errorStr = "Error! Enter more than 4 number!"
            errorStatus = true
        }else if tempStrAry.count < 4{
            enterStrAry.removeAll()
            errorStr = "Error! Enter less than 4 number!"
            errorStatus = true
        }else if tempStrAry.isEmpty{
            errorStr = "Error! Input Empty, please enter number!"
            errorStatus = true
        }else{
            for item in tempStrAry{
                switch item{
                case "0","1","2","3","4","5","6","7","8","9":
                    //print("case item = \(item)")
                    enterStrAry.append(item)
                    errorStatus = false
                default:
                    //print("default: item = \(item)")
                    errorStr += "Error! \"\(item)\" isn't Number! \n"
                    errorStatus = true
                    invalidCharDetected = true
                }
            }
            if invalidCharDetected{
                enterStrAry.removeAll()
                invalidCharDetected = false
                
            }
            
         }
        
        
    }
    func showEnterStrAry() -> String{
        return "\(self.enterStrAry)"
    }
    func showenterStrAryResult() -> String{
        return "\(enterStrAryResult)"
    }
    func showRandomNumber() -> String{
        return "\(randomQuestionAry)"
    }
    func randomQuestionAryNumber(){
        if randomQuestionAry.isEmpty{
            var tempAry = [String]()
            for it in 0...9{
                tempAry.append(String(it))
            }
            tempAry.shuffle()
            for item in 0 ... 3{
                randomQuestionAry.append(tempAry[item])
            }
        }
    }
    func processDataResult(){
        //var randomQuestionAry = ["2","3","4","5"]
        //var enterStrAry = ["1","2","3","4"]
        //print("FUNC errorStatus = \(errorStatus)")
        if !errorStatus{
            var counterAgain = false
            var answerB = 0
            var answerA = 0
            var counterBB = 0
            var counterAA = 0
            for AA in randomQuestionAry{
                enterStrAryResult.append(enterStrAry[counterAA])
                for BB in enterStrAry{
                    if BB == AA && counterAA == counterBB{ //當對比時 輸入陣列位置的數字與 答案陣陣列同位置數字一樣時
                        answerA += 1
                        counterAgain = true
    //                    print("aA:\(answerA),ansAry[\(counterAA)]=\(randomQuestionAry[counterAA])")
    //                    print("aB:\(answerB),entAry[\(counterBB)]=\(enterStrAry[counterBB])")
                    }else if BB == AA && !counterAgain{  //如果不重複，Ｂ才+1
                        answerB += 1
    //                    print("aA:\(answerA),ansAry[\(counterAA)]")
    //                    print("aB:\(answerB),entAry[\(counterBB)]")
    //                    print("counterAgain = \(counterAgain)")
                    }else{
    //                    print("aA:\(answerA),ansAry[\(counterAA)]")
    //                    print("aB:\(answerB),entAry[\(counterBB)]")
    //                    print("counterAgain = \(counterAgain)")
                    }
                    counterBB += 1
                }
                counterAgain = false
                counterBB = 0
                
                counterAA += 1
            }
            enterStrAry.removeAll()
        }else{
            errorStr += "Error! processDataResult() Disable! \n"
        }
        
    }
    
    
}//ContentView End

struct PlayAlone_Previews: PreviewProvider {
    static var previews: some View {
        PlayAlone()
    }
}
