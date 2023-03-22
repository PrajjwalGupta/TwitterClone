//
//  ConversationCell.swift
//  TwitterClone
//
//  Created by Prajjawal Gupta on 20/06/22.
//

import SwiftUI

struct ConversationCell: View {
    var body: some View {
        VStack {
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
                    Text("I am goona be King of the Pirates Some day and Kill all 4 SeaLords.")
                        .font(.system(size: 14))
                        .lineLimit(2)
                }.foregroundColor(.black)
                .padding(.trailing)
            }
            Divider()
        }
    }
}

struct ConversationCell_Previews: PreviewProvider {
    static var previews: some View {
        ConversationCell()
    }
}
