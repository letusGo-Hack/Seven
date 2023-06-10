//
//  Capture.swift
//  GoPocketball
//
//  Created by Sh Hong on 2023/06/10.
//

import SwiftUI
import RealityKit

@MainActor
@available(iOS 17.0, *)
struct CaptureView: View {
    
    let session: ObjectCaptureSession
    let url: URL
    @State var isDetectionSucceed: Bool = false
    @Environment(\.dismiss) var dismiss
    
    init(in url: URL) {
        self.url = url
        self.session = ObjectCaptureSession()
        var configuration = ObjectCaptureSession.Configuration()
        configuration.checkpointDirectory = url.appendingPathComponent("Snapshots/")
        
        session.start(
            imagesDirectory: url.appendingPathComponent("Images/"),
            configuration: configuration
        )
    }
    
    var body: some View {
        ZStack {
            ObjectCaptureView(session: session)
            ZStack {
                Spacer()
                if case .ready = session.state {
                    Button("Detect") {
                        isDetectionSucceed = session.startDetecting()
                    }
                    .alert("Detect Succeed", isPresented: $isDetectionSucceed) {
                        Button("Ok") { isDetectionSucceed = false }
                    }
                } else if case .detecting = session.state {
                    Button("Start Capture") {
                        session.startCapturing()
                    }
                    Button("Tap if Capturing Finished") {
                        Task {
                            do {
                                var configuration = PhotogrammetrySession.Configuration()
                                configuration.checkpointDirectory = url.appendingPathComponent("Snapshots/")
                                let session = try PhotogrammetrySession(
                                    input: url.appendingPathComponent("Images/"),
                                    configuration: configuration)
                                try session.process(requests: [
                                    .modelFile(url: url.appendingPathComponent("Models/model.usdz"))
                                ])
                                for try await output in session.outputs {
                                    if case .processingComplete = output {
                                        dismiss()
                                    }
                                }
                            } catch {}
                        }
                    }
                }
            }
        }
    }
    
    
}
