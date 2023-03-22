//
//  FeedView.swift
//  TwitterClone
//
//  Created by Prajjawal Gupta on 20/06/22.
//

import SwiftUI

struct FeedView: View {
    @State var isShowingNewTweetsView = false
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView{
                VStack{
                    ForEach(0..<100) { _ in
                        TweetCell()
                    }
                }.padding()
            }
            Button(action: {
                viewModel.signOut()
              //  isShowingNewTweetsView.toggle()
                
            }, label: {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 25, height: 25)
                    .padding(6)
            })
            .background(Color.blue)
            .foregroundColor(.white.opacity(0.7))
            .clipShape(Circle())
            .padding()
            .fullScreenCover(isPresented: $isShowingNewTweetsView) {
                NewTweetView(isPresented: $isShowingNewTweetsView)
            }
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
