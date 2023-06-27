//
//  CreditsView.swift
//  Notes Watch App
//
//  Created by Patrick Masterson on 10/16/22.
//

import SwiftUI

struct CreditsView: View {
    var body: some View {
        VStack(spacing: 3) {
            // Profile Image
            Image("developer-me")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80 )
                .layoutPriority(1)
            
            // Header
            HeaderView(title: "Credits")
            
            // Content
            Text("Pat Masterson")
                .foregroundColor(.primary)
                .fontWeight(.bold)
            Text("Developer")
                .font(.footnote)
                .foregroundColor(.primary)
                .fontWeight(.light)
            
            
        } //: VStack
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
