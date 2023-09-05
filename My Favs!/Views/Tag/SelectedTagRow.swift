//
//  TagView.swift
//  My Favs!
//
//  Created by 倉田沙智 on 2023/09/01.
//

import SwiftUI

struct SelectedTagRow: View {
    @EnvironmentObject var tag: Tag
    
    var body: some View {
        ZStack {
            Color(uiColor: .orange)
                .opacity(0.2)
                .cornerRadius(15)
                .overlay(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(.orange, lineWidth: 2)
                )
            
            HStack {
                Text("\(tag.name)")
                    .font(.caption)
                    .padding(.horizontal, 5)
                    
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.gray)
                }
                
            }
            .padding(EdgeInsets(top: 2, leading: 5, bottom: 2, trailing: 5))
        }
        .frame(height: 24)
    }
}


struct SelectedTagRow_Previews: PreviewProvider {
    static var previews: some View {
        SelectedTagRow()
            .environmentObject(Tag.sampleData[0])
    }
}
