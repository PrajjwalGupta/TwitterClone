//
//  UserCell.swift
//  TwitterClone
//
//  Created by Prajjawal Gupta on 20/06/22.
//

import SwiftUI

struct UserCell: View {
    var body: some View {
        HStack(spacing: 12){
            Image("Luffy")
                .resizable()
                .scaledToFill()
                .frame(width: 56, height: 56)
                .cornerRadius(56/2)
                .padding(.leading)
            VStack(alignment: .leading, spacing: 4){
                Text("King of The Pirate")
                    .font(.system(size: 14, weight: .semibold))
                Text("Monkey the Loffy")
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }.foregroundColor(.black)
        }
    }
}

struct UserCell_Previews: PreviewProvider {
    static var previews: some View {
        UserCell()
    }
}
