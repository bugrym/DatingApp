//
//  CardStackView.swift
//  DatingApp
//
//  Created by vbugrym on 31.03.2024.
//

import SwiftUI

struct CardStackView: View {
    var body: some View {
        ZStack {
            ForEach(0 ..< 10) { card in
                CardView()
            }
        }
    }
}

#Preview {
    CardStackView()
}
