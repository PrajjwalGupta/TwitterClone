//
//  LoginView.swift
//  TwitterClone
//
//  Created by Prajjawal Gupta on 21/06/22.
//

import SwiftUI

struct LoginView: View {
    @State var email = ""
    @State var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        NavigationView {
            ZStack{
                VStack{
                    Image("twitter_logo")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 160, height: 100)
                        .padding(.top, 88)
                        .padding(.bottom, 32)
                    VStack(spacing: 20) {
                        customTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .padding(.bottom, 10)
                            .foregroundColor(.white)
                        customSecureField(text: $password, placeholder: Text("Password"))
                            .padding()
                            .background(Color(.init(white: 1, alpha: 0.15)))
                            .cornerRadius(10)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 32)
                    HStack{
                        Spacer()
                        Button(action: {}, label: {
                            Text("Forgot Password?")
                                .font(.footnote)
                                .bold()
                                .foregroundColor(.white)
                                .padding(.top, 16)
                                .padding(.trailing, 32)
                        })
                    }
                    Button(action: {
                        viewModel.login(withEmail: email, password: password)
                    }, label: {
                        Text("Sign In")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .frame(width: 300, height: 50)
                            .background(Color.white)
                            .clipShape(Capsule())
                            .padding(.top, 50)
                            .padding(.horizontal)
                    })
                    Spacer()
                   // NavigationLink(destination: RegistrationView(showImagePicker: false, viewModel: AuthViewModel()).navigationBarBackButtonHidden(true), label: {
                        HStack{
                            Text("Don't have account?")
                                .font(.system(size: 14))
                            Text("Sign Up")
                                .font(.system(size: 14, weight: .semibold))
                        }
                        .foregroundColor(.white)
                        .padding(.bottom, 40)
                    }
                }
            }.background(Color(red: 80/255, green: 171/255, blue: 241/255))
                .ignoresSafeArea()
        }
    }


struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
