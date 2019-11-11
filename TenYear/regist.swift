//
//  guessSong.swift
//  TenYear
//
//  Created by User20 on 2019/11/7.
//  Copyright © 2019 SHIH-YING PAN. All rights reserved.
//

import SwiftUI

struct regist: View {
    var roles = ["埼玉", "傑諾斯", "King", "龍捲","餓狼","吹雪","123"]
    var nickname = ["禿頭披風俠", "魔鬼改造人", "世界最強的男人", "顫慄龍捲","英雄獵人","地獄吹雪","NONE"]
    
    @State private var send = false
    @State private var selectedIndex = 0
    @State private var selectedNum = 0
    @State private var sleepAmount = 0
    var body: some View {
        NavigationView {
        VStack{
            
            Image(self.roles[self.selectedIndex])
                .resizable()
                .scaledToFill()
                .frame(width:350,height:300)
            Picker(selection: self.$selectedIndex, label: Text("選擇角色")) {
                    ForEach(0..<self.roles.count-1) {(index) in
                    HStack{
                        Text(self.roles[index])
                        Text(self.nickname[index])
                    }
                }
            }
            .frame(width: 400,height: 150)
            .background(Color.yellow)
            .foregroundColor(.black)

            Stepper(value: self.$sleepAmount) {
                Text("我給他的評分：\(self.sleepAmount)分")
            }
    }
    }
    }
}

struct regist_Previews: PreviewProvider {
    static var previews: some View {
        regist()
    }
}
