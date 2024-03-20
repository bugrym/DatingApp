//
//  ActionButtonsView.swift
//  DatingApp
//
//  Created by vbugrym on 20.03.2024.
//

import SwiftUI

struct ActionButtonsView: View {
    @Binding var onTapDislike: () -> Void
    @Binding var onTapLike: () -> Void
    
    var body: some View {
        HStack(spacing: 30) {
            Button {
                onTapDislike()
            } label: {
                Image(systemName: "xmark")
                    .fontWeight(.bold)
                    .foregroundStyle(.red)
                    .frame(width: 45, height: 45)
                    .background {
                        Circle()
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                    }
            }
            
            Button {
                onTapLike()
            } label: {
                Image(systemName: "heart.fill")
                    .fontWeight(.bold)
                    .foregroundStyle(.green)
                    .frame(width: 45, height: 45)
                    .background {
                        Circle()
                            .foregroundStyle(.white)
                            .shadow(radius: 5)
                    }
            }
        }
    }
}

#Preview {
    ActionButtonsView(onTapDislike: .constant {
        print("Dislike tapped")
    }, onTapLike: .constant {
        print("Like tapped")
    })
}
