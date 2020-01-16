//
//  ContentView.swift
//  Sample
//
//  Created by NaotoTakahashi
//  Copyright © 2020 msb. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct ContentView: View {
    @EnvironmentObject private var metaData: MetaData
    
    var body: some View {
        VStack {
            VStack {
                Text(verbatim: self.metaData.og["og:title"] ?? "").font(.headline).frame(width: 320, height: 50, alignment: .center)
                Spacer().frame(width:0, height: 20, alignment: .center)
                KFImage(URL(string: self.metaData.og["og:image"] ?? "")).resizable().frame(width:300, height:400)
                Spacer().frame(width:0, height: 20, alignment: .center)
                Text(verbatim: self.metaData.og["og:description"] ?? "")
                    .font(.subheadline).frame(width: 320, height: 40, alignment: .center)
                Spacer().frame(width:0, height: 20, alignment: .center)
            }.padding()
            Button(action: {
                self.metaData.fetchOg()
            }) {
                Text("Fetch OG")
            }
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
