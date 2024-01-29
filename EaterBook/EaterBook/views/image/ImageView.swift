//
//  ImageView.swift
//  EaterBook
//
//  Created by Daipayan Neogi on 24/01/24.
//

import SwiftUI

final class ImageLoader: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(urlString : String){
        NetworkManager.shared.downloadImage(urlString: urlString){ uiImage in
            guard let uiImage else{return}
            DispatchQueue.main.async {
                self.image = Image(uiImage: uiImage)
            }
        }
    }
}


struct ImageViewHelper: View {
    var image: Image?
    var body: some View {
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}


struct ImageView: View {
    @StateObject var imageLoader = ImageLoader()
    let urlString : String
    var body: some View {
        ImageViewHelper(image: imageLoader.image)
            .onAppear{
                imageLoader.load(urlString: urlString)
            }
    }
}

