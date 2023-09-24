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
            ZStack{
              
//                Text("World's Greatest Flag")
//                   .font(.largeTitle)
//                   .padding()
//                   .blur(radius:3)
//                   .shadow(color:Color.black.opacity(1), radius:10)
//                   .cornerRadius(15.0)
                
                List {
                    ForEach(viewModel.list, id: \.self.0) { item in
                        Button.init(action: item.1, label:{
                            Text(item.0)
                        })
                    }

                }
            }.navigationDestination(isPresented:$viewModel.pushVibration){
                VibrationView()
            }.navigationDestination(isPresented:$viewModel.pushAppStorage){
                AppStorageView()
            }
        }.navigationBarTitle("Content List")
    }
}


struct ContentListView_Previews: PreviewProvider {
    static var previews: some View {
        ContentListView()
    }
}
