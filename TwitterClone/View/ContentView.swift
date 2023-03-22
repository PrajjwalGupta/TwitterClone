//
//  ContentView.swift
//  TwitterClone
//
//  Created by Prajjawal Gupta on 20/06/22.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        Group{
            if viewModel.userSession != nil {
                NavigationView {
                    TabView {
                       FeedView()
                            .tabItem{
                                Image(systemName: "house")
                                    Text("Home")
                            }
                        SearchView()
                            .tabItem {
                                Image(systemName: "magnifyingglass")
                                Text("Search")
                            }
                        ConversationView()
                            .tabItem {
                                Image(systemName: "envelope")
                                Text("Messages")
                            }
                        UserProfileVIew()
                            .tabItem {
                                Image(systemName: "person.crop.circle")
                                Text("Profile")
                            }
                    }.navigationTitle("Home")
                        .navigationBarTitleDisplayMode(.inline)
                }
            } else {
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
