//
//  HeaderView.swift
//  Notes Watch App
//
//  Created by Patrick Masterson on 10/16/22.
//

import SwiftUI

struct HeaderView: View {
    var title = ""
    
    var body: some View {
        VStack {
            // Title
            if title != "" {
                Text(title.uppercased())
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.accentColor)
            }
            
            // Separator
            HStack {
                Capsule()
                    .frame(height: 1)
                
                Image(systemName: "note.text")
                
                Capsule()
                    .frame(height: 1)
            } // : HStack
            .foregroundColor(.accentColor)
        } // : VStack
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderView()
            
            HeaderView(title: "Credits")
        }
    }
}
