//
//  HowToPlayCV.swift
//  Refs-app
//
//  Created by Екатерина Никифорова on 27.03.2024.
//

import SwiftUI

struct HowToPlayCV: View {
    @State private var pageIndex = 0
       private let pages: [Page] = Page.samplePages
       private let dotAppearance = UIPageControl.appearance()
       
       var body: some View {
           ZStack{
               Color.lightGray.ignoresSafeArea()
             
               VStack(alignment: .leading){
                   HStack{
                       Text("\(pageIndex + 1)").multilineTextAlignment(.center).font(.custom("Fugue-Regular", size: 42)).foregroundColor(Color.white).frame(width: 80, height: 80).overlay(
                        RoundedRectangle(cornerRadius: 80)
                            .stroke(Color.white, lineWidth: 1)
                    )
                   }.padding(.top, 16).padding(.leading, 30)
                   TabView(selection: $pageIndex) {
                       ForEach(pages) { page in
                           VStack {
                               PageView(page: page)
                           }
                           .tag(page.tag)
                       }
                   }
                   .animation(.easeInOut, value: pageIndex)// 2
                   .indexViewStyle(.page(backgroundDisplayMode: .interactive))
                   .tabViewStyle(PageTabViewStyle())
                   
                   HStack(alignment: .center, spacing: 12){
                       SecondaryButtonWhite(text: "назад") {
                           goToZero()
                       }
                       
                       PrimaryButtonWhite(text: "далее") {
                           incrementPage()
                       }
                   }.padding().padding(.bottom, 20)
                   
               }.frame(width: 330, height: 670).background(Color.mainBlue).cornerRadius(30).onAppear {
                   dotAppearance.currentPageIndicatorTintColor = .white
                   dotAppearance.pageIndicatorTintColor = .lightGray
               }
           }
       }
       
       func incrementPage() {
           pageIndex += 1
       }
       
       func goToZero() {
           pageIndex = 0
       }
   }
