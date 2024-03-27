//
//  MainView.swift
//  Refs-app
//
//  Created by Екатерина Никифорова on 27.03.2024.
//

import SwiftUI

struct MainView: View {
    @State var selectTab = "1"
    
    let tabs = ["правила","задания","профиль"]
    
    init() {
        UITabBar.appearance().isHidden = true
    }
    
    var body: some View {
      
        
        ZStack(alignment: .bottom){
            TabView(selection: $selectTab ) {
                Text("правила").tag("правила")
                Text("задания").tag("задания")
                UserProfileCV().tag("профиль")
            }
        }
        
        HStack {
            ForEach(tabs, id: \.self) {
                tab in 
                Spacer()
                TabBarItem(tab: tab, selected: $selectTab)
                Spacer()
            }
        }.padding(.top, 20).padding(.bottom, 34).frame(maxWidth: .infinity).background(Color.white).clipShape(Capsule())
    }
}

struct TabBarItem: View{
    @State var tab: String
    @Binding var selected: String
    var body: some View{
        if tab == "профиль" {
            Button{
                withAnimation(.spring()){
                    selected = tab
                }
            } label: {
                ZStack{
                    VStack{
                        Image("профиль").frame(width: 36, height: 36).clipShape(Circle())
                        Text(tab).font(.custom("Fugue-Mono", size: 12)).foregroundColor( selected == tab ? Color.mainBlue : Color.black)
                    }
                }
            }
            
        } else{
            ZStack{
                Button{
                    withAnimation(.spring()){
                        selected = tab
                    }
                } label: {
                    VStack{
                            Image(tab).resizable().frame(width: 32, height: 32).foregroundColor(selected == tab ? Color.mainBlue : Color.black)
                            Text(tab).font(.custom("Fugue-Mono", size: 12)).foregroundColor(selected == tab ? Color.mainBlue : Color.black)
                        
                    }
                }
            }
        }
    }
}
