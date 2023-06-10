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
                        
            Button("잡았다.") {
                print("저장합니다.")
            }
            .font(.system(size: 40))
        }
        .padding(30)
    }
}

struct SaveInformationView_Previews: PreviewProvider {
    static var previews: some View {
        SaveInformationView()
    }
}
