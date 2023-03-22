//
//  ProfileHeaderVIew.swift
//  TwitterClone
//
//  Created by Prajjawal Gupta on 21/06/22.
//

import SwiftUI

struct ProfileHeaderVIew: View {
    var body: some View {
        VStack {
            Image("John")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(width: 120, height: 120)
                .cornerRadius(120/2)
                .shadow(color: .black, radius: 10, x: 0, y: 0)
            Text("John-117")
                .font(.system(size: 16, weight: .semibold))
                .padding(.top, 10)
            Text("@masterchief")
                .font(.system(size: 14))
                .foregroundColor(.gray)
                Text("Working at UNSC, I have the best armor and AI")
                .font(.system(size: 14))
                .padding(.top, 8)
            HStack(spacing: 32){
                VStack{
                    Text("12")
                        .font(.system(size: 16, weight: .bold))
                    Text("Followers")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
                VStack{
                    Text("12")
                        .font(.system(size: 16, weight: .bold))
                    Text("Followers")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }.padding()
            ProfileActionButton(isCurrentUser: false)
            Spacer()
        }
    }
}

struct ProfileHeaderVIew_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderVIew()
    }
}
