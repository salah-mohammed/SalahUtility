//
//  LanguageManager.swift
//  SalahUtility
//
//  Created by SalahMohamed on 19/08/2023.
//  Copyright © 2023 Salah. All rights reserved.
//

import UIKit
import AppTexts
public class LanguageManager: NSObject {
    public var languageList:[LanguageItem]{
        var languageList:[LanguageItem]=[LanguageItem]();
        let languagesCodes = Bundle.main.localizations
        for languageCode in languagesCodes {
            if let name = LanguageManager.nameFor(languageCode) {
                let item = LanguageItem.init(languageCode:languageCode,name:name)
                languageList.append(item)
            }
        }
        return languageList
    }
    
    func showAlert(_ viewController:UIViewController){
        let items = languageList;
        let selectHandler:(Int,Any)->Void = { index,object in

            
            Alert.show(viewController,.yesOrNo(AppTexts.Constant.alertTitleChangeLanguage.string,
                                               AppTexts.Constant.subTitleChangeLanguage.string,
                                               yes:(nil,{ _, _ in
                if let languageCode:String = (object as? LanguageItem)?.languageCode{
                    UserDefaults.standard.bs_appleLanguage = languageCode
                    exit(0);
                }
            }), no:(nil,{ _, _ in
                
            })))
        }
        let converter:(Any)->String = { object in
            (object as? LanguageItem)?.name ?? ""
        }
        UIAlertController.bs_showActionSheet(sender:viewController.view,
                                             title:AppTexts.Constant.choose.string,
                                             message:AppTexts.Constant.appLanguage.string,
                                             cancel:AppTexts.Constant.cancel.string,
                                             objects:items,
                                             converter:converter,
                                             selectHandler:selectHandler,
                                             canceldHandler:nil)
    }
    static func nameFor(_ languageCode:String)->String?{
         let loc = Locale(identifier: languageCode)
         return loc.localizedString(forLanguageCode:languageCode)
    }
}
public class LanguageItem:NSObject{
    var languageCode:String?
    var name:String?
    public init(languageCode:String) {
        self.languageCode = languageCode
        self.name=LanguageManager.nameFor(languageCode)
    }
     init(languageCode: String? = nil,name:String?) {
        self.languageCode = languageCode
        self.name=name;
    }
}
