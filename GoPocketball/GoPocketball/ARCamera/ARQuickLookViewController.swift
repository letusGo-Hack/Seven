//
//  ARQuickLookViewController.swift
//  GoPocketball
//
//  Created by moon Lily on 2023/06/10.
//

import UIKit
import QuickLook
import ARKit

class ARQuickLookViewController: UIViewController, QLPreviewControllerDataSource {

    var delegate: DismissDelegate?
    
    private var hasPresent: Bool = false
    
    private let objectURLPath: String
    
    init(objectURLPath: String) {
        self.objectURLPath = objectURLPath
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if hasPresent == false {
            let previewController = QLPreviewController()
            previewController.dataSource = self
            present(previewController, animated: true, completion: nil)
            hasPresent = true
        } else {
            delegate?.dismissARCameraView()
        }
    }

    func numberOfPreviewItems(in controller: QLPreviewController) -> Int { return 1 }

    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        let url = URL(fileURLWithPath: objectURLPath)
        return url as QLPreviewItem
    }
    
    override func viewWillDisappear(_ animated: Bool) {
    }
}

protocol DismissDelegate {
    
    func dismissARCameraView()
}
