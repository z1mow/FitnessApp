//
//  FitnessTabView.swift
//  FitnessApp
//
//  Created by Şakir Yılmaz ÖĞÜT on 3.01.2025.
//

import SwiftUI

struct FitnessTabView: View {
    @State var SelectedTab = "Home"
    
    init() {
        let appearence = UITabBarAppearance()
        appearence.configureWithOpaqueBackground()
        appearence.stackedLayoutAppearance.selected.iconColor = .green
        appearence.stackedLayoutAppearance.selected.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.green]
        UITabBar.appearance().scrollEdgeAppearance = appearence
    }
    
    var body: some View {
        TabView(selection: $SelectedTab) {
            HomeView()
                .tag("Home")
                .tabItem {
                    Image(systemName: "house")
                    
                    Text("Home")
                }
            
            HistoricDataView()
                .tag("Historic")
                .tabItem {
                    Image(systemName: "chart.line.uptrend.xyaxis")
                    
                    Text("Charts")
                }
        }
    }
}

#Preview {
    FitnessTabView()
}
