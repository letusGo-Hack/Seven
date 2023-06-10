//
//  ARCamera.swift
//  GoPocketball
//
//  Created by Sh Hong on 2023/06/10.
//

import Foundation
import SwiftUI

struct ARCameraView: UIViewControllerRepresentable, DismissDelegate {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    private let objectURLPath: String
    
    init(objectURLPath: String) {
        self.objectURLPath = objectURLPath
    }
    
    typealias UIViewControllerType = ARQuickLookViewController
    
    func makeUIViewController(context: Context) -> ARQuickLookViewController {
        let quickLooVC = ARQuickLookViewController(objectURLPath: objectURLPath)
        quickLooVC.delegate = self
        return quickLooVC
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
    
    func dismissARCameraView() {
        self.presentationMode.wrappedValue.dismiss()
    }
    
}
