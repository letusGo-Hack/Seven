//
//  ContentView.swift
//  GoPocketball
//
//  Created by Sh Hong on 2023/06/10.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView(content: {
            NavigationLink(destination: ARCameraView(objectURLPath: Dummy.ojectURL)) { /*@START_MENU_TOKEN@*/Text("Navigate")/*@END_MENU_TOKEN@*/ }
        })
       
    }
}

// iOS17부터 지원
//#Preview {
//    ContentView()
//}
