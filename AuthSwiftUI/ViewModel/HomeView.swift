//
//  HomeView.swift
//  AuthSwiftUI
//
//  Created by Владимир Ширяев on 08.03.2023.
//

import SwiftUI

struct HomeView: View {
    @State public var flag: Bool = true
    
    var body: some View {
        VStack{
            HStack{
                Text("Logged in")
                    .font(.largeTitle)
                    .bold()
                Spacer()
            }
            .padding()
            
            Spacer()
            Image(systemName: "leaf")
                .resizable()
                .frame(width: 250, height: 250)
                .foregroundColor(.green)

            Spacer()
            
            Button(action: {
                UserDefaults.standard.set(false, forKey: "status")
                NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
            }){
                Text("Quit")
                    .foregroundColor(.white)
                    .font(.title3)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.black)
                    }
                    .padding()
            }
        }
    }
}

struct TextFildView: View {
    
    @Binding var name: String
    var nameView: String
    var nameImage: String
    
    var body: some View {
        HStack {
            Image(systemName: nameImage)
            TextField(nameView, text: $name)
            
            Spacer()
            
            if (name.count != 0){
                Image(systemName: "checkmark")
                    .fontWeight(.bold)
                    .foregroundColor(.green)
            }
        }
        .padding()
        .overlay(
        RoundedRectangle(cornerRadius: 10)
            .stroke(lineWidth: 2)
            .foregroundColor(.black)
        )
        .padding()

    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
