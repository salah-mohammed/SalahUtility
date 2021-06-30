//
//  ScrollViewWithImageViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 6/30/21.
//  Copyright © 2021 Salah. All rights reserved.
//

import Foundation
import UIKit
import SalahUtility
class ScrollViewWithImageViewController: UIViewController {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var layoutConstraintHeightOfImage: NSLayoutConstraint!
    @IBOutlet weak var scrollView: UIScrollView!
    let heightOfHeaderImage:CGFloat=300;

    override func viewDidLoad() {
        super.viewDidLoad()

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
extension ScrollViewWithImageViewController:UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let value  = heightOfHeaderImage - self.scrollView.contentOffset.y
        if value <= (self.bs_topbarHeight ?? 0) {
               self.layoutConstraintHeightOfImage.constant = (self.bs_topbarHeight ?? 0);
           }else
           if value > heightOfHeaderImage {
               self.layoutConstraintHeightOfImage.constant = heightOfHeaderImage
           }else{
               self.layoutConstraintHeightOfImage.constant = value
           }
   }
}
