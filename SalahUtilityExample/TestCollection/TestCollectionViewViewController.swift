//
//  TestCollectionViewViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 1/27/21.
//  Copyright © 2021 Salah. All rights reserved.
//

import UIKit

class TestCollectionViewViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!

    var items:[Any]=["1","2","3","4"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.delegate=self;
        self.collectionView.dataSource=self;
        self.collectionView.reloadData();
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
extension TestCollectionViewViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"TestCollectionViewCell", for: indexPath) as? TestCollectionViewCell
        cell?.config(self.items[indexPath.row]);
        return cell!;
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1;
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.items.count;
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.init(width: 160, height:50);
    }
}
