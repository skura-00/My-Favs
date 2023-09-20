////
////  NormalTagRow.swift
////  My Favs!
////
////  Created by SK on 2023/09/02.
////
//
//import SwiftUI
//
//struct NormalTagRow: View {
//    @EnvironmentObject var tag: Tag
//    
//    var body: some View {
//        ZStack {
//            HStack {
//                Text("\(tag.name)")
//                    .font(.callout)
//                    .padding(.horizontal, 5)
//            }
//            .padding(EdgeInsets(top: 2, leading: 5, bottom: 2, trailing: 5))
//        }
//        .border(.gray, width: 1.5)
//    }
//}
//
//struct NormalTagRow_Previews: PreviewProvider {
//    static var previews: some View {
//        NormalTagRow()
//            .environmentObject(Tag.sampleData[0])
//    }
//}
