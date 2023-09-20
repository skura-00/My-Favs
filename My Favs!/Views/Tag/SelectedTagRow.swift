////
////  TagView.swift
////  My Favs!
////
////  Created by SK on 2023/09/01.
////
//
//import SwiftUI
//
//struct SelectedTagRow: View {
//    @EnvironmentObject var tag: Tag
//    @EnvironmentObject var tags: TagsList
//    @Environment(\.colorScheme) var colorScheme
//    @ScaledMetric(relativeTo: .caption) var paddingWidth = 5
//    
//    var body: some View {
//        HStack {
//            Text("\(tag.name)")
//                .font(.caption)
//                .fontWeight(.bold)
//                .foregroundColor(.black)
//                .padding(.horizontal, 5)
//            
//            Button {
//                if (SQLiteDB.shared.deleteTag(tagId: tag.tagId)) {
//                    tags.remove(tag: tag)
//                }
//            } label: {
//                Image(systemName: "xmark")
//                    .font(.caption)
//                    .foregroundColor(.black)
//            }
//            .padding(EdgeInsets(top: 5, leading: 10, bottom: 3, trailing: 5))
//            
//        }
//        .foregroundColor(.white)
//        .padding(paddingWidth)
//        .background {
//            Capsule()
//                .fill(.orange.opacity(0.75))
//                
//        }
//    }
//}
//
//
//struct SelectedTagRow_Previews: PreviewProvider {
//    static var previews: some View {
//        SelectedTagRow()
//            .environmentObject(Tag.sampleData[0])
//    }
//}
