//
//  LocalFile.swift
//  SwiftUtility
//
//  Created by SalahMohamed on 22/02/2023.
//  Copyright © 2023 SwiftUtility. All rights reserved.
//

public enum LocalFile{
 case url(URL)
 case bundle(forResource:String,ofType:String)
 case file(searchPathDirectory:FileManager.SearchPathDirectory? = .documentDirectory,
                folderName:String?,
                localeFileName:String?,
                fileType:String?)
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
                                        localeFileName,
                                        fileType);
        case .bundle(forResource: let forResource, ofType: let ofType):
            if let  path:String = Bundle.main.path(forResource:forResource, ofType:ofType){
             return URL.init(fileURLWithPath:path)
            }
            return nil
        }
    }
    public var stringUrl:String?{
        switch self{
        case .url(let url):
            return url.path
        case .file(searchPathDirectory:let searchPathDirectory,
                        folderName: let folderName,
                        localeFileName: let localeFileName,
                        fileType: let fileType):
            let a = URL.bs_genrateLocalFile(searchPathDirectory ?? .documentDirectory,
                                            folderName,
                                            fileType,
                                            localeFileName)
            if #available(iOS 16.0, *) {
                return a?.path()
            } else {
                return a?.path
                // Fallback on earlier versions
            };
        case .bundle(forResource: let forResource,ofType:let ofType):
            if let  path:String = Bundle.main.path(forResource:forResource, ofType:ofType){
             return path
            }
            return nil
        }
    }
}
open class FileBuilder{
    public enum WriteCopyBehavior{
      case stopIfExist
      case deleteIfExistThenWriteOrCopy
    }
    open func copy()->FileBuilder{
        let copyFileBuilder = FileBuilder.init(self.operationType);
        copyFileBuilder.operationType=self.operationType
        copyFileBuilder.folders=self.folders
        copyFileBuilder.searchPathDirectory=self.searchPathDirectory
        copyFileBuilder.fileType=self.fileType
        copyFileBuilder.fileName=self.fileName
        return copyFileBuilder
    }
    public enum OperationType{
    case write(writeCopyBehavior:WriteCopyBehavior,writtenType:WrittenType)
    case get(finish:((Data?)->Void)?=nil)
    case copy(writeCopyBehavior:WriteCopyBehavior,from:URL)
    case remove
    }
    public enum WrittenType{
    case data(Data)
    case string(String)
    case dic(NSDictionary)
    case array(NSArray)
    }
    var operationType:OperationType = .get()
    private var folders:[String]=[String]();
    private var searchPathDirectory:FileManager.SearchPathDirectory?
    let defaultSearchPath:FileManager.SearchPathDirectory = .documentDirectory
    private var fileType:String?
    private var fileName:String?
    public var genratedUrl:URL?
    private var folderPath:String?{
        if folders.count > 0{
            return folders.joined(separator:"/")
        }
        return nil
    }
    public init(_ operationType: OperationType) {
        self.operationType=operationType
        // open url
    }
    public init(_ genratedUrl:URL?,_ operationType: OperationType) {
     self.operationType=operationType
     self.genratedUrl=genratedUrl;
    }
    @discardableResult open func build()->Self{
        if self.searchPathDirectory != nil ||
           self.folderPath != nil ||
           self.fileName != nil ||
           self.fileType != nil{
            self.genratedUrl=URL.bs_genrateLocalFile(searchPathDirectory ?? self.defaultSearchPath, self.folderPath,self.fileName,self.fileType)
    }else
     if let genratedUrl:URL=self.genratedUrl{
         let temp = FileManager.default.bs_createFolderIfNotExist(url:genratedUrl)
     }
    return self;
    }
    open func operationType(_ operationType:OperationType)->Self{
    self.operationType=operationType
    return self
    }
    open func searchPathDirectory(_ searchPathDirectory:FileManager.SearchPathDirectory)->Self{
    self.searchPathDirectory=searchPathDirectory
    return self
    }
    open func folders(_ folders:[String])->Self{
    self.folders.append(contentsOf:folders)
    return self
    }
    open func folder(_ folder:String)->Self{
    self.folders.append(folder)
    return self
    }
    open func fileType(_ fileType:String)->Self{
    self.fileType=fileType
    return self
    }
    open func fileName(_ fileName:String)->Self{
    self.fileName=fileName
    return self
    }
    @discardableResult open func execute()->URL?{
    self.genrate();
    return self.genratedUrl
    }
    private func genrate(){
        switch self.operationType{
        case .get(let handler):
            if let genratedUrl:URL = self.genratedUrl{
                do{
                    handler?(try Data.init(contentsOf: genratedUrl));
                }catch{
                    
                }
            }
            break;
        case .copy(let writeCopyBehavior,let fromUrl):
            if let genratedUrl:URL = self.genratedUrl{
                let _ = FileManager.default.bs_copyItem(deleteIfExist:writeCopyBehavior == .deleteIfExistThenWriteOrCopy, at:fromUrl, to:genratedUrl)
            }
            break;
        case .write(let writeCopyBehavior,let writtenType):
          #if DEBUG
            if (self.fileName == nil || self.fileType == nil) && self.genratedUrl == nil{
                fatalError("you should enter file name and file type to write file")
            }
          #endif
            if let localUrl:URL = self.genratedUrl,
               let localPath:String=self.genratedUrl?.localPath{
                
                if writeCopyBehavior == .deleteIfExistThenWriteOrCopy,FileManager.default.fileExists(atPath:localPath) {
                    do{
                    try FileManager.default.removeItem(at:localUrl)
                    }catch{
                        
                    }
                }else
                if writeCopyBehavior == .stopIfExist,FileManager.default.fileExists(atPath:localPath) {
                    return ;
                }
                switch writtenType{
                case .data(let data):
                    do{
                        try data.write(to:localUrl)
                    }catch{
                        
                    }
                    break;
                case .string(let string):
                    try? string.write(toFile: localPath, atomically:true, encoding: .utf8)
                    break;
                case .dic(let dic):
                    dic.write(toFile:localPath, atomically:true)
                    break;
                case .array(let array):
                    array.write(toFile: localPath, atomically:true)
                    break;
                }
            }
            break;
        case .remove:
            if let localUrl:URL = self.genratedUrl{
            try? FileManager.default.removeItem(at:localUrl)
            }
            break;
        }
    }
}

extension URL{
    var localPath:String?{
        if #available(macOS 13.0, iOS 16.0, tvOS 16.0, watchOS 9.0, *){
            return self.path()
        }
        else{
            return self.path
        }
    }
}


