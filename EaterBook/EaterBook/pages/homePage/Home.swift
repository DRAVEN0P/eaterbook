//
//  Home.swift
//  EaterBook
//
//  Created by Daipayan Neogi on 21/01/24.
//

import SwiftUI

struct Home: View {
    
    @StateObject var viewModel = HomeService()
    
    var body: some View {
        ZStack{
            NavigationView{
                List(viewModel.appetizers){ appetizer in
                    AppetizersView(appatizer: appetizer)
                        .onTapGesture {
                            viewModel.selectedAppetizer = appetizer
                            viewModel.isShowingDetail = true
                        }
                }
                .navigationTitle("🍟 Menu")
                .listStyle(.plain)
                .disabled(viewModel.isShowingDetail)
            }
            .onAppear(){
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetail ? 20 : 0)
            
            if viewModel.isShowingDetail{
                HomeDetailView(appertizer: viewModel.selectedAppetizer!,
                               isShowingDetail: $viewModel.isShowingDetail)
            }
            
            if(viewModel.isLoading){
                LoadingView()
            }
        }
    }
}

#Preview {
    Home()
}
