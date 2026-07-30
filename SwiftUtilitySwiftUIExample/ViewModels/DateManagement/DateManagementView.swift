//
//  DateManagementView.swift
//  SalahUtilitySwiftUIExample
//
//  Created by SalahMohamed on 26/07/2023.
//  Copyright © 2023 Salah. All rights reserved.
//
import Foundation
import SwiftUI
struct DateManagementView: View {
    @StateObject var viewModel = DateManagementViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.list, id: \.self.0) { item in
                Button.init(action: item.1, label:{
                    Text(item.0)
                })
            }
        }
    }
}


struct DateManagementView_Previews: PreviewProvider {
    static var previews: some View {
        DateManagementView()
    }
}
