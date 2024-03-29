//
//  FilterButtonView.swift
//  TwitterClone
//
//  Created by Prajjawal Gupta on 21/06/22.
//

import SwiftUI
enum TweetFilterOptions: Int, CaseIterable {
    case tweets
    case replies
    case likes
    var titles: String {
        switch self {
        case .tweets: return "Tweets"
        case .replies: return "Tweets & Replies"
        case .likes: return "Likes"
        }
    }
}
struct FilterButtonView: View {
    @Binding var selectOptions: TweetFilterOptions
    private let underLineWidth = UIScreen.main.bounds.width / CGFloat(TweetFilterOptions.allCases.count)
    private var padding: CGFloat {
        let rawValue = CGFloat(selectOptions.rawValue)
        let count = CGFloat(TweetFilterOptions.allCases.count)
        return ((UIScreen.main.bounds.width / count) * rawValue) + 16
    }
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                ForEach(TweetFilterOptions.allCases, id: \.self) { option in
                    Button(action: {
                        self.selectOptions = option
                    }, label: {
                        Text(option.titles)
                            .frame(width: underLineWidth - 8 )
                    })
                }
            }
            Rectangle()
                .frame(width: underLineWidth - 32, height: 3, alignment: .center)
                .foregroundColor(.blue)
                .padding(.leading, padding)
                .animation(.spring())
        }
    }
}

struct FilterButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FilterButtonView(selectOptions: .constant(.tweets))
    }
}
