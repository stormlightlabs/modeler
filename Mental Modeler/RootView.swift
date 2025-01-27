//
//  RootView.swift
//  Mental Modeler
//
//  Created by Owais Jamil on 1/27/25.
//

import SwiftData
import SwiftUI

enum AppTabs: String, CaseIterable {
    case home = "Home"
    case stats = "Stats"
    case actions = "Actions"
    case notes = "Notes"
    case settings = "Settings"
}

struct RootView: View {
    @Environment(\.modelContext) private var modelContext

    @State private var selectedTab: AppTabs = .home

    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Home", systemImage: "chart.bar.xaxis", value: .home) {
                HomeView()
            }

            Tab("Stats", systemImage: "tablecells", value: .stats) {
                HomeView()
            }

            Tab(
                "Actions", systemImage: "rectangle.and.pencil.and.ellipsis",
                value: .actions
            ) {
                HomeView()
            }

            Tab(
                "Notebook", systemImage: "pencil.and.list.clipboard",
                value: .notes
            ) {
                HomeView()
            }

            Tab("Settings", systemImage: "gear", value: .settings) {
                HomeView()
            }
        }
    }
}

#Preview {
    RootView()
}
