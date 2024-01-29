//
//  HomeDetailView.swift
//  EaterBook
//
//  Created by Daipayan Neogi on 24/01/24.
//

import SwiftUI

struct HomeDetailView: View {
    
    @EnvironmentObject var order: Orders
    
    let appertizer: Appetizer
    @Binding var isShowingDetail: Bool
    
    var body: some View {
        VStack{
            ImageView(urlString: appertizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 225)
            VStack{
                Text(appertizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appertizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                HStack(spacing: 40 ){
                    NutritionInfo(title: "Calories", value: "\(appertizer.calories)")
                    NutritionInfo(title: "Carbs", value: "\(appertizer.carbs)")
                    NutritionInfo(title: "Protein", value: "\(appertizer.protein)")
                }
            }
            Spacer()
            Button{
                isShowingDetail = false
                order.add(appertizer)
            } label: {
                Text("$\(appertizer.price , specifier: "%.2f") - Add to Order")
            }
            .modifier(StandardButtonStyle())
            .padding(.bottom,30)
            
        }
        .frame(width: 300,height: 525)
        .background(Color(.systemBackground))
        .cornerRadius(10)
        .shadow(radius: 40)
        .overlay(
            Button{
                order.add(appertizer)
                isShowingDetail = false
            }label: {
                XDismissButton()
            },alignment: .topTrailing)
    }
}

#Preview {
    HomeDetailView(appertizer: MockData.sampleAppetizer,
                   isShowingDetail: .constant(true))
}

struct NutritionInfo: View {
    
    let title: String
    let value: String
    var body: some View {
        VStack(){
            Text(title)
                .bold()
                .font(.caption)
            
            Text(value)
                .foregroundStyle(.secondary)
                .fontWeight(.semibold)
                .italic()
        }
    }
}

struct XDismissButton: View {
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.white)
                .opacity(0.6)
            
            Image(systemName: "xmark")
                .imageScale(.small)
                .frame(width: 44, height: 44)
                .foregroundColor(.black)
        }
    }
}
