//
//  ContentView.swift
//  GoPocketball
//
//  Created by Sh Hong on 2023/06/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CapturedImageCollectionView(mockData: MockData())
    }
}

// iOS17부터 지원
//#Preview {
//    ContentView()
//}
