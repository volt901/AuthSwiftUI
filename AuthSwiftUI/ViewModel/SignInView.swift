//
//  LoginView.swift
//  AuthSwiftUI
//
//  Created by Владимир Ширяев on 07.03.2023.
//

import SwiftUI
import Firebase

struct SignInView: View {
    
    @State private var email: String = ""
    @State private var password: String = ""
    
    @State private var message: String = ""
    @State private var alert = false
    
    var body: some View {
        ZStack {
            Color.white.edgesIgnoringSafeArea(.all)
            
            VStack{
                HStack{
                    Text("Login")
                        .font(.largeTitle)
                        .bold()
                    
                    Spacer()
                }
                .padding()
                .padding(.top)
                
                Spacer()
                
                TextFildView(name: $email, nameView: "Email", nameImage: "envelope")
                
                TextFildView(name: $password, nameView: "Password", nameImage: "lock")
                
                NavigationLink(destination: SignUpView()){
                    Text("Don't have an account?")
                }
                
                Spacer()
                Spacer()
                Button(action: {
                    singIn(email: self.email, password: self.password){ (verified, status) in
                        
                        if !verified {
                            
                            self.message = status
                            self.alert.toggle()
                            
                        } else {
                            UserDefaults.standard.set(true, forKey: "status")
                            NotificationCenter.default.post(name: NSNotification.Name("statusChange"), object: nil)
                        }
                    }
                }){
                    Text("Sign In")
                        .foregroundColor(.white)
                        .font(.title3)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background {
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.black)
                        }
                        .padding()
                        .alert (isPresented: $alert){
                            Alert(title: Text("Error"), message: Text(self.message),dismissButton: .default(Text("OK")))
                        }
                }
            }
        }
    }
    
    func singIn(email: String, password: String, completion: @escaping (Bool, String)->Void) {
        Auth.auth().signIn(withEmail: email, password: password) { (res, err) in
            if err != nil {
                completion(false,(err?.localizedDescription)!)
                return
            }
            completion(true,(res?.user.email)!)
        }
    }
}



