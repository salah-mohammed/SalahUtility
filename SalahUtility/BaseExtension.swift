//
//  BaseExtension.swift
//  Test1
//
//  Created by Salah on 12/15/19.
//  Copyright © 2019 Salah. All rights reserved.
//

import Foundation
import UIKit
import MapKit
import AudioToolbox
import AVKit
import MediaPlayer
import AVFoundation
import Photos
import UserNotifications
//import CommonCrypto

/*    **Array**   */

public extension Array{
    
      func bs_isContainObject(classType:AnyClass)->AnyObject?{
        for object in self {
            if  ((object as? AnyObject)?.isKind(of:classType))!
            {
                return object as AnyObject?;
                break;
            }
        }
        return nil;
    }
     func bs_index(_ indexs:[Int])->[Any]
    {
        var objects:Array = Array.init();
        for var index:Int in indexs
        {
            objects.append(self[index]);
        }
        return objects;
    }
     var bs_second:Any?{
        if self.count >= 2 {
            return self[1] as? Any;
        }
      return nil
    }
     var bs_thired:Any?{
        if self.count >= 3 {
            return self[2] as? Any;
        }
      return nil
    }
     var bs_beforeLast:Any?{
        if self.count >= 2 {
            return self[self.count-2] as? Any;
        }
      return nil
    }
     func bs_indexOfObject(object : AnyObject) -> NSInteger {
         return (self as NSArray).index(of: object)
     }
     mutating func bs_removeObject<T>(obj: T) where T : Equatable {
         self = self.filter({$0 as? T != obj})
     }
}
/*    **Dictionary**   */

public extension Dictionary where Key: ExpressibleByStringLiteral{
     func bs_getStringValueWithNewLine()->String
    {
        
        var temp:String=""
        for (_, value) in self {
            temp = "\(temp) \n \(value)" ;
        }
        
        return temp;
    }
    
    func bs_allValues()->Array<Any>{
        return Array(self.values.map{ $0 });
    }
    
}
public extension Dictionary where Value: Equatable {
     func bs_KeyForValue(_ val: Value) -> Key? {
        return first(where: { $1 == val })?.0
    }
  
}
/*    **MKMapItem**   */

public extension MKMapItem
{
      convenience init(latitude:Double,longitude:Double) {
        let coordinate = CLLocationCoordinate2DMake(latitude,longitude)
        self.init(placemark: MKPlacemark(coordinate: coordinate, addressDictionary:nil))
    }
}
/*    **String**   */

public extension String{
    var bs_float:Float?{
        return Float(self);
    }
    var respectLanguage:String{
    if UIView.userInterfaceLayoutDirection(for:UIApplication.shared.bs_rootViewController!.view.semanticContentAttribute) == .rightToLeft {
        return String(self.reversed());
        }else{
            return self;
        }
    }
    var bs_worlds:[String]{
        let wordList =  self.components(separatedBy: .punctuationCharacters).joined().components(separatedBy: " ").filter{!$0.isEmpty}
        return wordList;
    }
    var bs_worldsCount:Int{
        return self.bs_worlds.count;
    }

    var bs_removeSpaces : String{
        return self.replacingOccurrences(of: " ", with: "");
    }

    static func  bs_groupingSeparator (value:Int,seprator:String) -> String?{
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = NumberFormatter.Style.decimal
        numberFormatter.groupingSeparator = seprator
        let formattedNumber = numberFormatter.string(from: NSNumber(value:value))
        return formattedNumber
    }
    
    static func bs_duration(_ totalSeconds:Double)->String{
        let h : Int = Int(totalSeconds / 3600)
        let m : Int = Int((totalSeconds - Double(h) * 3600) / 60)
        let s : Int = Int(totalSeconds - 3600 * Double(h)) - m * 60
        if h != 0 {
        return String(format: "%02d:%02d:%02d", h, m, s)
        }else{
        return String(format: "%02d:%02d", m, s)
        }
    }

    func bs_htmlText(fontName:String,fontSize:String,alignment:String) -> String{
        //<font face='\(fontName)'>
        return "<!DOCTYPE html><html><head><title></title> <style> body{ font-family:\"\(fontName)\";font-size:\(fontSize)px;}</style> </head> <body align=\"\(alignment)\">\(self) </body> </html>";
    }
    func bs_htmlTextWithRespectLanguage(fontName:String,fontSize:String) -> String{
        var alignment = "";
        if #available(iOS 9.0, *) {
            if UIView.userInterfaceLayoutDirection(
                for:UIView.appearance().semanticContentAttribute) == .rightToLeft {
                alignment = "right"

            }else{
                alignment = "left"

            }
        } else {
            // Use the previous technique
            if UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft {
                alignment = "right"
            }
            else{
                alignment = "left"
            }
        }
        return self.bs_htmlText(fontName:fontName, fontSize: fontSize, alignment:alignment)
    }
    func bs_replace(target: String, withString: String) -> String {
        
        return self.replacingOccurrences(of: target, with:withString, options: .literal, range: nil)
    }
    func bs_subtract(_ start:Int,_ last:Int)->String{
        let firstIndex = self.index(self.startIndex, offsetBy:start, limitedBy: self.endIndex)!;
        
        let lastIndex = self.index(self.startIndex, offsetBy: last, limitedBy: self.endIndex)!;
        let tempObject =  Range<String.Index>.init(uncheckedBounds: (lower:firstIndex, upper:lastIndex))
        return String(self[tempObject])
    }

    func bs_arNumberToEn()-> String {
        let numbersDictionary : Dictionary = ["٠" : "0","١" : "1", "٢" : "2", "٣" : "3", "٤" : "4", "٥" : "5", "٦" : "6", "٧" : "7", "٨" : "8", "٩" : "9"]
        var str : String = self
        
        for (key,value) in numbersDictionary {
            str =  str.replacingOccurrences(of: key, with: value)
        }
        return str
    }
    
    //    var bs_md5:String {
    //        get{
    //            let messageData = self.data(using:.utf8)!
    //            var digestData = Data(count: Int(CC_MD5_DIGEST_LENGTH))
    //            _ = digestData.withUnsafeMutableBytes {digestBytes in
    //                messageData.withUnsafeBytes {messageBytes in
    //                    CC_MD5(messageBytes, CC_LONG(messageData.count), digestBytes)
    //                }
    //            }
    //
    //            return digestData.map { String(format: "%02hhx", $0) }.joined()
    //        }
    //    }
    
    func bs_cgFloat() -> CGFloat? {
        let myFloat:Float = (self as NSString).floatValue
        return CGFloat(myFloat);
    }
    var bs_locationDegree:CLLocationDegrees{
        return  CLLocationDegrees.init(self.bs_cgFloat()!);
    }
    func bs_widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    func bs_heightOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.height
    }
     var bs_html2AttributedString: NSAttributedString? {
        return Data(utf8).bs_html2AttributedString
    }
    var bs_html2String: String {
        return bs_html2AttributedString?.string ?? ""
    }
    func bs_height(withWidth width: CGFloat, font: UIFont) -> CGFloat {
        let maxSize = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let actualSize = self.boundingRect(with: maxSize, options: [.usesLineFragmentOrigin], attributes: [.font : font], context: nil)
        return actualSize.height
    }
     static func bs_numberClass(numberValue:Int,classNumber:Int)->String{
        var stringFormate="%0\(classNumber)d";
        var value =  String(format:stringFormate,numberValue);
        return value
    }
     static func bs_secondsToHoursMinutesSeconds(_ seconds:Double) -> (Double, Double, Double) {
        var tempSeconds = seconds;
        let (hr,  minf) = modf (tempSeconds / 3600)
        let (min, secf) = modf (60 * minf)
        return (hr, min, 60 * secf)
    }
     func bs_appendingPathComponent(_ path: String) -> String {
        let nsSt = self as NSString
        return nsSt.appendingPathComponent(path)
    }
     var localize_:String {
    return NSLocalizedString(self, comment:"")
    }
    var bs_double:Double?{
        return Double.init(self)
    }
    func bs_localized(_ language:String) ->String {
        if let path:String = Bundle.main.path(forResource: language, ofType: "lproj") , let bundle:Bundle = Bundle(path: path) {
        return NSLocalizedString(self, tableName: nil, bundle: bundle, value: "", comment: "")
        }else{return ""};
    }
    func bs_toDic()->[String:String]{
        var  dic:[String:String]=[String:String]();
        for object in self.components(separatedBy:",") {
            let components = object.components(separatedBy:"=")
            if let key:String = components.first ,
                let value:String = components.last{
                dic[key]=value;
                print(value)
            }
        }
        return dic;
    }
     func bs_matches(pattern: String) -> Bool {
           let regex = try! NSRegularExpression(
               pattern: pattern,
               options: [.caseInsensitive])
           return regex.firstMatch(
               in: self,
               options: [],
               range: NSRange(location: 0, length: utf16.count)) != nil
    }
     func bs_isValidURL() -> Bool {
        guard let url = URL(string: self) else { return false }
        if !UIApplication.shared.canOpenURL(url) {
            return false
        }

        let urlPattern = "^(http|https|ftp)\\://([a-zA-Z0-9\\.\\-]+(\\:[a-zA-Z0-9\\.&amp;%\\$\\-]+)*@)*((25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9])\\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[1-9]|0)\\.(25[0-5]|2[0-4][0-9]|[0-1]{1}[0-9]{2}|[1-9]{1}[0-9]{1}|[0-9])|localhost|([a-zA-Z0-9\\-]+\\.)*[a-zA-Z0-9\\-]+\\.(com|edu|gov|int|mil|net|org|biz|arpa|info|name|pro|aero|coop|museum|[a-zA-Z]{2}))(\\:[0-9]+)*(/($|[a-zA-Z0-9\\.\\,\\?\\'\\\\\\+&amp;%\\$#\\=~_\\-]+))*$"
        return self.bs_matches(pattern: urlPattern)
    }
     func bs_isValidEmail() -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
     mutating func bs_stripHTML() -> String {
        self = self.replacingOccurrences(of: "&ndash;", with: "-")
        self = self.replacingOccurrences(of: "&nbsp;", with: " ")
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: String.CompareOptions.regularExpression, range: nil)
    }
     func bs_matchingStrings(regex: String) -> [[String]] {
        guard let regex = try? NSRegularExpression(pattern: regex, options: []) else { return [] }
        let nsString = self as NSString
        let results  = regex.matches(in: self, options: [], range: NSMakeRange(0, nsString.length))
        return results.map { result in
            (0..<result.numberOfRanges).map { result.range(at: $0).location != NSNotFound
                ? nsString.substring(with: result.range(at: $0))
                : ""
            }
        }
    }
//    var isValidNumber:Bool{
//        var enteredText = Int(self)
//        if enteredText == nil{
//            return false
//        }
//        else{
//            return true
//        }
//    }
     var bs_locationDegrees:CLLocationDegrees?{
        if let itemString:String = self,
            let  item:CLLocationDegrees = CLLocationDegrees.init(itemString){
            return item;
        }
        return nil;
    }
     var bs_nsNumber:NSNumber?{
        if let doubleValue = Double.init(self) {
            return NSNumber(value:doubleValue);
        }
        return nil;
    }
     var bs_isRemoteFile:Bool{ if self.contains("http"){
        return true
        }
        return false
    }
}

/*    **UIImage**   */

public extension UIImage {
     func bs_flippedImage() -> UIImage {
        let image = self.withHorizontallyFlippedOrientation();
        return image
    }
     func bs_resizeImageWith(newSize: CGSize) -> UIImage {
        
        let horizontalRatio = newSize.width / size.width
        let verticalRatio = newSize.height / size.height
        
        let ratio = max(horizontalRatio, verticalRatio)
        let newSize = CGSize(width: size.width * ratio, height: size.height * ratio)
        UIGraphicsBeginImageContextWithOptions(newSize, true, 0)
        draw(in: CGRect(origin: CGPoint(x: 0, y: 0), size: newSize))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
     func bs_resized(withPercentage percentage: CGFloat) -> UIImage? {
        let canvasSize = CGSize(width: size.width * percentage, height: size.height * percentage)
        UIGraphicsBeginImageContextWithOptions(canvasSize, false, scale)
        defer { UIGraphicsEndImageContext() }
        draw(in: CGRect(origin: .zero, size: canvasSize))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}

/*    **UIImageView**   */

public extension UIImageView
{
    
     func bs_renderMode(_ renderingMode:UIImage.RenderingMode){
        let image: UIImage? = self.image?.withRenderingMode(renderingMode)
        self.image = image;
    }

     func bs_flipImage(){
        
        self.image = self.image?.imageFlippedForRightToLeftLayoutDirection();
    }
     func bs_flipImageViewWhenLang(direction:NSLocale.LanguageDirection){
        
        let langDirection:NSLocale.LanguageDirection = NSLocale.characterDirection(forLanguage:NSLocale.autoupdatingCurrent.languageCode!)
        
        if langDirection == direction {
            self.image=self.image?.imageFlippedForRightToLeftLayoutDirection()
        }
        
    }
     func bs_imageRespectLanguage(){
        if (UIApplication.shared.userInterfaceLayoutDirection == .rightToLeft){
            self.bs_flipImage();
        }
    }
     func bs_loadGifImage(url:URL,successHandler:((Data)->Void)?,errorHandler:((Error?)->Void)?){
        let fileName = url.lastPathComponent;
        var docURL = FileManager.default.urls(for: .documentDirectory, in: FileManager.SearchPathDomainMask.userDomainMask).last as? NSURL
        let diskPath = docURL?.appendingPathComponent(fileName)

        var localData:Data? = try? Data.init(contentsOf: diskPath!)
        if localData == nil {
            URLSession.shared.dataTask(with: url) { (data:Data?, urlResponse:URLResponse?,error:Error?) in
                if data != nil {
                    do {
                    try data!.write(to:diskPath!, options: [.atomicWrite])
                    } catch{
                        print(error);
                        print(error);

                    }
                    DispatchQueue.main.async {
                        successHandler?(data!)
                    }
                }else{
                    DispatchQueue.main.async {
                   errorHandler?(error)
                    }
                }
                }.resume();
        }else{
            successHandler?(localData!);
        }
    }
     func bs_loadGifImage(url:URL?,imageHandler: ((Data)->Void)?, placeHolderHandler:(()->Void)?){
        placeHolderHandler?();
        if url != nil {
        self.bs_loadGifImage(url: url!, successHandler: { (data:Data) in
            imageHandler?(data);
        }, errorHandler: { (error:Error?) in
            placeHolderHandler?();
        })
    }
   }
}

/*    **UITextField**   */

@IBDesignable
public extension UITextField {
    
    @IBInspectable var bs_paddingLeft: CGFloat {
        get {
            return leftView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            leftView = paddingView
            leftViewMode = .always
        }
    }
    @IBInspectable var bs_paddingRight: CGFloat {
        get {
            return rightView!.frame.size.width
        }
        set {
            let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: newValue, height: frame.size.height))
            rightView = paddingView
            rightViewMode = .always
        }
    }
func bs_subtractLargeFontWithInRange(subtractFontValueEveryWorlds:Float,miniFontRange:Float,maxFontRange:Float,fontSubtractionValue:Float){
    var newFont = UIFont.bs_subtractLargeFontWithInRange(subtractFontValueEveryWorlds: subtractFontValueEveryWorlds, numberOfWorlds: self.text!.bs_worldsCount.bs_float, currentFont: self.font!, miniFontRange: miniFontRange, maxFontRange: maxFontRange, fontSubtractionValue: fontSubtractionValue, lastCharacter:self.text?.last ?? " ")
    if newFont != nil {
        self.font = newFont!;
    }
}
}

/*    **UIButton**   */

public extension UIButton
{

    func bs_renderModeForImage(_ renderingMode:UIImage.RenderingMode,_ controlState:UIControl.State){
        let image = self.image(for: controlState)
        let renderImage: UIImage? = image?.withRenderingMode(renderingMode)
        self.setImage(renderImage, for: controlState);
    }
    func bs_renderModeForBackgroundImage(_ renderingMode:UIImage.RenderingMode,_ controlState:UIControl.State){
        let image = self.backgroundImage(for: controlState);
        let renderImage: UIImage? = image?.withRenderingMode(renderingMode)
        self.setImage(renderImage, for: controlState);
        self.setBackgroundImage(renderImage, for: controlState)
    }
    func bs_flipImageView(state:UIControl.State){
        self.setImage(self.imageView?.image?.imageFlippedForRightToLeftLayoutDirection(), for: state);
    }
    func bs_flipImageViewWhenLang(direction:NSLocale.LanguageDirection,state:UIControl.State){
        let langDirection:NSLocale.LanguageDirection = NSLocale.characterDirection(forLanguage:NSLocale.autoupdatingCurrent.languageCode!)
        if langDirection == direction {
            self.setImage(self.imageView?.image?.imageFlippedForRightToLeftLayoutDirection(), for: state);
        }
    }

    func UnderlineTextButton(title: String?, forState state: UIControl.State)
        {
            self.setTitle(title, for: .normal)
            self.setAttributedTitle(self.attributedString(), for: .normal)
        }

    private func attributedString() -> NSAttributedString? {
            let attributes = [
                NSAttributedString.Key.font :self.titleLabel?.font,
                NSAttributedString.Key.foregroundColor : self.titleColor(for: .normal),
                NSAttributedString.Key.underlineStyle : NSUnderlineStyle.single.rawValue
                ] as [NSAttributedString.Key : Any]
            let attributedString = NSAttributedString(string: self.currentTitle!, attributes: attributes)
            return attributedString
    }
    func bs_respectLanguageImage(_ controlState:UIControl.State){
        if (UIView.userInterfaceLayoutDirection(
            for: UIView.appearance().semanticContentAttribute) == .rightToLeft)  {
            self.setImage(self.image(for: controlState)!.bs_flippedImage(), for: controlState);
        }
    }
    func bs_respectLanguage(){
        if ( (UIView.userInterfaceLayoutDirection(
            for: UIView.appearance().semanticContentAttribute) == .rightToLeft) &&
            ( self.titleEdgeInsets.right > 0 || self.titleEdgeInsets.left > 0 ||
                self.imageEdgeInsets.right > 0 || self.imageEdgeInsets.left > 0 ||
                self.contentEdgeInsets.right > 0 || self.contentEdgeInsets.left > 0))
        {
            self.titleEdgeInsets.right =  self.titleEdgeInsets.right * -1;
            self.titleEdgeInsets.left =  self.titleEdgeInsets.left  * -1;
            
            self.imageEdgeInsets.right =  self.imageEdgeInsets.right * -1;
            self.imageEdgeInsets.left =  self.imageEdgeInsets.left * -1;
            
            self.contentEdgeInsets.right =  self.contentEdgeInsets.right * -1;
            self.contentEdgeInsets.left =  self.contentEdgeInsets.left * -1;
            
        }
    }
}

/*    **UIFont**   */

public extension UIFont
{
  class func bs_printFontFamilyNames(){
        UIFont.familyNames.sorted().forEach({ (familyName) in
            debugPrint(UIFont.fontNames(forFamilyName: familyName))
        })
    }

    static func bs_subtractLargeFontWithInRange(subtractFontValueEveryWorlds:Float,numberOfWorlds:Float,currentFont:UIFont,miniFontRange:Float,maxFontRange:Float,fontSubtractionValue:Float,lastCharacter:Character)->UIFont?{
                        if numberOfWorlds >= subtractFontValueEveryWorlds {
                            let currentFontSize:Float = currentFont.pointSize.bs_float ?? 0;
        
                            if  numberOfWorlds.bs_isItMultipleOf(multiplicityValue: subtractFontValueEveryWorlds) &&
                                (currentFontSize > miniFontRange) &&
                                (currentFontSize <= maxFontRange) &&
                                ((currentFontSize-fontSubtractionValue) > miniFontRange &&
                                lastCharacter != " ") {
                                let newFontSize = (currentFontSize-fontSubtractionValue);
                                return currentFont.withSize(CGFloat(newFontSize))
                        }
        
        
                        }else{
                            return currentFont.withSize(CGFloat(maxFontRange));
                        }
        return nil
    }

}
///

/*    **UITableView**   */

public extension UITableView
{
    func bs_registerNib(NibName: String) {
        self.register(UINib(nibName: NibName, bundle: nil), forCellReuseIdentifier: NibName)
    }
    
    func bs_reloadRows(indexPaths:[IndexPath])
    {
        self.performBatchUpdates({
            self.reloadRows(at: indexPaths, with: UITableView.RowAnimation.none);
        }, completion: nil);
    }
    
    func bs_deleteRows(indexPaths:[IndexPath])
    {
        self.performBatchUpdates({
        self.deleteRows(at: indexPaths, with:UITableView.RowAnimation.none);
        }, completion: nil);
    }
    func bs_deleteRow(indexPath:IndexPath){
        self.performBatchUpdates({
        self.deleteRows(at:[indexPath], with: UITableView.RowAnimation.none);
        }, completion: nil);
    }
    func bs_reloadRow(index:Int)
    {
        self.performBatchUpdates({
            self.reloadRows(at:[IndexPath.init(row: index, section: 0)], with: UITableView.RowAnimation.none);
        }, completion: nil);
    }

    func bs_reCaluclateHeaderViewHeight(){
        if let headerView = self.tableHeaderView {
            let height = headerView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize).height
            var headerFrame = headerView.frame
            
            //Comparison necessary to avoid infinite loop
            if height != headerFrame.size.height {
                headerFrame.size.height = height
                headerView.frame = headerFrame
                self.tableHeaderView = headerView
            }
        }
        
    }
}

/*    **UIViewController**   */

public extension UIViewController {
     func bs_share(text:String?,_ completionWithItemsHandler:UIActivityViewController.CompletionWithItemsHandler?){
         // text to share
         // set up activity view controller
         let textToShare = [ text ]
         let activityViewController = UIActivityViewController(activityItems: textToShare, applicationActivities: nil)
         activityViewController.popoverPresentationController?.sourceView = self.view // so that iPads won't crash
         
         // present the view controller
         self.present(activityViewController, animated: true, completion: nil)
         
         activityViewController.completionWithItemsHandler = completionWithItemsHandler;
    
     }
    func bs_presentRightToLeft(_ viewControllerToPresent: UIViewController) {
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromRight
        self.view.window!.layer.add(transition, forKey: kCATransition)
        
        present(viewControllerToPresent, animated: false)
    }
    
    func bs_dismissRightToLeft() {
        let transition = CATransition()
        transition.duration = 0.25
        transition.type = CATransitionType.push
        transition.subtype = CATransitionSubtype.fromLeft
        self.view.window!.layer.add(transition, forKey: kCATransition)
        
        dismiss(animated: false)
    }
    func bs_showMessageWithTitle(title:String,message:String?)
    {
        let alert = UIAlertController(title:title, message:message, preferredStyle:UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "تم", style:UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    @IBAction func bs_popViewController(_ sender: Any) {
        self.navigationController?.popViewController(animated: false);
    }
    
    @IBAction func bs_popViewControllerAnimated(_ sender: Any) {
        self.navigationController?.popViewController(animated: true);
    }
    
    @IBAction func bs_dismissViewController(_ sender: Any) {
        self.dismiss(animated: false, completion: nil);
        
    }
    @IBAction func bs_dismissViewControllerAnimated(_ sender: Any) {
        self.dismiss(animated: true, completion: nil);
    }
    func bs_presentPopUp(_ view:UIView,_ direction:UIPopoverArrowDirection? = nil,_ size:CGSize) {
        self.modalPresentationStyle = UIModalPresentationStyle.popover
        // set up the popover presentation controller
        self.popoverPresentationController?.permittedArrowDirections =  direction ?? UIPopoverArrowDirection.up
        self.popoverPresentationController?.delegate = self as! UIPopoverPresentationControllerDelegate
        self.popoverPresentationController?.sourceView = view  // button
        self.popoverPresentationController?.sourceRect = view.bounds
        if let size:CGSize=size {
        self.preferredContentSize = size
        }
        UIApplication.shared.bs_rootViewController?.present(self, animated: true, completion: nil);
    }
    static func generalPush(){
        if  let name:String = String(describing: self), let vc:UIViewController = UIStoryboard.bs_main?.instantiateViewController(withIdentifier:name) as? UIViewController{
            UIApplication.shared.bs_rootNavigationController?.pushViewController(vc, animated: true);
        }
    }
}

/*    **UIView**   */

public extension UIView{
    var bs_cornnerRaduisAspectRatio: CGFloat {
        set{
            self.layer.cornerRadius = (self.frame.height/2)*newValue
        }
        get{return -1;}
    }
}

/*    **NSLocale**   */

public extension NSLocale{
    static func bs_currentLangString(_ defaultEnString:String,_ arString:String)->String{
        let preferredLanguage = NSLocale.preferredLanguages[0]
        if preferredLanguage == "ar"{
            return arString;
        }
        else{
            return defaultEnString;
        }
    }
}

/*    **UILabel**   */

public extension UILabel {
// depend on language
    func bs_autoTextAliment(){
        let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789") //add whatever characters you find English
        var amountOfEnglishChars = 0
        var amountOfNonEnglishChars = 0
        if   self.text != nil && self.text!.count > 0 {
        for char in self.text!.unicodeScalars {
            if characterset.contains(char) {
                amountOfEnglishChars += 1
            }
            else {
                amountOfNonEnglishChars += 1
            }
        }
        }
        self.textAlignment = amountOfEnglishChars > amountOfNonEnglishChars ? .left : .right
    }
//    func bs_oppositeTextAlignment(){
//
//        if self.isRightToLeft {
//            self.textAlignment = .left
//        }else{
//            self.textAlignment = .right
//
//        }
//    }
    func bs_textHeight(withWidth width: CGFloat) -> CGFloat {
        guard let text = text else {
            return 0
        }
        return text.bs_height(withWidth: width, font: font)
    }
    func bs_attributedTextHeight(withWidth width: CGFloat) -> CGFloat {
        guard let attributedText = attributedText else {
            return 0
        }
        return attributedText.height(withWidth: width)
    }
    func bs_subtractLargeFontWithInRange(subtractFontValueEveryWorlds:Float,miniFontRange:Float,maxFontRange:Float,fontSubtractionValue:Float){
        var newFont = UIFont.bs_subtractLargeFontWithInRange(subtractFontValueEveryWorlds: subtractFontValueEveryWorlds, numberOfWorlds: self.text!.bs_worldsCount.bs_float, currentFont: self.font!, miniFontRange: miniFontRange, maxFontRange: maxFontRange, fontSubtractionValue: fontSubtractionValue, lastCharacter:self.text?.last ?? " ")
        if newFont != nil {
            self.font = newFont!;
        }
    }
}

/*    **SystemSoundID**   */

public extension SystemSoundID {
    static func bs_playFileNamed(fileName: String, withExtenstion fileExtension: String) {
        var sound: SystemSoundID = 0
        if let soundURL = Bundle.main.url(forResource: fileName, withExtension: fileExtension) {
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &sound)
            AudioServicesPlaySystemSound(sound)
        }
    }
}

/*    **Int**   */

public extension Int {
    var bs_isOdd:Bool{
        if ( self % 2 == 0) {
            return false;
            // remainder 0
        } else
        {
            return  true;
        }
    }
    var bs_int:Int{
        return Int.init(self);
    }
    var bs_float:Float{
        return  Float.init(self)
    }
    var bs_cgFloat:CGFloat{
        return  CGFloat.init(self)
    }
    var bs_double:Double{
        return  Double.init(self)
    }
    var bs_int8:Int8{
        return  Int8.init(self);
    }
    var bs_int16:Int16{
        return  Int16.init(self);
    }
    var bs_int64:Int64{
        return  Int64.init(self);
    }
    var bs_int32:Int32{
        return  Int32.init(self);
    }
    var bs_number:NSNumber{
        return  NSNumber.init(value: self);
    }
    var bs_cmTime:CMTime{
        return  CMTimeMakeWithSeconds(Double(self), preferredTimescale: 1)
    }
    var bs_inHundred:String{
        return String.bs_numberClass(numberValue: self, classNumber: 2);
    }
    var bs_inThousands:String{
        return String.bs_numberClass(numberValue: self, classNumber: 3);
    }
}

/*    **Int16**   */

public extension Int16
{
    var bs_int:Int
    {
        return Int.init(self);
    }
    var bs_float:Float{
        return  Float.init(self)
    }
    
    var bs_cgFloat:CGFloat{
        return  CGFloat.init(self)
    }
    
    var bs_double:Double{
        return  Double.init(self)
    }
    var bs_int8:Int8{
        return  Int8.init(self);
    }
    var bs_int32:Int32{
        return  Int32.init(self);
    }
    var bs_int64:Int64{
        return  Int64.init(self);
    }
    var bs_locationDegree:CLLocationDegrees{
        return  CLLocationDegrees.init(self);
    }
    var bs_string:String {
        return "\(self)"
    }
}

/*    **Int32**   */

public extension Int32{
    var bs_int:Int{
        return Int.init(self);
    }
    var bs_float:Float{
        return  Float.init(self)
    }
    var bs_cgFloat:CGFloat{
        return  CGFloat.init(self)
    }
    var bs_double:Double{
        return  Double.init(self)
    }
    var bs_int8:Int8{
        return  Int8.init(self);
    }
    var bs_int16:Int16{
        return  Int16.init(self);
    }
    var bs_int64:Int64{
        return  Int64.init(self);
    }
    var bs_locationDegree:CLLocationDegrees{
        return  CLLocationDegrees.init(self);
    }
    var bs_string:String {
        return "\(self)"
    }
}

/*    **Int64**   */

public extension Int64 {
    var bs_int:Int
    {
        return Int.init(self);
    }
    var bs_float:Float{
        return  Float.init(self)
    }
    
    var bs_cgFloat:CGFloat{
        return  CGFloat.init(self)
    }
    
    var bs_double:Double{
        return  Double.init(self)
    }
    var bs_int8:Int8{
        return  Int8.init(self);
    }
    var bs_int16:Int16{
        return  Int16.init(self);
    }
    var bs_int32:Int32{
        return  Int32.init(self);
    }
    var bs_number:NSNumber{
        return  NSNumber.init(value: self);
    }
    var bs_string:String {
        return "\(self)"
    }
}

/*    **CGFloat**   */

public extension CGFloat
{
    var bs_float:Float?{
        return Float.init(self);
    }
    public func bs_int() ->Int{
        return Int(self)
    }
    var bs_locationDegree:CLLocationDegrees{
        return  CLLocationDegrees.init(self);
    }
}

/*    **TimeInterval**   */

public extension TimeInterval {
    
    func bs_stringFromTimeInterval() -> String {
        let interval = Int(self)
        let seconds = interval % 60
        let minutes = (interval / 60) % 60
        let hours = (interval / 3600)
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}

/*    **NSNumber**   */

public extension NSNumber {
    static func isNumber(object:Any)->Bool{
        switch object {
        case is CGFloat: return true
        case is Float: return true
        case is Double: return true
        case is Int: return true
        case is UInt: return true
            
        default: return false;
        }
    }
}

/*    **Double**   */

public extension Double{
    var bs_int:Int?{
        return Int.init(self);
    }
    var bs_inHundred:String{
        return String.bs_numberClass(numberValue: self.bs_int ?? 0, classNumber: 2);
    }
    var bs_inThousands:String{
        return String.bs_numberClass(numberValue: self.bs_int ?? 0, classNumber: 3);
    }
    func bs_secondsToHoursMinutesSeconds() -> (Double, Double, Double) {
        return String.bs_secondsToHoursMinutesSeconds(self);
    }
    var bs_locationDegree:CLLocationDegrees{
        return  CLLocationDegrees.init(self);
    }
    var bs_duration:String {
        return String.bs_duration(self);
    }
    var bs_cmTime:CMTime {
        return  CMTimeMakeWithSeconds(self, preferredTimescale: 1)
    }
}

/*    **Float**   */

public extension Float{
     var bs_locationDegree:CLLocationDegrees{
        return  CLLocationDegrees.init(self);
    }
     var bs_cmTime:CMTime {
        return  CMTimeMakeWithSeconds(Double(self), preferredTimescale: 1)
    }
     var bs_double:Double {
        return Double(self)
    }
     var bs_int:Int {
        return Int.init(self);
    }
     static func  bs_isMultiple(number:Float,multiplicityValue:Float)->Bool{
        if number == 0 || multiplicityValue == 0 {
            return false;
        }
        if number.remainder(dividingBy: multiplicityValue) == 0 {
            return true;
        }
        return false;
    }
    func bs_isItMultipleOf(multiplicityValue:Float)->Bool{
        return Float.bs_isMultiple(number:self,multiplicityValue:multiplicityValue);
    }
}
/*    **Array**   */

public extension Array where Element == String {
     func bs_withSeperator(seperator:String) -> String{
        var tempText = "";
        for object in self {
            tempText = tempText+object+seperator;
        }
        if tempText.count > 1 {
            tempText.removeLast();
        }
        return tempText;
    }
}

public extension Array where Element == Int {
    public func bs_sum() -> Int{
        var total = 0;
        for object in self {
            total = total+object;
        }
  
        return total;
    }
}

/*    **UserDefaults**   */

public extension UserDefaults{
     var bs_appleLanguages:[String]{
        set{
            UserDefaults.standard.set(newValue, forKey: "AppleLanguages");
            UserDefaults.standard.synchronize();
        }
        get {
            var  temp = (UserDefaults.standard.object(forKey: "AppleLanguages") as! [String])
            UserDefaults.standard.synchronize();
            return temp;
        }
    }
     var bs_appleLanguage:String{
        set {
            UserDefaults.standard.set([newValue], forKey: "AppleLanguages");
            UserDefaults.standard.synchronize();
        }
        get {
            var  temp = (UserDefaults.standard.object(forKey: "AppleLanguages") as! [String])[0]
            UserDefaults.standard.synchronize();
            return temp;
        }
        
    }
}

/*    **CAShapeLayer**   */


public extension CAShapeLayer {
       @discardableResult func bs_path(_ path:UIBezierPath) -> Self{
        self.path = path.cgPath
            return self;
        }
       @discardableResult func bs_fillColor(_ fillColor:UIColor) -> Self{
            self.fillColor = fillColor.cgColor;
            return self;
        }

    @discardableResult func bs_shadowPath() -> Self{
        self.shadowPath = self.path
        return self;
    }
}

/*    **CALayer**   */

public extension CALayer {
   public var borderColor_: UIColor {
        get {
            return self.borderColor_
        }
        set {
            self.borderColor = newValue.cgColor
        }
    }
   @discardableResult  func bs_shadowColor(_ shadowColor:UIColor) -> Self{
        self.shadowColor = shadowColor.cgColor;
        return self;
    }
   @discardableResult  func bs_shadowPath(_ shadowPath:UIBezierPath) -> Self{
        self.shadowPath = shadowPath as! CGPath
        return self;
    }
    @discardableResult  func bs_shadowOffset(_ shadowOffset:CGSize) -> Self{
        self.shadowOffset = shadowOffset
        return self;
    }
    @discardableResult  func bs_shadowOpacity(_ shadowOpacity:Float) -> Self{
        self.shadowOpacity = shadowOpacity
        return self;
    }
    @discardableResult  func bs_shadowRadius(_ shadowRadius:CGFloat) -> Self{
        self.shadowRadius = shadowRadius
        return self;
    }
    @discardableResult  func bs_shouldRasterize(_ shouldRasterize:Bool) -> Self{
        self.shouldRasterize = shouldRasterize
        return self;
    }
    @discardableResult  func bs_masksToBounds(_ masksToBounds:Bool) -> Self{
        self.masksToBounds = masksToBounds
        return self;
    }
    @discardableResult  func bs_cornerRadius(_ cornerRadius:CGFloat) -> Self{
        self.cornerRadius = cornerRadius
        return self;
    }
    @discardableResult  func bs_borderWidth(_ borderWidth:CGFloat) -> Self{
        self.borderWidth = borderWidth
        return self;
    }
    @discardableResult  func bs_borderColor(_ borderColor:UIColor) -> Self{
        self.borderColor_ = borderColor
        return self;
    }
    //cornerRadius
}

/*    **CMTime**   */

public extension CMTime {
     var bs_duration:String {
        return String.bs_duration(self.seconds);
    }
     var bs_timeInterval:TimeInterval{
        return TimeInterval.init(self.seconds)
    }
     var bs_Int:Int?{
        return self.seconds.bs_int
    }
     var bs_Float:Float {
        
        return Float.init(self.value)
    }
}

/*    **AVPlayer**   */

public extension AVPlayer{
     var isPlaying: Bool {
        return rate != 0 && error == nil
    }
     var durationCMTime: CMTime? { return self.currentItem?.asset.duration}
     var duration: TimeInterval { return TimeInterval(self.currentItem?.asset.duration.seconds ?? 0)}

}

/*    **UIApplication**   */

public extension UIApplication {
    func bs_openSetting(){
        let settingsUrl = URL(string: UIApplication.openSettingsURLString)
        if settingsUrl != nil {
        UIApplication.shared.open(settingsUrl!)
        }
    }

   func bs_openYoutubeLink(_ stringUrl:String?){
        var schemaUrl = URL.init(string:"youtube://\(stringUrl ?? "")");
        if schemaUrl != nil {
            UIApplication.shared.open(schemaUrl!, options:[:]) { (value) in
                if value == false {
                    var httpsUrl = URL.init(string:"https://\(stringUrl ?? "")");
                    if httpsUrl != nil {
                        UIApplication.shared.open(httpsUrl!, options:[:]) { (value) in
                        }
                    }
                    
                }
            }
        }else{
            var httpsUrl = URL.init(string:"https://\(stringUrl ?? "")");
            if httpsUrl != nil {
                UIApplication.shared.open(httpsUrl!, options:[:]) { (value) in
                }
            }
        }
    }
    func bs_openSocialMediaAccounts(url:URL?){
        guard let urlSocialMedia = url else {
            UIApplication.shared.bs_rootViewController?.bs_showMessageWithTitle(title:"Common.Error".localize_, message: "Common.CantNotOpenLink".localize_)
            return
        }
        if url?.absoluteString.lowercased().contains("facebook.com") ?? false {
            self.bs_openFacebook(id: url!.lastPathComponent);
        }else
        if url?.absoluteString.lowercased().contains("linkedin.com") ?? false {
            self.bs_openLinkedIn(id:url!.lastPathComponent);
        }else
        if url?.absoluteString.lowercased().contains("twitter.com") ?? false {
            self.bs_openTwitter(name: url!.lastPathComponent);
        }else
        if url?.absoluteString.lowercased().contains("instagram.com") ?? false {
            self.bs_openInstegram(path: url!.path + "?" + url!.query!);
        }else{
            self.bs_openHttpLink(url);

        }
        
    }
    
    func bs_openFacebook(id:String?){
        guard let facebookUID = id else {
            UIApplication.shared.bs_rootViewController?.bs_showMessageWithTitle(title:"Common.Error".localize_, message: "Common.CantNotOpenLink".localize_)
            return
        }
        let fbURLWeb: URL = URL(string: "https://www.facebook.com/\(facebookUID)")!
        let fbURLID: URL = URL(string: "fb://profile/\(facebookUID)")!
        
        if(UIApplication.shared.canOpenURL(fbURLID)){
            // FB installed
            UIApplication.shared.open(fbURLID, options: [:], completionHandler: nil)
        } else {
            // FB is not installed, open in safari
            UIApplication.shared.open(fbURLWeb, options: [:], completionHandler: nil)
        }
    }
    func bs_openLinkedIn(id:String?){
        //https://www.linkedin.com/in/sari-kamail-eljamal-a866b2121/
        guard let linkedinUID = id else {
            UIApplication.shared.bs_rootViewController?.bs_showMessageWithTitle(title:"Common.Error".localize_, message: "Common.CantNotOpenLink".localize_)
            return
        }
        let linkedInURLWeb: URL = URL(string: "https://www.linkedin.com/in/\(linkedinUID)")!
        let linkedInURLID: URL = URL(string: "linkedin://profile/\(linkedinUID)")!
        
        if(UIApplication.shared.canOpenURL(linkedInURLID)){
            // FB installed
            UIApplication.shared.open(linkedInURLID, options: [:], completionHandler: nil)
        } else {
            // FB is not installed, open in safari
            UIApplication.shared.open(linkedInURLWeb, options: [:], completionHandler: nil)
        }
    }
    func bs_openTwitter(name:String?){
        //https://twitter.com/orta
        guard let twitterName = name else {
            UIApplication.shared.bs_rootViewController?.bs_showMessageWithTitle(title:"Common.Error".localize_, message: "Common.CantNotOpenLink".localize_)
            return
        }
        let twitterURLWeb: URL = URL(string: "https://twitter.com/\(twitterName)")!
        let twitterURLID: URL = URL(string: "twitter://profile/\(twitterName)")!
        
        if(UIApplication.shared.canOpenURL(twitterURLID)){
            // FB installed
            UIApplication.shared.open(twitterURLID, options: [:], completionHandler: nil)
        } else {
            // FB is not installed, open in safari
            UIApplication.shared.open(twitterURLWeb, options: [:], completionHandler: nil)
        }
    }
    
    func bs_openGooglePlus(path:String?){
        // https://plus.google.com/u/0/100711776131865357077
        // gplus://plus.google.com/u/0/100711776131865357077
        guard let pathString = path else {
            UIApplication.shared.bs_rootViewController?.bs_showMessageWithTitle(title:"Common.Error".localize_, message: "Common.CantNotOpenLink".localize_)
            return
        }
        let googlePlusURLWeb: URL = URL(string: "https://plus.google.com/u/0/\(pathString)")!
        let googlePlusURLID: URL = URL(string: "gplus:plus.google.com/u/0/\(pathString)")!
        
        if(UIApplication.shared.canOpenURL(googlePlusURLID)){
            // FB installed
            UIApplication.shared.open(googlePlusURLID, options: [:], completionHandler: nil)
        } else {
            // FB is not installed, open in safari
            UIApplication.shared.open(googlePlusURLWeb, options: [:], completionHandler: nil)
        }
    }
    func bs_openInstegram(path:String?){
        //https://www.instagram.com/shehabagency/?utm_source=ig_profile_share&igshid=3xmdz5ko8anq
        guard let pathString = path else {
            UIApplication.shared.bs_rootViewController?.bs_showMessageWithTitle(title:"Common.Error".localize_, message: "Common.CantNotOpenLink".localize_)
            return
        }
        let instagramURLWeb: URL = URL(string: "https://www.instagram.com/\(pathString)")!
        let instagramURLID: URL = URL(string: "instagram://www.instagram.com/\(pathString)")!
        
        if(UIApplication.shared.canOpenURL(instagramURLID)){
            // FB installed
            UIApplication.shared.open(instagramURLID, options: [:], completionHandler: nil)
        } else {
            // FB is not installed, open in safari
            UIApplication.shared.open(instagramURLWeb, options: [:], completionHandler: nil)
        }
    }

    func bs_openHttpLink(_ url:URL?){
        if let tempUrl:URL = url as? URL{
            self.bs_openHttpLink(url?.absoluteString) ;
        }else{
            
        }
    }
    
    func bs_openHttpLink(_ stringUrl:String?){
        if stringUrl != nil {
            var tempStringURL:String = stringUrl!;
            if stringUrl!.lowercased().hasPrefix("http") ||  stringUrl!.lowercased().hasPrefix("https") {
                
            }else{
                tempStringURL = "http://\(tempStringURL)"
            }
            
            guard let url = URL(string:tempStringURL) else {
                return //be safe
            }
            if UIApplication.shared.canOpenURL(url) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }else{
                UIApplication.shared.bs_rootViewController?.bs_showMessageWithTitle(title:"Common.Error".localize_, message:"Common.OpenUrlError".localize_);
            }
        }else{}
        
    }
    
    func bs_open(_ stringUrl:String?){
        if let tempStringUrl:String = stringUrl as? String {
            if let url:URL = URL.init(string:tempStringUrl) {
                self.bs_open(url);
            }else{
                
            }
        }

        
    }

    func bs_open(_ url:URL?){
        if url != nil {
            if UIApplication.shared.canOpenURL(url!) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(url!, options: [:], completionHandler: nil)
                }
            }
        }
    }

}

/*    **UITabBarController**   */

public extension UITabBarController{
    func bs_setViewController(vc: UIViewController,_ image: UIImage,_ selectedImage:UIImage) {

        vc.tabBarItem = UITabBarItem.init(title:nil, image: image, selectedImage: selectedImage);
        vc.title="";
        vc.tabBarItem.imageInsets=UIEdgeInsets.zero;
        if   self.viewControllers != nil {
        self.viewControllers!.append(vc)
        }else{
            self.viewControllers = [vc];
        }
    }
    func bs_setViewController(index:Int,vc: UIViewController,_ image: UIImage,_ selectedImage:UIImage) {
        
        vc.tabBarItem = UITabBarItem.init(title:nil, image: image, selectedImage: selectedImage);
        vc.title="";
        vc.tabBarItem.imageInsets=UIEdgeInsets.zero;
        if   self.viewControllers != nil {
            self.viewControllers?.insert(vc, at: index);
        }else{
            self.viewControllers = [vc];
        }
    }
    
}

/*    **UINavigationController**   */

public extension  UINavigationController {
    func bs_popViewControllerTo(vc:UIViewController.Type){
        for controller in self.viewControllers {
            if controller.isKind(of: vc) {
                self.popToViewController(controller, animated: true)
                break
            }
        }
    }
}

/*    **UIColor**   */

public extension UIColor {
    class var bs_random: UIColor {
        let red:CGFloat = CGFloat(drand48())
        let green:CGFloat = CGFloat(drand48())
        let blue:CGFloat = CGFloat(drand48())
        
        return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
        
    }
    var bs_isLight: Bool {
        guard let components = cgColor.components, components.count > 2 else {return false}
        let brightness = ((components[0] * 299) + (components[1] * 587) + (components[2] * 114)) / 1000
        return (brightness > 0.5)
        
    }
}

/*    **URLComponents**   */

public extension URLComponents {
    func parameter(paramKey: String) -> String? {
        return self.queryItems?.first(where: { $0.name == paramKey })?.value
    }
}

/*    **MPNowPlayingInfoCenter**   */

public extension MPNowPlayingInfoCenter
{
       var bs_propertyTitleRemoteControl:String?{
        set{
            self.nowPlayingInfo![MPMediaItemPropertyTitle] = newValue as Any
        }
        get{
            
            return ((self.nowPlayingInfo != nil)&&(self.nowPlayingInfo![MPMediaItemPropertyTitle] != nil)   ? self.nowPlayingInfo![MPMediaItemPropertyTitle] as? String  : nil)
        }
    }
    private(set)  var bs_propertyArtistRemoteControl:String?{
        set{
            self.nowPlayingInfo![MPMediaItemPropertyArtist] = newValue as Any
        }
        get{
            return ((self.nowPlayingInfo != nil)&&(self.nowPlayingInfo![MPMediaItemPropertyArtist] != nil)   ? self.nowPlayingInfo![MPMediaItemPropertyArtist] as? String  : nil)
            
        }
    }
    
     var bs_propertyArtWorkRemoteControl:UIImage?{
        set{
            var art = MPMediaItemArtwork(image: newValue as! UIImage)
            if #available(iOS 10.0, *) {
                art = MPMediaItemArtwork(boundsSize: CGSize(width: 200, height: 200)) { (size) -> UIImage in
                    if newValue != nil{
                        return newValue!;
                    }else{
                        return UIImage.init()
                    }
                }
            }
            
            self.nowPlayingInfo![MPMediaItemPropertyArtwork] = art as Any
        }
        get{
            if self.nowPlayingInfo == nil {
                return nil;
            }
            return (self.nowPlayingInfo![MPMediaItemPropertyArtwork] as! MPMediaItemArtwork).image(at:  CGSize(width: 200, height: 200))
        }
    }
      var bs_propertyPlaybackDurationRemoteControl:TimeInterval?{
        set{
            self.nowPlayingInfo![MPMediaItemPropertyPlaybackDuration] = newValue as Any
        }
        get{
            return ((self.nowPlayingInfo != nil)&&(self.nowPlayingInfo![MPMediaItemPropertyPlaybackDuration] != nil)   ? self.nowPlayingInfo![MPMediaItemPropertyPlaybackDuration] as? TimeInterval  : nil)
        }
    }
      var bs_propertyElapsedPlaybackTimeRemoteControl:TimeInterval?{
        set{
            self.nowPlayingInfo![MPNowPlayingInfoPropertyElapsedPlaybackTime] = newValue as Any
        }
        get{
            
            return ((self.nowPlayingInfo != nil)&&(self.nowPlayingInfo![MPNowPlayingInfoPropertyElapsedPlaybackTime] != nil)   ? self.nowPlayingInfo![MPNowPlayingInfoPropertyElapsedPlaybackTime] as? TimeInterval  : nil)
        }
    }
}

/*    **FloatingPoint**   */

public extension FloatingPoint{
    func bs_fixedFraction(digits: Int) -> String {
        return String(format: "%.\(digits)f", self as! CVarArg)
    }
}

public extension Hashable where Self: AnyObject {
     var bs_isDictionary:Bool {
        if self is Dictionary<AnyHashable,Any> {
            return true
        }
        return false
    }
     var bs_isArray:Bool {
        if self is Dictionary<AnyHashable,Any> {
            return true
        }
        return false
    }
}
public extension Hashable where Self: Any {
    var bs_isDictionary:Bool {
        if self is Dictionary<AnyHashable,Any> {
            return true
        }
        return false
    }
    var bs_isArray:Bool {
        if self is Dictionary<AnyHashable,Any> {
            return true
        }
        return false
    }
}

/*    **Data**   */

public extension Data {
     var bs_html2AttributedString: NSAttributedString? {
        do {
            return try NSAttributedString(data: self, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding: String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            print("error:", error)
            return  nil
        }
    }
    var bs_html2String: String {
        return bs_html2AttributedString?.string ?? ""
    }
    // used to convert device token from data to base 64 string
    var bs_64String:String{
        var token:String = "";
        for i in 0..<self.count {
            token = token + String(format: "%02.2hhx", arguments: [self[i]])
        }
        return token;
    }
 
}

/*    **NSAttributedString**   */

public extension NSAttributedString {
     func height(withWidth width: CGFloat) -> CGFloat {
        let maxSize = CGSize(width: width, height: CGFloat.greatestFiniteMagnitude)
        let actualSize = boundingRect(with: maxSize, options: [.usesLineFragmentOrigin], context: nil)
        return actualSize.height
    }
}

/*    **UITextView**   */

public extension UITextView {
     func bs_subtractLargeFontWithInRange(subtractFontValueEveryWorlds:Float,miniFontRange:Float,maxFontRange:Float,fontSubtractionValue:Float){
        var newFont = UIFont.bs_subtractLargeFontWithInRange(subtractFontValueEveryWorlds: subtractFontValueEveryWorlds, numberOfWorlds: self.text!.bs_worldsCount.bs_float ?? 0, currentFont: self.font!, miniFontRange: miniFontRange, maxFontRange: maxFontRange, fontSubtractionValue: fontSubtractionValue, lastCharacter:self.text.last ?? " ")
        if newFont != nil {
            self.font = newFont!;
        }
    }
}

public extension DateFormatter {
    public enum Symbols: String, CustomStringConvertible {
    //example year=1995
    //example month=12
    //example day=09
    //example dayShorNumber=9
    //example hour=01
    //example hourShorNumber=1
    //example minute=55
    //example second=59
    //example clock12=am or am=pm
    //example monthName=September
    //example monthShorName=Sep
    //example weekday=Wednesday
    //example weekdayShortName=Wed
    //example timezone=+0000
    case year = "yyyy"
    case month = "MM"
    case day = "dd"
    case dayShorNumber = "d"
    case hour24System = "HH"
    case hour12System = "hh"
    case hourShorNumber24System = "H"
    case hourShorNumber12System = "h"
    case minute = "mm"
    case minuteShorNumber = "m"
    case second = "ss"
    case clock12 = "a"
    case monthName = "MMMM"
    case monthShorName = "MMM"
    case weekdayName = "EEEE"
    case weekdayShortName = "E"
    case timezone = "Z"
    public var description: String {
        return self.rawValue
    }
}
}

/*    **UICollectionView**   */

public extension UICollectionView{
     func bs_reloadItems(indexPaths:[IndexPath]){
        self.performBatchUpdates({
            self.reloadItems(at: indexPaths)
        }, completion: nil);
    }
     func bs_reloadData(indexPath:IndexPath){
        self.performBatchUpdates({
            self.reloadItems(at:[indexPath])
        }, completion: nil);
    }
     func bs_reloadItem(index:Int){
        self.performBatchUpdates({
            self.reloadItems(at:[IndexPath.init(row: index, section: 0)])
        }, completion: nil);

    }
}

/*    **FileManager**   */

public extension FileManager {
     func bs_writeToFile(_ searchPathDirectory:SearchPathDirectory = .documentDirectory,fileName:String,fileData:Data,completionHandler:(URL?)->Void){
        do {
            let fm = FileManager.default
            guard let docUrl = fm.urls(for:searchPathDirectory, in: .userDomainMask).first else {
                print("Unable to reach the documents folder")
                return
            }
            //fileName=test.mp4
            let localUrl = docUrl.appendingPathComponent(fileName);
            try fileData.write(to: localUrl)
            completionHandler(localUrl)
        } catch  {
            completionHandler(nil)
            print("could not save data")
        }
    }
    func bs_urls(for directory: FileManager.SearchPathDirectory, skipsHiddenFiles: Bool = true ) -> [URL]? {
        let documentsURL = urls(for: directory, in: .userDomainMask)[0]
        let fileURLs = try? contentsOfDirectory(at: documentsURL, includingPropertiesForKeys: nil, options: skipsHiddenFiles ? .skipsHiddenFiles : [] )
        return fileURLs
    }
        // folder/subfolder/subfolder
    func bs_createFolder(_ documentDirectory:SearchPathDirectory = .documentDirectory,folderName: String) -> URL? {
            let fileManager = FileManager.default
            // Get document directory for device, this should succeed
            if let documentDirectory = fileManager.urls(for:documentDirectory,
                                                        in: .userDomainMask).first {
                // Construct a URL with desired folder name
                let folderURL = documentDirectory.appendingPathComponent(folderName)
                // If folder URL does not exist, create it
                if !fileManager.fileExists(atPath: folderURL.path) {
                    do {
                        // Attempt to create folder
                        try fileManager.createDirectory(atPath: folderURL.path,
                                                        withIntermediateDirectories: true,
                                                        attributes: nil)
                    } catch {
                        // Creation failed. Print error & return nil
                        print(error.localizedDescription)
                        return nil
                    }
                }
                // Folder either exists, or was created. Return URL
                return folderURL
            }
            // Will only be called if document directory not found
            return nil
        }
}

public extension Array where Element == PHAsset {
     func bs_dataPhotos() -> [Data]{
        let manager = PHImageManager.default()
        let option = PHImageRequestOptions()
        option.isSynchronous = true
        option.isNetworkAccessAllowed=false;
        option.deliveryMode = .highQualityFormat;
        
        var tempArray:[Data] = [Data]();
        for asset in self
        {
            manager.requestImageData(for: asset, options: option, resultHandler: { (data:Data?, string:String?, orientation:UIImage.Orientation, info:[AnyHashable:Any]?) in
                tempArray.append(data!)
                
            })
            
            
            
        }
        
        return tempArray;
    }
    
    func bs_photos() -> [UIImage]{
        let manager = PHImageManager.default()
        let option = PHImageRequestOptions()
        option.isSynchronous = true
        option.isNetworkAccessAllowed=false;
        option.deliveryMode = .highQualityFormat;
        
        var tempArray:[UIImage] = [UIImage]();
        for asset in self
        {
            manager.requestImage(for: asset, targetSize: CGSize.zero, contentMode: .default, options: option) { (img:UIImage?, info:[AnyHashable:Any]?) in
                tempArray.append(img!)

            }
            
            
            
        }
        
        return tempArray;
    }
}

/*    **PHAsset**   */

public extension PHAsset {
    func bs_photo(photoHanlder:@escaping (UIImage?)->Void){
        
        let manager = PHImageManager.default()
        let option = PHImageRequestOptions()
        //option.isSynchronous = true
        option.isNetworkAccessAllowed=false;
        option.deliveryMode = .highQualityFormat;
        
        manager.requestImage(for: self, targetSize: CGSize.zero, contentMode: .default, options: option) { (img:UIImage?, info:[AnyHashable:Any]?) in
            photoHanlder(img);
            
        }
    }
    func bs_photoData(dataHandler:@escaping (Data?)->Void){
        let manager = PHImageManager.default()
        let option = PHImageRequestOptions()
        //option.isSynchronous = true
        option.isNetworkAccessAllowed=false;
        option.deliveryMode = .highQualityFormat;
        manager.requestImageData(for: self, options: option, resultHandler: { (data:Data?, string:String?, orientation:UIImage.Orientation, info:[AnyHashable:Any]?) in
            dataHandler(data)
        })
    }
    func bs_videoData(dataHandler:@escaping (Data?)->Void){
        guard (self.mediaType == .video) else {
            print("Not a valid video media type")
            dataHandler(nil);
            return
        }
        PHImageManager.default().requestAVAsset(forVideo: self, options: nil) { (asset, audioMix, args) in
                   DispatchQueue.main.async {

            if var urlAsset:AVURLAsset = asset as? AVURLAsset {
                    do {
                            var data = try Data.init(contentsOf: urlAsset.url);
                            
                        dataHandler(data);
                    }catch{
                        dataHandler(nil);

                    }
            }else{ dataHandler(nil); }
                 }

        }
    }
    func bs_openVideoData(presenter:UIViewController){
        guard (self.mediaType == .video) else {
            print("Not a valid video media type")
            return
        }
      PHImageManager.default().requestAVAsset(forVideo: self, options: nil) { (asset, audioMix, args) in
                    DispatchQueue.main.async {
                        if var urlAsset:AVURLAsset = asset as? AVURLAsset {
                            let player = AVPlayer.init(playerItem: AVPlayerItem.init(asset: urlAsset))
                            let playerViewController = AVPlayerViewController()
                            playerViewController.player = player
                            presenter.present(playerViewController, animated: true) {
                                playerViewController.player!.play()
                            }
                        }
                
                    }

        }
    }
}

public extension PHFetchResult where ObjectType == PHAsset {
    open var objects: [ObjectType] {
        var _objects: [ObjectType] = []
        enumerateObjects { (object, _, _) in
            _objects.append(object)
        }
        return _objects
    }
}
public extension PHFetchResult where ObjectType == PHCollection {
    open var objects: [ObjectType] {
        var _objects: [ObjectType] = []
        enumerateObjects { (object, _, _) in
            _objects.append(object)
        }
        return _objects
    }
}
public extension PHFetchResult where ObjectType == PHAssetCollection {
    open var objects: [ObjectType] {
        var _objects: [ObjectType] = []
        enumerateObjects { (object, _, _) in
            _objects.append(object)
        }
        return _objects
    }
}

/*    **PHPhotoLibrary**   */

public extension PHPhotoLibrary {

     class func bs_creationRequestForAssetFromVideo(atFileURL:URL,completionHandler:@escaping (Bool,AVURLAsset?,Error?)->Void){
        
        PHPhotoLibrary.shared().performChanges({
            PHAssetChangeRequest.creationRequestForAssetFromVideo(atFileURL:atFileURL);
        }) { saved, error in
            if saved {
                let fetchOptions = PHFetchOptions()
                fetchOptions.sortDescriptors = [NSSortDescriptor(key: "creationDate", ascending: true)]
                // After uploading we fetch the PHAsset for most recent video and then get its current location url
                let fetchResult = PHAsset.fetchAssets(with: .video, options: fetchOptions).lastObject
                PHImageManager().requestAVAsset(forVideo: fetchResult!, options: nil, resultHandler: { (avurlAsset, audioMix, dict) in
                    completionHandler(saved,avurlAsset as? AVURLAsset,nil)
                    // This is the URL we need now to access the video from gallery directly.
                })
            }else{
                completionHandler(false,nil,nil)
            }
        }
    }

     class func bs_creationRequestForAssetFromVideo(data:Data,completionHandler:@escaping (Bool,AVURLAsset?,Error?)->Void){
        FileManager.default.bs_writeToFile(fileName:"test.mp4", fileData: data) { (atFileURL:URL?) in
            if atFileURL != nil {
                PHPhotoLibrary.bs_creationRequestForAssetFromVideo(atFileURL: atFileURL!, completionHandler: { (saved:Bool,avurlasset:AVURLAsset?, error:Error?) in
                    completionHandler(saved,avurlasset,error);
                })
            }else{
                completionHandler(false,nil,nil);
            }
        }
    }

    class func bs_checkPhotoLibraryAuthorization(authorized:(()->Void)?,unAuthorized:(()->Void)?){
        let status = PHPhotoLibrary.authorizationStatus()
        
        if (status == PHAuthorizationStatus.authorized) {
            // Access has been granted.
            //      getPhotosAndVideos()
            authorized?();
        }else {
            PHPhotoLibrary.requestAuthorization({ (newStatus) in
                if (newStatus == PHAuthorizationStatus.authorized) {
                    //   self.getPhotosAndVideos()
                    authorized?();
                }else {
                    unAuthorized?();
                }
            })
        }
    }
    
}

/*    **UIAlertController**   */

public extension UIAlertController {
    class func bs_showActionSheet(viewController: UIViewController, title: String, message: String, actions: [(String, UIAlertAction.Style)], completion: @escaping (_ index: Int) -> Void) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
        for (index, (title, style)) in actions.enumerated() {
            let alertAction = UIAlertAction(title: title, style: style) { (_) in
                completion(index)
            }
            alertViewController.addAction(alertAction)
        }
        viewController.present(alertViewController, animated: true, completion: nil)
    }
    class func bs_showActionSheet(viewController:UIViewController?=UIApplication.shared.bs_rootViewController,title:String,message:String,cancel:String,objects:[Any]?,converter:(Any)->String,selectHandler:@escaping (Int,Any)->Void,canceldHandler:(()->Void)?){
        var actions: [(String, UIAlertAction.Style)] = []
        for object in objects ?? [] {
            actions.append((converter(object), UIAlertAction.Style.default))
        }
        actions.append((cancel, UIAlertAction.Style.cancel))
        UIAlertController.bs_showActionSheet(viewController:viewController!, title:title, message:message, actions: actions) { (index) in
            if index == objects?.count ?? 0 {
                // click cancel button
                canceldHandler?()
            }else{
                let selectedObject = objects?[index];
                selectHandler(index,selectedObject);
            }
        }
    }
}

/*    **Date**   */

public extension Date {
    func bs_startOfMonth() -> Date {
        return Calendar.current.date(from: Calendar.current.dateComponents([.year, .month], from: Calendar.current.startOfDay(for: self)))!
    }
    func bs_endOfMonth() -> Date {
        return Calendar.current.date(byAdding: DateComponents(month: 1, day: -1), to: self.bs_startOfMonth())!
    }
    
    static func bs_daysInThisMonth(date:Date)-> [Date]{
        return Date.bs_dates(from: date.bs_startOfMonth(), to: date.bs_endOfMonth());
    }
    static func bs_dates(from fromDate: Date, to toDate: Date) -> [Date] {
        var dates: [Date] = []
        var date = fromDate
        
        while date <= toDate {
            dates.append(date)
            guard let newDate = Calendar.current.date(byAdding: .day, value: 1, to: date) else { break }
            date = newDate
        }
        return dates
    }
    static var bs_yesterday: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: Date().bs_noon)!
    }
    static var bs_tomorrow: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: Date().bs_noon)!
    }
    var bs_dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: bs_noon)!
    }
    var bs_dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: bs_noon)!
    }
    var bs_noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var bs_month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var bs_isLastDayOfMonth: Bool {
        return bs_dayAfter.bs_month != bs_month
    }
}

/*    **UNNotificationSoundName**   */

public extension UNNotificationSoundName{
 var bs_sound:UNNotificationSound{
        return UNNotificationSound(named: self);
    }
}

/*    **NSObject**   */

public extension NSObject{
  func AudioServicesPlaySystemSound(fileName:String,fileType:String)->SystemSoundID? {
        var soundID: SystemSoundID = 0
        if  let filePath:String = Bundle.main.path(forResource: fileName, ofType:fileType),
            let url:NSURL = NSURL(fileURLWithPath: filePath) {
            AudioServicesCreateSystemSoundID(url, &soundID)
            AudioToolbox.AudioServicesPlaySystemSound(soundID)
        }else{
        print("AudioServicesPlaySystemSound can't play")}
        
        return soundID;
    }
 var bs_NSNumber:NSNumber?{
        if let item:NSNumber = self as? NSNumber{
            return item;
        }
        return nil;
    }
  var bs_Int:Int?{
        if let item:Int = self.bs_NSNumber?.intValue{
            return item;
        }
        return nil;
    }
  var bs_Double:Double?{
        if let item:Double = self.bs_NSNumber?.doubleValue{
            return item;
        }
        return nil;
    }
  var bs_Float:Float?{
        if let item:Float = self.bs_NSNumber?.floatValue{
            return item;
        }
        return nil;
    }
  var bs_String:String?{
        if let item:String = self as? String{
            return item;
        }
        return nil;
    }
}

/*    **Dictionary**   */

public extension Dictionary {
    mutating func bs_merge(dict: [Key: Value]){
        for (k, v) in dict {
            updateValue(v, forKey: k)
        }
    }
    static func bs_initDicFromJson(text: String) -> [String:String]? {
        if let data:Data = text.data(using: String.Encoding.utf8) {
            do {
            let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves) as? [String:String]
            return json
            } catch{
                return nil;
            }
        }
        return nil
    }
}

public protocol Copying {
    init(original: Self)
}

public extension Copying {
   public func copy() -> Self {
        return Self.init(original: self)
    }
}
public extension Array where Element: Copying {
    func clone() -> Array {
        var copiedArray = Array<Element>()
        for element in self {
            copiedArray.append(element.copy())
        }
        return copiedArray
    }
}

/*    **UIApplication**   */

public extension UIApplication{
    var bs_rootNavigationController:UINavigationController?{
      return UIApplication.shared.windows.first?.rootViewController as? UINavigationController;
    }
    var bs_rootViewController:UIViewController?{
      return UIApplication.shared.windows.first?.rootViewController as? UIViewController;
    }
}

public extension UILabel {
    var bs_numberOfVisibleLines: Int {
        let textSize = CGSize(width: CGFloat(self.frame.size.width), height: CGFloat(MAXFLOAT))
        let rHeight: Int = lroundf(Float(self.sizeThatFits(textSize).height))
        let charSize: Int = lroundf(Float(self.font.pointSize))
        return rHeight / charSize
    }
}
public extension UIResponder {
    func bs_getParentViewController() -> UIViewController? {
        if self.next is UIViewController {
            return self.next as? UIViewController
        } else {
            if self.next != nil {
                return (self.next!).bs_getParentViewController()
            }
            else {return nil}
        }
    }
}
public extension UIStoryboard {
 static let bs_main : UIStoryboard? = UIStoryboard(name: "HisnMuslim", bundle: nil);
}






