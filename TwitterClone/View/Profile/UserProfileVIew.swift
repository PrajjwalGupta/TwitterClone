//
//  UserProfileVIew.swift
//  TwitterClone
//
//  Created by Prajjawal Gupta on 21/06/22.
//

import SwiftUI

struct UserProfileVIew: View {
    @State var selectedFilter: TweetFilterOptions = .tweets
    var body: some View {
        ScrollView {
            VStack {
                ProfileHeaderVIew()
                    .padding()
                FilterButtonView(selectOptions: $selectedFilter)
                    .padding()
                ForEach(0..<9) { twwet in
                    TweetCell()
                        .padding()
                }
            }
            .navigationTitle("John")
        }
    }
}

struct UserProfileVIew_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileVIew()
    }
}
