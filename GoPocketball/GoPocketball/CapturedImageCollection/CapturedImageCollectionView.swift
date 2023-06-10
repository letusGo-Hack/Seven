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
                        NavigationLink(destination: ARCameraView(objectURLPath: Dummy.ojectURL)) {
                            ImageCellView(item: data)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("저장소")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink {
                        if #available(iOS 17.0, *) {
                            CaptureView(in: documentationURL())
                        }
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
