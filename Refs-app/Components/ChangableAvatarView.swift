//
//  ChangableAvatarView.swift
//  Refs-app
//
//  Created by Екатерина Никифорова on 18.02.2024.
//

import SwiftUI
import PhotosUI

struct ChangableAvatarView: View {
    
    @ObservedObject var viewModel: UserModel
    
    var body: some View {
        
        ProfileImage(imageState: viewModel.imageState).scaledToFill().clipShape(Circle()).frame(width: 100, height: 100).background {
            Circle().fill(
                Color.red)
        } .overlay(alignment: .center) {
            PhotosPicker(selection: $viewModel.imageSelection, matching: .images, photoLibrary: .shared()) {
                Circle().opacity(0)
            }.buttonStyle(.borderless)
        }
    }
}
