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
           VStack{
               TabView(selection: $pageIndex) {
                   ForEach(pages) { page in
                       VStack {
                           Spacer()
                           PageView(page: page)
                           Spacer()
                           if page == pages.last {
                               Button("Sign up!", action: goToZero)
                                   .buttonStyle(.bordered)
                           } else {
                               Button("next", action: incrementPage)
                                   .buttonStyle(.borderedProminent)
                           }
                           Spacer()
                       }
                       .tag(page.tag)
                   }
               }
               .animation(.easeInOut, value: pageIndex)// 2
               .indexViewStyle(.page(backgroundDisplayMode: .interactive))
               .tabViewStyle(PageTabViewStyle())
               .onAppear {
                   dotAppearance.currentPageIndicatorTintColor = .black
                   dotAppearance.pageIndicatorTintColor = .gray
               }
           }.frame(width: 330, height: 680).background(Color.mainBlue)
       }
       
       func incrementPage() {
           pageIndex += 1
       }
       
       func goToZero() {
           pageIndex = 0
       }
   }
