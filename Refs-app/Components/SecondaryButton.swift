//
//  SecondaryButton.swift
//  Refs-app
//
//  Created by Екатерина Никифорова on 18.02.2024.
//

import SwiftUI

struct SecondaryButton: View {
    var text: String
    var clicked: (() -> Void) /// use closure for callback
    
    var body: some View {
        Button(action: clicked) { /// call the closure here
            Text(text).frame(maxWidth: .infinity).font(.custom("Fugue-Regular", size: 20))
                .foregroundColor(Color.mainBlue)
                    .padding(.vertical, 12)
                    .padding(.horizontal)
                    .background(Color.lightGray.opacity(0.0))
                    .overlay(
                        RoundedRectangle(cornerRadius: 30)
                            .stroke(Color.mainBlue, lineWidth: 1)
                    )
        }
    }
}
