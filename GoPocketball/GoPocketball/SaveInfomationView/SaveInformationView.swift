//
//  SaveInformationView.swift
//  GoPocketball
//
//  Created by Sh Hong on 2023/06/10.
//

import Foundation
import SwiftUI

struct SaveInformationView: View {
    @State private var text: String = ""
    
    var body: some View {
        VStack {
            Text("포켓볼의 이름을 정해주세요.")
                .font(.system(size: 50))
            
            TextField(
                String(),
                text: $text
            )
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .font(.system(size: 30))
            
            if #available(iOS 17.0, *) {
                NavigationLink(destination: CaptureView(in: documentationURL(), name: text)) {
                    Text("잡았다.")
                        .font(.system(size: 40))
                }
            }
        }
        .padding(30)
    }
    
    func documentationURL() -> URL {
        let fileManager = FileManager.default
        let documentsURL = fileManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
        try? FileManager.default.removeItem(at: documentsURL.appendingPathComponent("Snapshots/"))
        try? FileManager.default.removeItem(at: documentsURL.appendingPathComponent("Images/"))
        return documentsURL
    }
}

struct SaveInformationView_Previews: PreviewProvider {
    static var previews: some View {
        SaveInformationView()
    }
}
