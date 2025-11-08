//
//  ContentView.swift
//  Acknowledger
//
//  Created by 林嘉誠 on 2025/11/2.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        TabView {
            // Home
            NavigationStack {
                ZStack {
                    Background()
                    ScrollView {
                        // 在內容中原有的區塊
                        Title(symbol: "long.text.page.and.pencil.fill", title: "Lecture Note", color: .green)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        HomeList(notes: lectures1)
                        Title(symbol: "music.microphone", title: "Speech List", color: .brown)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        HomeList(notes: speeches)
                        Title(symbol: "apple.writing.tools", title: "AI Tool List", color: .gray)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        HomeList(notes: ai)
                        Title(symbol: "rectangle.and.pencil.and.ellipsis", title: "Other Event", color: .red)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        HomeList(notes: others)
                    }
                    .padding(.horizontal) // optional: consistent side padding for the scroll content
                }
                .navigationTitle("Acknowledger")
                // 用 toolbar 的 .principal 放一個可點的「標題」
                .toolbar {
                    ToolbarItem(placement: .principal) {
                        NavigationLink {
                            ListView()
                        } label: {
                            HStack(spacing: 20) {
                                Image(systemName: "exclamationmark.magnifyingglass")
                                    .symbolEffect(.variableColor)
                                    .font(.largeTitle)
                                    .bold()
                                Text("List Searching")
                                    .font(.largeTitle) // 放大字體
                                    .bold()
                                    .foregroundStyle(.blue) // 藍色字體
                            }
                            .padding(.vertical, 6)
                            .padding(.horizontal, 10)
                            .background(.regularMaterial, in: Capsule())
                        }
                        .accessibilityLabel("Open Acknowledger List")
                    }
                }
//                 //隱藏系統的 navigationTitle 以免與自訂 principal 衝突
//                .navigationBarTitleDisplayMode(.inline)
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            
            // Lecture tab
            NavigationStack {
                ZStack {
                    Background()
                    LectureList(notes: lectures1)
                }
            }
            .tabItem {
                Label("Lecture", systemImage: "long.text.page.and.pencil.fill")
            }
            
            // Speech tab
            NavigationStack {
                ZStack {
                    Background()
                    LectureList(notes: speeches)
                }
            }
            .tabItem {
                Label("Speech", systemImage: "music.microphone")
            }
            
            // AI Tool tab
            NavigationStack {
                ZStack {
                    Background()
                    LectureList(notes: ai)
                }
            }
            .tabItem {
                Label("AI Tool", systemImage: "apple.writing.tools")
            }
            
            // Others tab
            NavigationStack {
                ZStack {
                    Background()
                    LectureList(notes: others)
                }
            }
            .tabItem {
                Label("Others", systemImage: "rectangle.and.pencil.and.ellipsis")
            }
        }
//        // tab變成水平滑動瀏覽
//        .tabViewStyle(.page)
    }
}

#Preview {
    ContentView()
}
