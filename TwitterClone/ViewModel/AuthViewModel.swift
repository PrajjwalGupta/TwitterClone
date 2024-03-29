//
//  AuthViewModel.swift
//  TwitterClone
//
//  Created by Prajjawal Gupta on 23/06/22.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var isAuthenticating = false
    @Published var error: Error?
    //@Published var user: User?
    init(){
        userSession = Auth.auth().currentUser
    }
    func login(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Failed to login \(error.localizedDescription)")
                return
            }
            self.userSession = result?.user
        }
    }
    func registerUser(email: String, password: String, username: String, fullname: String, profileImage: UIImage) {
        guard let imageData = profileImage.jpegData(compressionQuality: 0.3) else {return}
        let filename = NSUUID().uuidString
        let storageRef = Storage.storage().reference().child(filename)
        storageRef.putData(imageData, metadata: nil) { _, error in
            if let error = error {
                print("DEBUG: error while uploading profile Image \(error.localizedDescription)")
                return
            }
            print("DEBUG: Successfully uploaded user photo...")
            
            storageRef.downloadURL { url, _ in
                guard let profileImageUrl = url?.absoluteString else {return}
                Auth.auth().createUser(withEmail: email, password: password) { result, error in
                    if let error = error {
                        print("DEBUG: error is \(error.localizedDescription)")
                        return
                    }
                    guard let user = result?.user else {return}
                    let data = ["email": email,
                                "username": username,
                                "fullname": fullname,
                                "profileImageUrl": profileImageUrl,
                                "uid": user.uid]
                    Firestore.firestore().collection("users").document(user.uid).setData(data) { _ in
                        self.userSession = user
                    }
                }
            }
        }
    }
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
    }
}
