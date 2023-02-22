//
//  LocalFile.swift
//  SalahUtility
//
//  Created by SalahMohamed on 22/02/2023.
//  Copyright © 2023 Salah. All rights reserved.
//

import UIKit


public enum LocalFile{
 case url(URL)
 case bundle(forResource:String,ofType:String)
    case file(searchPathDirectory:FileManager.SearchPathDirectory? = .documentDirectory,
                folderName:String,
                localeFileName:String,
                fileType:String)
    public var url:URL?{
        switch self{
        case .url(let url):
            return url
        case .file(searchPathDirectory:let searchPathDirectory,
                        folderName: let folderName,
                        localeFileName: let localeFileName,
                        fileType: let fileType):
            return URL.bs_genrateLocalFile(searchPathDirectory ?? .documentDirectory,
                                        folderName,
                                        fileType,
                                        localeFileName);
        case .bundle(forResource: let forResource, ofType: let ofType):
            if let  path:String = Bundle.main.path(forResource:forResource, ofType:ofType){
             return URL.init(fileURLWithPath:path)
            }
            return nil
        }
    }
}
