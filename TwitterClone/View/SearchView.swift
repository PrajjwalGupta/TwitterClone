//
//  SearchView.swift
//  TwitterClone
//
//  Created by Prajjawal Gupta on 20/06/22.
//

import SwiftUI

struct SearchView: View {
    @State var searchText = ""
    var body: some View {
       ScrollView {
            SearchBar(text: $searchText)
                .padding()
            VStack(alignment: .leading) {
                ForEach(0..<100) { _ in
                    HStack{Spacer()}
                    NavigationLink(destination: UserProfileVIew(),
                                   label: {
                        UserCell()
                    })
                }.padding(.leading)
            }
        }.navigationTitle("Search")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
