//
//  GenericExampleViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 3/15/21.
//  Copyright © 2021 Salah. All rights reserved.
//

import UIKit

class GenericExampleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func printEat<T: Food>(eat: T) {
        print(eat.name)
    }
    func printEat<T>(eat: T) {
        print(eat);
    }
}
protocol Food {
    var name: String { get }
}

struct Rice: Food {
    var name: String { return "Rice" }
    var calories: Float!
}

struct Insect: Food {
    var name: String { return "Insect" }
    var fiber: Float!
}
protocol Car {
    associatedtype Engin

    var name: String { get }
}
struct BMW<Engin>: Car {
    
    var name: String { return "BMW" }
}


/*
 init<NetworkManagerType>(_ networkManager: NetworkManagerType) where Target == NetworkManagerType.Target, NetworkManagerType : NetworkManager{

 */
