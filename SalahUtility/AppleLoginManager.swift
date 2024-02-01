//
//  AppleLoginManager.swift
//  EureecaProjects
//
//  Created by SalahMohamed on 10/01/2023.
//

import UIKit
import AuthenticationServices
@available(iOS 13.0, *)
public class AppleLoginManager: NSObject,ASAuthorizationControllerDelegate,ASAuthorizationControllerPresentationContextProviding {
    public typealias FinishHandler = (ASAuthorization)->Void
    typealias ErrorHandler = (Error)->Void

    private var finishHandler:FinishHandler?
    private var errorHandler:ErrorHandler?
    public func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return UIApplication.shared.bs_windowForegroundActive!.window!
    }
    
    public static let shared: AppleLoginManager = { AppleLoginManager()} ()
    
    override init() {
        super.init()

    }
    func login(finishHandler:FinishHandler?,errorHandler:ErrorHandler?){
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
         finishHandler?(authorization);
    }

    public func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error){
         self.errorHandler?(error);
    }
}

