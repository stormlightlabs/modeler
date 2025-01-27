//
//  HomeView.swift
//  Mental Modeler
//
//  Created by Owais Jamil on 1/27/25.
//
import SwiftUI
import SwiftData

struct HomeView: View {
    @State private var cardTitles = ["Welcome Message", "Some text"]
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(cardTitles, id: \.self) { title in
                    NavigationLink {
                        Text(title)
                    } label: {
                        Text(title)
                    }
                }
            }
        } detail: {
            Text("Home Page")
        }
    }
}

#Preview {
    HomeView()
}
