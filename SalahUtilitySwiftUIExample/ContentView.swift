//
//  ContentView.swift
//  SalahUtilitySwiftUIExample
//
//  Created by SalahMohamed on 19/02/2023.
//  Copyright © 2023 Salah. All rights reserved.
//

import SwiftUI
import SalahUtility
struct ContentView: View {

    var body: some View {
        ZStack{
            Color.red
            VStack{
                BlueNavBarView()
                VStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundColor(.accentColor)
                    Text("Hello, world!")
                }.navigationTitle("a")
                    .padding()
                Spacer()
            }.navigationBarHidden(true).navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
private struct BlueNavBarView: View {
//    @StateObject var viewModel:InputViewModel
//    var inputInfo:ExternalInputInfo
    @State var barHeight:CGFloat=0

    var body: some View {
        ZStack{
            HStack{
                Button.init {
                } label: {
                    Text("L")
                }
                Spacer()
                Button.init {

                } label: {
                    Text("R")
                }
            }
        }.frame(height:barHeight).background(.brown)
            .background(NavBarAccessor { navBar in
                self.barHeight = navBar.bounds.height
            })
        }
}
