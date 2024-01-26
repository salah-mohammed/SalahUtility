//
//  OperationQueueViewController.swift
//  SalahUtility
//
//  Created by Salah on 9/27/21.
//  Copyright © 2021 Salah. All rights reserved.
//

import UIKit

class OperationQueueViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let myGroup = DispatchGroup()
        myGroup.enter()
        myGroup.leave()
        myGroup.notify(queue: DispatchQueue.main) {
        ////// do your remaining work
       print("a")
        }
        
        let op1 = MyOperation1()
        let op2 = MyOperation2()

        op1.completionBlock = {
            print("op1 finished")
        }

        op2.completionBlock = {
            print("op2 finished")
        }

        op2.addDependency(op1)

        var queue = DispatchQueue.global(qos: .background)
        let opsQue = OperationQueue()
        opsQue.underlyingQueue=queue;
        // setting maxConcurrentOperationCount to 1
        opsQue.maxConcurrentOperationCount = 1
        opsQue.addOperation(op1)
        opsQue.addOperation(op2)
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

}
class MyOperation1 : Operation {
    override func main() {
        var a = UIView.init()
        print("op1 working....")
    }
}

class MyOperation2 : Operation {
    override func main() {
        var a = UIView.init()
        print("op2 working....")
    }
}
