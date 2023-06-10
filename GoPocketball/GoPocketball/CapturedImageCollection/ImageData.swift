//
//  ImageData.swift
//  GoPocketball
//
//  Created by Sh Hong on 2023/06/10.
//

import Foundation
import SwiftUI

struct ImageData: Identifiable, Hashable {
    let id = UUID()
    let imageURL: String
    let name: String
}

struct MockData {
    let data: [ImageData]
}
