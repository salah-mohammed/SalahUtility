//
//  LanguageManager.swift
//  SalahUtility
//
//  Created by SalahMohamed on 19/08/2023.
//  Copyright © 2023 Salah. All rights reserved.
//

#if os(iOS)
import UIKit
#endif
import AppTexts
public class LanguageManager: NSObject {
    public var allLanguages:[LanguageObject]{
        var languageList:[LanguageObject]=[LanguageObject]();
        let languagesCodes = Bundle.main.localizations
        for languageCode in languagesCodes {
            if let name = LanguageManager.nameFor(languageCode) {
                let item = LanguageObject.init(languageCode:languageCode,name:name)
                languageList.append(item)
            }
        }
        return languageList
    }
    public var languagesExecludeCurrent:[LanguageObject]{
        return allLanguages.filter({!$0.isEqualLanguageOnly(currentLanguage)});
    }
    public var currentLanguage:LanguageObject{
        return LanguageObject.init(languageCode:UserDefaults.standard.bs_appleLanguage)
    }
#if os(iOS)
    public func showAlert(_ viewController:UIViewController?){
        let items = languagesExecludeCurrent
        let selectHandler:(Int,Any)->Void = { index,object in
            let message = [AppTexts.Constant.alertTitleChangeLanguage.string,AppTexts.Constant.subTitleChangeLanguage.string]
            AppAlert.show(viewController,.yesOrNo(AppTexts.Constant.appLanguage.string,
                                               message.joined(separator:", "),
                                               yes:(nil,{ _, _ in
                if let languageCode:String = (object as? LanguageObject)?.languageCode{
                    UserDefaults.standard.bs_appleLanguage = languageCode
                    exit(0);
                }
            }), no:(nil,{ _, _ in
                
            })))
        }
        let converter:(Any)->String = { object in
            (object as? LanguageObject)?.name ?? ""
        }
        if let vc = AppAlert.viewController ?? viewController{
            UIAlertController.bs_showActionSheet(sender:vc.view,
                                                 title:AppTexts.Constant.choose.string,
                                                 message:AppTexts.Constant.appLanguage.string,
                                                 cancel:AppTexts.Constant.cancel.string,
                                                 objects:items,
                                                 converter:converter,
                                                 selectHandler:selectHandler,
                                                 canceldHandler:nil)
        }
    }
#endif
    public static func nameFor(_ languageCode:String)->String?{
         let loc = Locale(identifier: languageCode)
         return loc.localizedString(forLanguageCode:languageCode)
    }
}
public class LanguageObject:NSObject{
   public var languageCode:String?
   public var name:String?
    public init(languageCode:String) {
        self.languageCode = languageCode
        self.name=LanguageManager.nameFor(languageCode)
    }
     init(languageCode: String? = nil,name:String?) {
        self.languageCode = languageCode
        self.name=name;
    }
    public  func isEqualLanguageOnly(_ object:LanguageObject?) -> Bool {
        return  Locale.init(identifier:self.languageCode ?? "").languageCode == Locale.init(identifier:object?.languageCode ?? "").languageCode
    }
    public  func isEqualLanguageAndRegionCode(_ object:LanguageObject?) -> Bool {
        let firstLocale = Locale.init(identifier:self.languageCode ?? "")
        let secondLocale = Locale.init(identifier:object?.languageCode ?? "")
        return (firstLocale.languageCode == secondLocale.languageCode)&&(firstLocale.regionCode == secondLocale.regionCode)
    }
}
