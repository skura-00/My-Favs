//
//  TabBar.swift
//  My Favs!
//
//  Created by 倉田沙智 on 2023/07/25.
//

import SwiftUI

enum Tab: String, CaseIterable {
    case tray
    case magnifyingglass
}

struct TabBar: View {
    @Binding var selected: Tab
    
    private var image: String {
        selected.rawValue
    }

    var body: some View {
        VStack {
            HStack {
                ForEach(Tab.allCases, id: \.rawValue) { tab in
                    Spacer()
                    
                    Button() {
                        withAnimation(.easeIn(duration: 0.1)) {
                            selected = tab
                        }
                    } label: {
                        Image(systemName: selected == tab ? image : tab.rawValue)
                            .scaleEffect(selected == tab ? 1.50 : 1.0)
                            .foregroundColor(selected == tab ? .orange : .gray)
                    }
                    
                    Spacer()
                }
            }
            .frame(height: 55)
            .background(.white)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar(selected: .constant(.tray))
    }
}
