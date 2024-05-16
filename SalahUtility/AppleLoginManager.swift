//
//  AppleLoginManager.swift
//  EureecaProjects
//
//  Created by SalahMohamed on 10/01/2023.
//

#if os(iOS)
import UIKit
#elseif os(macOS)
import Foundation
import AppKit
#endif

import AuthenticationServices
@available(iOS 13.0, *)
public class AppleLoginManager: NSObject,ASAuthorizationControllerDelegate,ASAuthorizationControllerPresentationContextProviding {
    public typealias FinishHandler = (ASAuthorizationController,ASAuthorization)->Void
    public typealias ErrorHandler = (ASAuthorizationController,Error)->Void

    private var finishHandler:FinishHandler?
    private var errorHandler:ErrorHandler?
    public func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
     #if os(iOS)
        return UIApplication.shared.bs_windowForegroundActive!.window!
     #elseif os(macOS)
        return NSApplication.shared.windows.last!
      #endif
    }
    
    public static let shared: AppleLoginManager = { AppleLoginManager()} ()
    
    public override init() {
        super.init()

    }
    public func login(finishHandler:FinishHandler?,errorHandler:ErrorHandler?){
        self.finishHandler=finishHandler;
        self.errorHandler=errorHandler;
        let appleIDProvider = ASAuthorizationAppleIDProvider()
          let request = appleIDProvider.createRequest()
          request.requestedScopes = [.fullName, .email]
          
          let authorizationController = ASAuthorizationController(authorizationRequests: [request])
          authorizationController.delegate = self
          authorizationController.presentationContextProvider = self
          authorizationController.performRequests()
    }
    public func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization){
         finishHandler?(controller,authorization);
    }

    public func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error){
         self.errorHandler?(controller,error);
    }
}
