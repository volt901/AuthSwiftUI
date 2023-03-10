//
//  TextFildView.swift
//  AuthSwiftUI
//
//  Created by Владимир Ширяев on 07.03.2023.
//

import SwiftUI

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

//struct TextFildView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
