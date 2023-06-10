//
//  ImageCellView.swift
//  GoPocketball
//
//  Created by Sh Hong on 2023/06/10.
//

import SwiftUI

struct ImageCellView: View {
    let item: String
    
    var body: some View {
        VStack {
            Image(systemName: "cloud.sun.rain.fill")
                .resizable()
                .foregroundColor(.yellow)
                .frame(height: 200)
                .frame(maxWidth: .infinity)
                .background(.gray)
                .cornerRadius(10)
            
            Text(item)
                .frame(maxWidth: .infinity)
                .padding(5)
        }
        .overlay(
        RoundedRectangle(cornerRadius: 10)
            .stroke(
                Color(.black),
                lineWidth: 0.5)
        )
    }
}

struct ImageCellView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCellView(item: "")
    }
}
