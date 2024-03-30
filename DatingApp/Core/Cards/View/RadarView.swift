//
//  RadarView.swift
//  DatingApp
//
//  Created by vbugrym on 30.03.2024.
//

import SwiftUI

struct RadarView: View {
    
    var body: some View {
        ZStack {
            Circle()
                .foregroundStyle(.purple.opacity(0.09))
                .frame(width: 200)
            
            Circle()
                .foregroundStyle(.purple.opacity(0.15))
                .frame(width: 150)
            
            Image(.photo1)
                .resizable()
                .scaledToFill()
                .frame(width: 100, height: 100)
                .clipShape(Circle())
        }
    }
}

#Preview {
    RadarView()
}
