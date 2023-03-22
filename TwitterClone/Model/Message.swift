//
//  Message.swift
//  TwitterClone
//
//  Created by Prajjawal Gupta on 20/06/22.
//

import Foundation

struct MockMessage: Identifiable {
    let id: Int
    let imageName: String
    let messageText: String
    let isCurrentUser: Bool
}
let MOCK_MESSAGES: [MockMessage] = [.init(id: 0, imageName:"Luffy", messageText: "Hey, I am Gonna be King of the Pirates", isCurrentUser: false),
                                    .init(id: 1, imageName:"John", messageText: "Cortana, Scan the system", isCurrentUser: true),
                                    .init(id: 2, imageName:"Goku", messageText: "Ultra autonomus extint acheived.. Hell, Yeah!!!", isCurrentUser: true),
                                    .init(id: 3, imageName:"Batman", messageText: "Batman Loves Superman", isCurrentUser: false),
                                    .init(id: 4, imageName:"Superman", messageText: "Superman Hates Batman", isCurrentUser: false),
                                    .init(id: 5, imageName:"Joker", messageText: "Superman and Batman both are idiots.", isCurrentUser: true),]
