//
//  AppetizersView.swift
//  EaterBook
//
//  Created by Daipayan Neogi on 22/01/24.
//

import SwiftUI

struct AppetizersView: View {
    let appatizer : Appetizer
    var body: some View {
        HStack(){
            ImageView(urlString: appatizer.imageURL)
                .frame(width: 120,height: 90)
                .aspectRatio(contentMode: .fit)
                .cornerRadius(10)
            
            //MARK: - To Download Image from URL
            
//            AsyncImage(url: URL(string: appatizer.imageUrl)!){ image in
//                image
//                    .image?.resizable()
//                    .frame(width: 120,height: 90)
//                    .aspectRatio(contentMode: .fit)
//                    .cornerRadius(10)
//            }
            
            VStack(alignment:.leading,spacing: 8 ){
                Text(appatizer.name)
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                    .font(.title2)
                Text("$\(appatizer.price,specifier: "%.2f")")
                    .fontWeight(.semibold)
                    .foregroundColor(.secondary)
            }
            .padding(.leading)
        }
    }
}

#Preview {
    AppetizersView(appatizer: MockData.sampleAppetizer)
}
 
