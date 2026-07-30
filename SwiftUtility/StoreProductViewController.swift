//
//  SKStoreProductViewControllerEx.swift
//  SalahUtility
//
//  Created by SalahMohamed on 04/07/2023.
//  Copyright © 2023 Salah. All rights reserved.
//

import Foundation
#if os(iOS)
import UIKit
import StoreKit
public class StoreProductViewController: SKStoreProductViewController {
    public override func viewDidLoad() {
        super.viewDidLoad()
        setupView();
        localized();
        setupData();
        fetchData();
    }
    public override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated);
    }
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews();
    }
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
    }
    @discardableResult public static func present(_ developerId:NSNumber,_ presenter:UIViewController?)->StoreProductViewController{
        let vc = StoreProductViewController.init();
        vc.loadProduct(withParameters: [SKStoreProductParameterITunesItemIdentifier:developerId])
        presenter?.present(vc, animated:true);
        return vc
    }
}
// MARK: - Base Methods
extension StoreProductViewController{
    func setupView(){
        self.delegate = self;
    }
    func localized(){
        
    }
    func setupData(){
        
    }
    func fetchData(){
        
    }
}
// MARK: - Networking Methods
extension StoreProductViewController:SKStoreProductViewControllerDelegate{
    public func productViewControllerDidFinish(_ viewController: SKStoreProductViewController) {
        self.dismiss(animated: true);
    }
}
#endif
