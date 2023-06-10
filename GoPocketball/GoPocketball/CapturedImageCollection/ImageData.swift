//
//  ImageData.swift
//  GoPocketball
//
//  Created by Sh Hong on 2023/06/10.
//

import Foundation
import SwiftUI

struct ImageData: Identifiable {
    let id = UUID()
    let imageURL: String
    let name: String
}

struct MockData: Hashable {
    let data: [String] = (0...80).map { "이거 번호 \($0)"}
    var usdzFileNames: [String] {
        let documentURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let path = documentURL.appendingPathComponent("Models").absoluteURL
        
        do {
            try FileManager.default.createDirectory(atPath: path.relativePath, withIntermediateDirectories: true)
            // Get the directory contents urls (including subfolders urls)
            let directoryContents = try FileManager.default.contentsOfDirectory(at: path, includingPropertiesForKeys: nil, options: [])
            
            // if you want to filter the directory contents you can do like this:
            let filesPath = directoryContents.filter{ $0.pathExtension == "usdz" }
            let fileNames = filesPath.map{ $0.deletingPathExtension().lastPathComponent }
            
            return fileNames
            
        } catch {
            print(error.localizedDescription)
        }
        
        return []
    }
}
