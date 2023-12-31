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
                    NavigationLink(destination: ARCameraView(objectURLPath: Dummy.ojectURL)) {
                        ImageCellView(item: "Dummy")
                    }
                    ForEach(mockData.usdzFileNames, id: \.self) { name in
                        NavigationLink(destination: ARCameraView(objectURLPath: documentationURL().appendingPathComponent("Models/\(name).usdz").absoluteString)) {
                            ImageCellView(item: name)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("저장소")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        SaveInformationView()
                    } label: {
                        Text("추가")
                    }

                }
            }
        }
    }
    
    func documentationURL() -> URL {
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        try? FileManager.default.removeItem(at: documentsURL.appendingPathComponent("Snapshots/"))
        try? FileManager.default.removeItem(at: documentsURL.appendingPathComponent("Images/"))
        return documentsURL
    }
}
