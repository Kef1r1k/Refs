//
//  HTPSlide.swift
//  Refs-app
//
//  Created by Екатерина Никифорова on 27.03.2024.
//

import SwiftUI

struct PageView: View {
    var page: Page
    
    var body: some View {
        VStack() {
            VStack(alignment: .leading, spacing: 4){
                Text(page.name).multilineTextAlignment(.leading).font(.custom("FugueHead", size: 24)).foregroundColor(Color.white).frame(maxWidth: .infinity, alignment: .leading)
                Text(page.description).multilineTextAlignment(.leading)
                    .font(.custom("Fugue-Regular", size: 18)).foregroundColor(Color.white)
                    .frame(width: 270)
            }.frame(width: 270, alignment: .leading).padding()
            
            Image("\(page.imageUrl)")
                .resizable()
                .scaledToFit()
                .padding()
                .cornerRadius(25)
        }
    }
}
