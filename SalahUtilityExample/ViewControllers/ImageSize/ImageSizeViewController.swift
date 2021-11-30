//
//  ImageSizeViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 5/27/21.
//  Copyright © 2021 Salah. All rights reserved.
//

import UIKit
import SalahUtility
class ImageSizeViewController: UIViewController {
    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        var originalImage = UIImage.init(named:"paper")!
         
        var originalImageInfo = originalImage.pngData()?.bs_getSizeIn(.megabyte)
         print((originalImageInfo?.1 ?? "")+"\n");
         
         
         var compressedImageData = originalImage.jpegData(compressionQuality: 1);
         var compressedImageInfo = compressedImageData?.bs_getSizeIn(.megabyte)
          print(compressedImageInfo?.1);
         
         var compressedImage = UIImage.init(data: compressedImageData!);
          img.image = compressedImage
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
