//
//  EditPhotoView.swift
//  TenYear
//
//  Created by SHIH-YING PAN on 2019/10/16.
//  Copyright © 2019 SHIH-YING PAN. All rights reserved.
//

import SwiftUI

extension BlendMode {
    var name: String {
        return "\(self)"
    }
}

struct EditPhotoView: View {
    let blendModes: [BlendMode] = [.screen, .colorDodge, .colorBurn]

    @State private var selectBlend = BlendMode.screen

    @State private var brightnessAmount: Double = 0
    @State private var selectDate = Date()
    @State private var name = ""
    @State private var page1 = false
    @State public var send = false
    let today = Date()
    let startDate = Calendar.current.date(byAdding: .year, value: -2, to: Date())!
    var year: Int {
        Calendar.current.component(.year, from: selectDate)
    }
    
    var body: some View {
        GeometryReader { geometry in
            
            NavigationView {
                VStack {
                    
                    ZStack {
                        Image("派眉眉")
                            .resizable()
                        TenYearImage(width: geometry.size.width, selectDate: self.selectDate, brightnessAmount: self.brightnessAmount)
                            .blendMode(self.selectBlend)
                    }
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.width / 4 * 3)
                    .clipped()
                    HStack{
                        Text("   姓名： ")
                        TextField("輸入你的臭名",text:self.$name)
                        
                    }

                    Form {
                        BrightnessSlider(brightnessAmount: self.$brightnessAmount)
                        
                        DatePicker("生日", selection: self.$selectDate, in: self.startDate...self.today, displayedComponents: .date)
                        
                        Picker("選擇 blend", selection: self.$selectBlend) {
                            
                            ForEach(self.blendModes, id: \.self) { (blendMode) in
                                Text(blendMode.name)
                            }
                        }
                    
                        
                    }
                    
                    
                    Button("  我要報名  "){
                        self.send = true
                    }
                    .alert(isPresented: self.$send) { () -> Alert in
                        let result: String
                        result = "成功送出！"
                        return Alert(title: Text(result))
                }
            }
            
        }
        
    }
}

struct EditPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        EditPhotoView()
    }
}

struct BrightnessSlider: View {
    
    @Binding var brightnessAmount: Double
    
    var body: some View {
        HStack {
            Text("亮度")
            Slider(value: self.$brightnessAmount, in: 0...1, minimumValueLabel: Image(systemName: "sun.max.fill").imageScale(.small), maximumValueLabel: Image(systemName: "sun.max.fill").imageScale(.large)) {
                Text("")
            }
        }
    }
}

struct TenYearImage: View {
    
    let width: CGFloat
    let selectDate: Date
    let brightnessAmount: Double
    var year: Int {
        return Calendar.current.component(.year, from: selectDate)
    }
    
    var body: some View {
        Image("埼玉")
            .resizable()
            .brightness(self.brightnessAmount)
    }
}
}
