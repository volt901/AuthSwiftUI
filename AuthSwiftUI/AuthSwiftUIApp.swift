//
//  AuthSwiftUIApp.swift
//  AuthSwiftUI
//
//  Created by Владимир Ширяев on 07.03.2023.
//

import SwiftUI
import Firebase

@main
struct AuthSwiftUIApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
