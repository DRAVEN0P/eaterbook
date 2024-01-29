//
//  EaterBookApp.swift
//  EaterBook
//
//  Created by Daipayan Neogi on 21/01/24.
//

import SwiftUI

@main
struct EaterBookApp: App {
    
    var orders = Orders()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(orders)
        }
    }
}
