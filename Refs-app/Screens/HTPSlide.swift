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
        VStack(alignment: .center, spacing: 14) {
            VStack(alignment: .leading, spacing: 4){
                Text(page.name).multilineTextAlignment(.leading).font(.custom("FugueHead", size: 24)).foregroundColor(Color.white).frame(maxWidth: .infinity, alignment: .leading)
                Text(page.description).multilineTextAlignment(.leading)
                    .font(.custom("Fugue-Regular", size: 18)).foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }.frame(width: 270, height: 140, alignment: .leading).padding()
            
            Image("\(page.imageUrl)")
                .resizable()
                .scaledToFit()
                .frame(width: 266, height: 266)
                .padding()
                .cornerRadius(25)
        }
    }
}
