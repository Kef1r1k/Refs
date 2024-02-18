//
//  RegistrationModel.swift
//  Refs-app
//
//  Created by Екатерина Никифорова on 06.02.2024.
//

import SwiftUI
import UIKit
import CoreTransferable

@MainActor
class RegistrationModel: ObservableObject {
    
    // MARK: - Registration details
    
    @Published var name: String = ""
    @Published var nickname: String = ""
    @Published var email: String = ""
    @Published var password: String = ""
    
    // all key values in user defaults
    let keyValues = ["Name", "NickName", "Email", "Password" ]
    
    //save all fields in user defualts
    public func saveInUserDefaults() {
        print("Save")
        for key in keyValues {
            switch key {
                case "Name":
                    UserDefaults.standard.set(name, forKey: key)
                case "NickName":
                    UserDefaults.standard.set(nickname, forKey: key)
                case "Email":
                    UserDefaults.standard.set(email, forKey: key)
                case "Password":
                    UserDefaults.standard.set(password, forKey: key)
                default:
                    print("No Value")
            }
        }
    }
    
}
