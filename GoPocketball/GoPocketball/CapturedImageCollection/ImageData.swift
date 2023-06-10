//
//  ImageData.swift
//  GoPocketball
//
//  Created by Sh Hong on 2023/06/10.
//

import SwiftUI

struct ImageData: Identifiable {
    let id = UUID()
    let imageURL: URL
    let name: String
}

struct MockData: Hashable {
    let data: [String] = (0...80).map { "이거 번호 \($0)"}
}
