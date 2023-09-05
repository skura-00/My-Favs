//
//  MyFavsTabView.swift
//  My Favs!
//
//  Created by 倉田沙智 on 2023/07/11.
//

import SwiftUI

// Tab pop to root: https://www.hackingwithswift.com/forums/swiftui/pop-to-root-view-using-tab-bar-in-swiftui/4196

struct HomeView: View {
    @EnvironmentObject var favs: FavsList
    @EnvironmentObject var tags: TagsList
    @StateObject var toRoot: ToRoot = ToRoot()
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.colorScheme) var colorScheme
    
    @State private var isPresentingNewCategoryView = false
    
    let cols = [GridItem(.flexible()),
                GridItem(.flexible())]
    
    var body: some View {
        TabView (selection: $toRoot.selected) {
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: cols) {
                        ForEach(favs.categoryList) { category in
                            NavigationLink(destination: FavItemView().environmentObject(toRoot).environmentObject(category)) {
                                CategoryRow()
                                    .environmentObject(category)
                            }
                        }
                    }
                    .padding(.horizontal)
                }
                .navigationTitle("Category")
                .toolbar {
                    ToolbarItem {
                        Button(action: {
                            isPresentingNewCategoryView = true
                        }) {
                            Image(systemName: "plus")
                                .foregroundColor(Color.orange)
                        }
                        .accessibilityLabel(Text("New Item"))
                    }
                }
                .toolbarBackground(colorScheme == .dark ? Color(#colorLiteral(red: 0.02993695997, green: 0.1116794124, blue: 0.1822000444, alpha: 1)) : .white, for: .navigationBar)
                .background(colorScheme == .dark ? Color(#colorLiteral(red: 0.02993695997, green: 0.1116794124, blue: 0.1822000444, alpha: 1)) : .white)
                .sheet(isPresented: $isPresentingNewCategoryView) {
                    NewCategorySheet(isPresentingNewCategoryView: $isPresentingNewCategoryView)
                        .environmentObject(favs)
                }
            }
            .tag("home")
            .tabItem {
                Image(systemName: "tray")
                Text("Category")
            }
            
            TagView()
                .environmentObject(tags)
                .tag("tags")
                .tabItem {
                    Image(systemName: "tag.fill")
                    Text("Tags")
                }
            
            SettingView()
                .environmentObject(favs)
                .tag("setting")
                .tabItem {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
        }
        .navigationBarBackButtonHidden(true)
        .onReceive(toRoot.$selected) { selection in
            toRoot.toRoot.toggle()
        }
        .accentColor(colorScheme == .dark ? .white : .black)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
            HomeView()
                .environmentObject(FavsList())
                .environmentObject(TagsList())
                .preferredColorScheme(.light)
    }
}
