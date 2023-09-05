//
//  TagView.swift
//  My Favs!
//
//  Created by 倉田沙智 on 2023/09/02.
//

import SwiftUI

struct TagView: View {
    @StateObject var toRoot: ToRoot = ToRoot()
    @EnvironmentObject var tags: TagsList
    @Environment(\.colorScheme) var colorScheme
    @State var input: String = String()
    
    let cols = [GridItem(.flexible()),
                GridItem(.flexible())]
    
    var body: some View {
        TabView (selection: $toRoot.selected) {
            NavigationStack {
                Form {
                    Section(header: Text("New Tag")) {
                        HStack {
                            TextField("Input", text: $input)
                            Button("Push") {
                                tags.add(tag: Tag(tagId: 10, name: input))
                            }
                            .disabled(input.isEmpty)
                        }
                    }
                    
                    Section(header: Text("Category Title")) {
                        LazyVGrid(columns: cols) {
                            ForEach($tags.tagList) { $tag in
                                SelectedTagRow()
                                    .environmentObject(tag)
                            }
                        }
                    }
                }
                .scrollContentBackground(.hidden)
                .background(colorScheme == .dark ? Color(#colorLiteral(red: 0.02993695997, green: 0.1116794124, blue: 0.1822000444, alpha: 1)) : Color(#colorLiteral(red: 0.949019134, green: 0.9490200877, blue: 0.9705253243, alpha: 1)))
            }
            .scrollDisabled(true)
        }
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView()
            .environmentObject(TagsList().sampleTags())
            .preferredColorScheme(.dark)
    }
}
