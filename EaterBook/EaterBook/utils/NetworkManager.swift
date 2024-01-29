//
//  NetworkManager.swift
//  EaterBook
//
//  Created by Daipayan Neogi on 23/01/24.
//
import UIKit
import Foundation
final class NetworkManager{
    
    private let cache = NSCache<NSString, UIImage>()
    static let shared = NetworkManager()
    
    static let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/"
    private let appetizerURL = baseURL + "appetizers"
    
    private init(){}
    
    
    
    func getAppetizers() async throws -> [Appetizer] {
        guard let url = URL(string: appetizerURL) else {
            throw APError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(ListAppetizer.self, from: data).request
        } catch {
            throw APError.invalidData
        }
    }
    
    
    
    func downloadImage(urlString : String, completed: @escaping (UIImage?) -> Void ){
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey){
            completed(image)
            return
        }
        guard let url = URL(string: urlString) else{
            completed(nil)
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)){ data, response, error  in
            
            guard let data , let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
            
        }
        task.resume()
    }
}

