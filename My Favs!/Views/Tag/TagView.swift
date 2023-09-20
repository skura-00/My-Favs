////
////  TagView.swift
////  My Favs!
////
////  Created by SK on 2023/09/02.
////
//
//import SwiftUI
//
//class Input: ObservableObject {
//    @Published var input: String
//
//    init(input: String) {
//        self.input = input
//    }
//
//    static var emptyInput: Input {
//        Input(input: String())
//    }
//}
//
//struct TagView: View {
//    @StateObject var toRoot: ToRoot = ToRoot()
//    @EnvironmentObject var tags: TagsList
//    @Environment(\.colorScheme) var colorScheme
//    @ObservedObject var input = Input.emptyInput
//    let wordLimit = 35
//
//    let cols = [GridItem(.flexible()),
//                GridItem(.flexible())]
//
//    var body: some View {
//        let text = Binding(
//            get: { input.input },
//            set: { input.input = String($0.prefix(wordLimit))}
//        )
//
//        TabView (selection: $toRoot.selected) {
//            NavigationStack {
//                VStack {
//                    HStack {
//
//                        TextField("Enter tag name", text: text)
//                            .padding(EdgeInsets(top: 4, leading: 15, bottom: 4, trailing: 10))
//
//                        Button("Add") {
//                            let id = SQLiteDB.shared.insertTag(name: input.input)
//                            if (id != nil) {
//                                tags.tagList = SQLiteDB.shared.getAllTags()
//                            }
//                            input.input = String()
//                        }
//                        .disabled(input.input.isEmpty)
//                        .padding(EdgeInsets(top: 4, leading: 10, bottom: 4, trailing: 10))
//                    }
//                    .background(colorScheme == .dark ? .black : .white)
//                    .border(.black, width: 1)
//                    .padding()
//                    ScrollView {
//                        LazyVGrid(columns: cols) {
//                            ForEach($tags.tagList) { $tag in
//                                SelectedTagRow()
//                                    .environmentObject(tag)
//                                    .environmentObject(tags)
//                                    .alignmentGuide(.leading) { d in d[.leading] }
//                            }
//                        }
//                        .padding(.horizontal)
//                    }
//
//
//                    Spacer()
//                }
//                .padding(.vertical)
//                .background(colorScheme == .dark ? Color(#colorLiteral(red: 0.02993695997, green: 0.1116794124, blue: 0.1822000444, alpha: 1)) : Color(#colorLiteral(red: 0.949019134, green: 0.9490200877, blue: 0.9705253243, alpha: 1)))
//            }
//        }
//    }
//}
//
//struct TextLimitModifer: ViewModifier {
//    @Binding var value: String
//    var length: Int
//
//    func body(content: Content) -> some View {
//        content
//            .onReceive(value.publisher.collect()) {
//                value = String($0.prefix(length))
//            }
//    }
//}
//
//struct TagView_Previews: PreviewProvider {
//    static var previews: some View {
//        TagView()
//            .environmentObject(TagsList().sampleTags())
//            .preferredColorScheme(.light)
//    }
//}
