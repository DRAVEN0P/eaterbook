//
//  OrderView.swift
//  EaterBook
//
//  Created by Daipayan Neogi on 21/01/24.
//


import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var orders: Orders
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    List {
                        ForEach(orders.items) { appetizer in
                            AppetizersView(appatizer: appetizer)
                        }}
                    .listStyle(PlainListStyle())
                    
                    Button {
                        print("order placed")
                    } label: {
//                        APButton(title: "$\(order.totalPrice, specifier: "%.2f") - Place Order")
                        Text("$\(orders.totalPrice, specifier: "%.2f") - Place Order")
                    }
                    .modifier(StandardButtonStyle())
                    .padding(.bottom, 25)
                    
                }
                if(orders.items.isEmpty){
                    EmptyState(
                        imageName: "empty-order",
                        message: "You have no items in your order.\nPlease add an appetizer!")
                }
            }
            .navigationTitle("🧾 Orders")
        }
    }
}

struct Order_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Orders())
    }
}
