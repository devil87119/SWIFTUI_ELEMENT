//
//  secondview.swift
//  TenYear
//
//  Created by User20 on 2019/11/7.
//  Copyright © 2019 SHIH-YING PAN. All rights reserved.
//

import SwiftUI

struct fk: View {
    @State private var page2 = false
    @State private var page3 = false
    @State private var open = false
    var body: some View {
        VStack{
            Toggle("                                                                       機密",isOn: self.$open)
            if self.open{
            Image("一拳超人")
                .resizable()
                .scaledToFill()
                .frame(width:350,height:200)
            HStack{
        Button("  我要報名  "){
            self.page2 = true
        }
        .sheet(isPresented: self.$page2){
            EditPhotoView()
        }
        Button("  查看英雄  "){
            self.page3 = true
        }
        .sheet(isPresented: self.$page3){
            regist()
        }
        }
        }
    }
    }
}

struct fk_Previews: PreviewProvider {
    static var previews: some View {
        fk()
    }
}
