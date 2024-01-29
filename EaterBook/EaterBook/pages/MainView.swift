//
//  ContentView.swift
//  EaterBook
//
//  Created by Daipayan Neogi on 21/01/24.
//

import SwiftUI

struct MainView: View {
        
    var body: some View {
        TabView{
            Home()
                .tabItem { Label("Home",systemImage: "house.fill") }
            Accounts()
                .tabItem { Label("Account",systemImage: "person.fill") }
            OrderView()
                .tabItem { Label("Order",systemImage: "bag.fill") }
        }
        .accentColor(.brandPrimary)
    }
}

#Preview {
    MainView()
        .environmentObject(Orders())
}
