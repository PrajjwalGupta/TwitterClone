//
//  RegistrationView.swift
//  TwitterClone
//
//  Created by Prajjawal Gupta on 21/06/22.
//

import SwiftUI

struct RegistrationView: View {
    @State var username = ""
    @State var fullname = ""
    @State var email = ""
    @State var password = ""
    @State var showImagePicker: Bool
    @State var selectedUIImage: UIImage?
    @State var image: Image?
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @EnvironmentObject var viewModel: AuthViewModel
    func loadImage() {
        guard let selectedImage = selectedUIImage else {
            return
        }
        image = Image(uiImage: selectedImage)
    }
    var body: some View {
        ZStack{
            VStack{
                Button(action: {showImagePicker.toggle()}, label: {
                    ZStack{
                        if let image = image {
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height:80)
                                .clipped()
                                .cornerRadius(40)
                                .padding(.top, 65)
                                .padding(.trailing)
                                .padding(.bottom, 32)
                                .foregroundColor(.white)
                        } else {
                            Circle().stroke(lineWidth: 5)
                                .frame(width: 120, height: 120)
                                .padding(.top, 40)
                                .foregroundColor(.white)
                            Image(systemName: "person.badge.plus")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height:80)
                                .padding(.top, 65)
                                .padding(.trailing)
                                .padding(.bottom, 32)
                                .foregroundColor(.white)
                        }
                    }.padding()
                }).sheet(isPresented: $showImagePicker, onDismiss: loadImage, content: {
                    ImagePicker(image: $selectedUIImage)
                })
                
                VStack(spacing: 20) {
                    customTextField(text: $fullname, placeholder: Text("Full Name"), imageName: "person")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .padding(.bottom, 10)
                        .foregroundColor(.white)
                    customTextField(text: $email, placeholder: Text("Email"), imageName: "envelope")
                        .padding()
                        .background(Color(.init(white: 1, alpha: 0.15)))
                        .cornerRadius(10)
                        .padding(.bottom, 10)
                        .foregroundColor(.white)
                    customTextField(text: $username, placeholder: Text("Username"), imageName: "person")
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
                Button(action: {
                    guard let image = selectedUIImage else {return}
                    viewModel.registerUser(email: email, password: password, username: username, fullname: fullname, profileImage: image)
                }, label: {
                    Text("Sign Up")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .frame(width: 300, height: 50)
                        .background(Color.white)
                        .clipShape(Capsule())
                        .padding(.top, 50)
                        .padding(.horizontal)
                })
                Spacer()
                Button(action: {mode.wrappedValue.dismiss()}, label: {
                    HStack{
                        Text("Have account?")
                            .font(.system(size: 14))
                        Text("Sign In")
                            .font(.system(size: 14, weight: .semibold))
                    }
                    .foregroundColor(.white)
                    .padding(.bottom, 40)
                })
            }
        }.background(Color(red: 80/255, green: 171/255, blue: 241/255))
            .ignoresSafeArea()
    }
}

//struct RegistrationView_Previews: PreviewProvider {
//    static var previews: some View {
//        RegistrationView(showImagePicker: true, viewModel: <#AuthViewModel#>)
//    }
//}
