//
//  ContentView.swift
//  AuthSwiftUI
//
//  Created by Владимир Ширяев on 07.03.2023.
//

import SwiftUI

struct ContentView: View {
    @State var status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
   
    var body: some View {
        NavigationView {
            VStack {
                if status {
                    HomeView()
                } else {
                    SignInView()
                }
            }
            .onAppear {
                NotificationCenter.default.addObserver(forName: NSNotification.Name("statusChange"), object: nil, queue: .main) { (_) in
                    
                    let status = UserDefaults.standard.value(forKey: "status") as? Bool ?? false
                    self.status = status
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
