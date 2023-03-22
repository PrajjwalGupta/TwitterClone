//
//  customTextField.swift
//  TwitterClone
//
//  Created by Prajjawal Gupta on 22/06/22.
//

import SwiftUI

struct customTextField: View {
    @Binding var text: String
    let placeholder: Text
    let imageName: String
    var body: some View {
        ZStack(alignment: .leading){
            if text.isEmpty {
                placeholder
                    .foregroundColor(Color(.init(white: 1, alpha: 0.47)))
                    .padding(.leading, 40)
            }
            HStack(spacing: 16){
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.white)
                TextField("", text: $text)
            }
        }
    }
}
