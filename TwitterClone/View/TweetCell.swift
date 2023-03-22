//
//  TweetCell.swift
//  TwitterClone
//
//  Created by Prajjawal Gupta on 20/06/22.
//

import SwiftUI

struct TweetCell: View {
    var body: some View {
        VStack{
            HStack {
                Image("John")
                    .resizable()
                    .scaledToFill()
                    .clipped()
                    .frame(width: 56, height: 56)
                    .cornerRadius(56/2)
                    .padding(.leading, 1)
                VStack(alignment: .leading, spacing: 4) {
                    HStack {
                        Text("John-117")
                            .font(.system(size: 14, weight: .semibold))
                        Text("@masterchif")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.gray)
                        Text("2w")
                            .font(.system(size: 13, weight: .semibold))
                            .foregroundColor(.gray)
                            .padding(.horizontal)
                            .frame(width: 120, alignment: .trailing)
                    }
                    Text("I am John-117, Working at UNSC. Looking for covenent.")
                        .font(.system(size: 13, weight: .medium))
                }
            }.padding(.bottom)
                .padding(.trailing)
            HStack {
                Button(action: {}, label: {
                    Image(systemName: "bubble.left")
                        .font(.system(size: 16))
                        .frame(width: 32, height: 32)
                })
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "arrow.2.squarepath")
                        .font(.system(size: 16))
                        .frame(width: 32, height: 32)
                })
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "heart")
                        .font(.system(size: 16))
                        .frame(width: 32, height: 32)
                })
                Spacer()
                Button(action: {}, label: {
                    Image(systemName: "bookmark")
                        .font(.system(size: 16))
                        .frame(width: 32, height: 32)
                })
            }
            .padding(.horizontal)
            .foregroundColor(.gray)
            .padding(.horizontal)
            Divider()
        }.padding(.leading, -16)
    }
}

struct TweetCell_Previews: PreviewProvider {
    static var previews: some View {
        TweetCell()
    }
}
