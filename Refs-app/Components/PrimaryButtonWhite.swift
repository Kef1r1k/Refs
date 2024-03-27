//
//  PrimaryButtonWhite.swift
//  Refs-app
//
//  Created by Екатерина Никифорова on 27.03.2024.
//

import SwiftUI

struct PrimaryButtonWhite: View {
    var text: String
    var clicked: (() -> Void) /// use closure for callback
    
    var body: some View {
        Button(action: clicked) { /// call the closure here
            Text(text).frame(maxWidth: .infinity).font(.custom("Fugue-Regular", size: 20))
        }.foregroundColor(Color.mainBlue)
            .padding(.vertical, 12)
            .padding(.horizontal)
            .background(Color.white)
            .cornerRadius(30)
    }
}
