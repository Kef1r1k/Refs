//
//  UIApplicationExt.swift
//  Refs-app
//
//  Created by Екатерина Никифорова on 29.03.2024.
//

import SwiftUI

extension UIApplication
{
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
