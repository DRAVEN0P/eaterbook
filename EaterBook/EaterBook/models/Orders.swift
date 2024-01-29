//
//  OrderView.swift
//  EaterBook
//
//  Created by Daipayan Neogi on 24/01/24.
//

import SwiftUI
import Combine

final class Orders: ObservableObject {
    
    @Published var items: [Appetizer] = []
    
    
    var totalPrice: Double {
        items.reduce(0) { $0 + $1.price }
    }
    
    
    func add(_ appetizer: Appetizer) {
        items.append(appetizer)
    }
    
    
    func deleteItems(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}


