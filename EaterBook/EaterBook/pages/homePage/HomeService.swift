//
//  HomeService.swift
//  EaterBook
//
//  Created by Daipayan Neogi on 24/01/24.
//

import Foundation

@MainActor final class HomeService: ObservableObject{
    
    @Published var appetizers : [Appetizer] = []
    @Published var selectedAppetizer: Appetizer?
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowingDetail = false
    
    func getAppetizers() {
        isLoading = true
        Task{
            do{
                appetizers = try await NetworkManager.shared.getAppetizers()
                print(appetizers)
                isLoading = false
            }
            catch {
                if let apError = error as? APError {
                    switch apError {
                        case .invalidURL:
                            alertItem = AlertContext.invalidURL
                        case .invalidResponse:
                            alertItem = AlertContext.invalidResponse
                        case .invalidData:
                            alertItem = AlertContext.invalidData
                        case .unableToComplete:
                            alertItem = AlertContext.unableToComplete
                    }
                } else {
                    alertItem = AlertContext.invalidResponse
                }
                
                isLoading = false
            }
            
        }
    }

}
