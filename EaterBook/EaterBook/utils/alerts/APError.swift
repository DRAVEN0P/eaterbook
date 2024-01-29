//
//  APError.swift
//  EaterBook
//
//  Created by Daipayan Neogi on 23/01/24.
//

import Foundation

enum APError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
