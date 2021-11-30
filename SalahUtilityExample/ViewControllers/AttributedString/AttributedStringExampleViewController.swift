//
//  AttributedStringExampleViewController.swift
//  SalahUtilityExample
//
//  Created by Salah on 8/30/21.
//  Copyright © 2021 Salah. All rights reserved.
//

import UIKit
extension String {
    func ranges<S: StringProtocol>(of string: S, options: String.CompareOptions = []) -> [Range<Index>] {
        var result: [Range<Index>] = []
        var startIndex = self.startIndex
        while startIndex < endIndex,
            let range = self[startIndex...]
                .range(of: string, options: options) {
                result.append(range)
                startIndex = range.lowerBound < range.upperBound ? range.upperBound :
                    index(range.lowerBound, offsetBy: 1, limitedBy: endIndex) ?? endIndex
        }
        return result
    }
}
extension NSMutableAttributedString{
    func target(_ stringValue:String,
                _ stringAttributes:[NSAttributedString.Key:Any])->NSMutableAttributedString?{
        var initialMutableAttributed = self
        
        for range in initialMutableAttributed.string.ranges(of: stringValue){
            let nsRange = NSRange(range, in: initialMutableAttributed.string)
                // Replace content in range with the new content
                let newAttributedString = NSMutableAttributedString(string: stringValue, attributes: stringAttributes)
                initialMutableAttributed.replaceCharacters(in: nsRange, with: newAttributedString)
        }
        
    return initialMutableAttributed
    }
}
class AttributedStringExampleViewController: UIViewController {
    @IBOutlet weak var lblContent:UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        let initialString = "This is the initial string initial"
        let attributes = [NSAttributedString.Key.foregroundColor : UIColor.red]
        let mutableAttributedString = NSMutableAttributedString(string: initialString, attributes: attributes)
             
        
        
        self.lblContent.attributedText = mutableAttributedString.target("initial",  [NSAttributedString.Key.underlineStyle : NSUnderlineStyle.single.rawValue])
//
//        // Set new attributed string
//        let newString = "new"
//        let newAttributes = [NSAttributedString.Key.underlineStyle : NSUnderlineStyle.single.rawValue]
//        let newAttributedString = NSMutableAttributedString(string: newString, attributes: newAttributes)
//
//        // Get range of text to replace
//        guard let range = mutableAttributedString.string.range(of: "initial") else { return }
//        let nsRange = NSRange(range, in: mutableAttributedString.string)
//
//        // Replace content in range with the new content
//        mutableAttributedString.replaceCharacters(in: nsRange, with: newAttributedString)
//
//        lblContent.attributedText = mutableAttributedString;
//        // Do any additional setup after loading the view.
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
