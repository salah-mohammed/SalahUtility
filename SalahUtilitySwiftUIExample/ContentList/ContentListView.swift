//
//  ContentListView.swift
//  SalahUtilitySwiftUIExample
//
//  Created by SalahMohamed on 26/07/2023.
//  Copyright © 2023 Salah. All rights reserved.
//
import Foundation
import SwiftUI
struct ContentListView: View {
    @StateObject var viewModel = ContentListViewModel()
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.list, id: \.self.0) { item in
                    Button.init(action: item.1, label:{
                        Text(item.0)
                    })
                }
            }.navigationDestination(isPresented:$viewModel.pushVibration){
                VibrationView()
            }
        }.navigationBarTitle("Content List")
    }
}


struct ContentListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentListView()
    }
}
