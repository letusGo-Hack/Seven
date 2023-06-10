//
//  CapturedImageCollectionView.swift
//  GoPocketball
//
//  Created by Sh Hong on 2023/06/10.
//

import SwiftUI

struct CapturedImageCollectionView: View {
    let mockData: MockData
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(
                    columns: [GridItem(.flexible()), GridItem(.flexible())],
                    spacing: 10
                )
                {
                    ForEach(mockData.data, id: \.self) { data in
                        NavigationLink(destination: ARCameraView(objectURLPath: data.imageURL)) {
                            ImageCellView(item: data.name)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("저장소")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
//                        CaptureView()
                    } label: {
                        Text("추가")
                    }

                }
            }
        }
    }
}
