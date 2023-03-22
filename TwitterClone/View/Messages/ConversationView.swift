//
//  ConversationView.swift
//  TwitterClone
//
//  Created by Prajjawal Gupta on 20/06/22.
//

import SwiftUI

struct ConversationView: View {
    @State var isShowingNewMessageView = false
    @State var showChat = false
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            NavigationLink(destination: ChatView(), isActive: $showChat, label: {
            })
            ScrollView{
                VStack{
                    ForEach(0..<20) { _ in
                        NavigationLink(destination: ChatView(),
                                       label: {
                            ConversationCell()
                        })
                    }
                }
                .padding()
            }
            Button(action: { self.isShowingNewMessageView.toggle() }, label: {
                Image(systemName: "envelope")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .padding(6)
            })
            .background(Color.blue)
            .foregroundColor(.white.opacity(0.7))
            .clipShape(Circle())
            .padding()
            .sheet(isPresented: $isShowingNewMessageView, content: {
                NewMessageView(show: $isShowingNewMessageView, startChat: $showChat)
            })
        }
    }
}

struct ConversationView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationView()
    }
}
