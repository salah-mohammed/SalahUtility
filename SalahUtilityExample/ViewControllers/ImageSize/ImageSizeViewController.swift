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
        var originalImage = UIImage(named:"IMG_0257")! //UIImage.init(named:"paper")!
         
//        var originalImageInfo = originalImage.pngData()?.bs_getSizeIn(.megabyte)
//         print((originalImageInfo?.1 ?? "")+"\n");
//
//
//        var compressedImageData = originalImage.jpegData(compressionQuality:0.2);
////         var compressedImageInfo = compressedImageData?.bs_getSizeIn(.megabyte)
////          print(compressedImageInfo?.1);
////
//         var compressedImage = UIImage.init(data: compressedImageData!);
//          img.image = compressedImage
//
//        Debuger.shared.debugLog(object:"originalPng " + (originalImage.pngData()?.bs_getSizeIn(.megabyte).1 ?? ""))
//        Debuger.shared.debugLog(object:"originalJpg " + (originalImage.jpegData(compressionQuality:1.0)?.bs_getSizeIn(.megabyte).1 ?? ""))
//        Debuger.shared.debugLog(object:"0.5Jpg " + (originalImage.jpegData(compressionQuality:0.5)?.bs_getSizeIn(.megabyte).1 ?? ""))
//        Debuger.shared.debugLog(object:"0.2Jpg " + (compressedImageData?.bs_getSizeIn(.megabyte).1 ?? ""))
//
//
//        var a =  Debuger.shared.printItems();
//        print(a);
//        print(a);

        // Do any additional setup after loading the view.
        
        var oldSize = originalImage.jpeg(.highest)?.bs_getSizeIn(.kilobyte).0;
//        var data = originalImage.compress(value: (20,.kilobyte));
        var data = try? originalImage.compressImage(20) { image, item in
            let newImage = image.jpegData(compressionQuality:item);
            self.img.image = originalImage//UIImage.init(data: newImage!);
         var value =  newImage?.bs_getSizeIn(.kilobyte);
            print(value);
        }
//        var newSize = data?.bs_getSizeIn(.kilobyte).0 ?? 0.0
//        if let data:Data=data{
//            img.image = UIImage.init(data: data, scale: 1.0);
//        }
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
extension UIImage{
    func compress(value:(Double,Data.DataUnits))->Data?{
        var data:Data? = self.jpegData(compressionQuality: 1.0);
        repeat {
            data = self.jpegData(compressionQuality:0);
        }while ((data?.bs_getSizeIn(value.1).0 ?? 0.0) > value.0 && (data != nil))
        return data
    }
}

extension UIImage {
  enum CompressImageErrors: Error {
    case invalidExSize
    case sizeImpossibleToReach
  }
  func compressImage(_ expectedSizeKb: Int, completion : (UIImage,CGFloat) -> Void ) throws {
    let minimalCompressRate :CGFloat = 0.4 // min compressRate to be checked later
    if expectedSizeKb == 0 {
      throw CompressImageErrors.invalidExSize // if the size is equal to zero throws
    }
    let expectedSizeBytes = expectedSizeKb * 1024
    let imageToBeHandled: UIImage = self
    var actualHeight : CGFloat = self.size.height
    var actualWidth : CGFloat = self.size.width
    var maxHeight : CGFloat = 841 //A4 default size I’m thinking about a document
    var maxWidth : CGFloat = 594
    var imgRatio : CGFloat = actualWidth/actualHeight
    let maxRatio : CGFloat = maxWidth/maxHeight
    var compressionQuality : CGFloat = 1
    var imageData:Data = imageToBeHandled.jpegData(compressionQuality: compressionQuality)!
    while imageData.count > expectedSizeBytes {
      if (actualHeight > maxHeight || actualWidth > maxWidth){
        if(imgRatio < maxRatio){
          imgRatio = maxHeight / actualHeight;
          actualWidth = imgRatio * actualWidth;
          actualHeight = maxHeight;
        }
        else if(imgRatio > maxRatio){
          imgRatio = maxWidth / actualWidth;
          actualHeight = imgRatio * actualHeight;
          actualWidth = maxWidth;
        }
        else{
          actualHeight = maxHeight;
          actualWidth = maxWidth;
          compressionQuality = 1;
        }
      }
      let rect = CGRect(x: 0.0, y: 0.0, width: actualWidth, height: actualHeight)
      UIGraphicsBeginImageContext(rect.size);
      imageToBeHandled.draw(in: rect)
      let img = UIGraphicsGetImageFromCurrentImageContext();
      UIGraphicsEndImageContext();
      if let imgData = img!.jpegData(compressionQuality: compressionQuality) {
        if imgData.count > expectedSizeBytes {
          if compressionQuality > minimalCompressRate {
            compressionQuality -= 0.1
          } else {
            maxHeight = maxHeight * 0.9
            maxWidth = maxWidth * 0.9
          }
        }
        imageData = imgData
      }
    }
    completion(UIImage(data: imageData)!, compressionQuality)
  }
}
