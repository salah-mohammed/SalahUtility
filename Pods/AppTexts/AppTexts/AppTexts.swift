//
//  AppTexts.swift
//  AppTexts
//
//  Created by Salah on 11/30/21.
//  Copyright © 2021 Salah. All rights reserved.
//
import UIKit


public class AppTexts: NSObject {
    public class func  KM(value:String)->String{
    return String.init(format: "KM".internalLocalize_, arguments:[value])
    }
    public class func Successfully(title:String)->String{
        return String.init(format:"Successfully".internalLocalize_, arguments:[title])
    }
    public class func QuestionYesNo(title:String)->String{
        return String.init(format:"QuestionYesNo".internalLocalize_, arguments:[title])
    }
    public enum Constant:String{
        // MARK:Constants
        case all="All"
        case downloadAll="DownloadAll"
        case passwordMustHave6="PasswordMustHave6"
        case newPassword="NewPassword"
        case pleaseAcceptTheTerms = "PleaseAcceptTheTerms"
        case passwordNotMatch="PasswordNotMatch"
        case cantNotOpenLink="CantNotOpenLink"
        case choose="Choose"
        case ok="Ok"
        case cancel="Cancel"
        case done="Done"
        case yes="Yes"
        case no="No"
        case update="Update"
        case save="Save"
        case complete="Complete"
        case verify="Verify"
        case settings="Settings"
        case appearance="Appearance"
        case attention="Attention"
        case error="Error"
        case anErrorOccurred="An error occurred"
        case send="Send"
        case year="Year"
        case clear="Clear"
        case sort="Sort"
        case sortBy="SortBy"
        case home="Home"
        case seeAll="SeeAll"
        case favorite="Favorite"
        case signin="Signin"
        case change="Change"
        case edit="Edit"
        case showMore="ShowMore"
        case showLess="ShowLess"
        case filter="Filter"
        case searchResult="SearchResult"
        case add="Add"
        case back="Back"
        case activate="Activate"
        case next="Next"
        case previous="Previous"
        case writeAComment="WriteAComment"
        case attachments="Attachments"
        case continueText="Continue"
        case clearAll="ClearAll"
        case file="File"
        case photo="Photo"
        case profilePicture="ProfilePicture"
        case item="Item"
        case product="Product"
        case aboutUS="AboutUS"
        case signout="Signout"
        case info="Info"
        case english="English"
        case arabic="Arabic"
        case code="Code"
        case name="Name"
        case noDataToShow="No Data To Show"
        case takePhotoText="TakePhotoText"
        case takeVideoText="TakeVideoText"
        case noSourcesText="NoSourcesText"
        case captureImage="CaptureImage"
        case choseFromGallery="ChoseFromGallery"
        case hTMLDirection="HTMLDirection"
        case contactUs="ContactUs"
        case termsAndConditions="TermsAndConditions"
        case notifications="Notifications"
        case rateApp="RateApp"
        case aboutApp="AboutApp"
        case privacyPolicy="PrivacyPolicy"
        case login="Login"
        case register="Register"
        case profile="Profile"
        case editProfile="EditProfile"
        case search="Search"
        case language="Language"
        case from="From"
        case to="To"
        case registration="Registration"
        case chat="Chat"
        case accountInformation="AccountInformation"
        case skip="Skip"
        case join="Join"
        case delete="Delete"
        case paymentSuccessful="PaymentSuccessful"
        case myAccount="MyAccount"
        case pending="Pending"
        case confirmed="Confirmed"
        case cancelled="Cancelled"
        case unconfirmed="Unconfirmed"
        case confirm="Confirm"
        case version="Version"
        case forgotPassword="ForgotPassword"
        case male="Male"
        case female="Female"
        case other="Other"
        case verfiy="Verfiy"
        case appLanguage="AppLanguage"
        case shareApp="ShareApp"
        case changePassword="ChangePassword"
        case resendVerificationCode="ResendVerificationCode"
        case completeProfile="CompleteProfile"
        case instructions="Instructions"
        case rateUs="RateUs"
        case price="Price"
        case expiryDate="ExpiryDate"
        case usagePolicy="UsagePolicy"
        case verification="Verification"
        case categories="Categories"
        case favorites="Favorites"
        case rate="Rate"
        case orders="Orders"
        case myOrders="MyOrders"
        case total="Total"
        // MARK:Alerts
        case alertMessageLogoutConfirmation="AlertMessageLogoutConfirmation"
        case alertUnauthorized="Unauthorized"
        case alertTitleChangeLanguage="TitleChangeLanguage"
        case subTitleChangeLanguage="SubTitleChangeLanguage"
        case alertSupportLater="SupportLater"
//        "LanguageChangedSuccessfully" = "تم تغير اللغة بنجاح";
        case alertResetPasswordSuccess="ResetPasswordSuccess"
        case alertResetCodeToResetPasswordSuccess="ResetCodeToResetPasswordSuccess"
        case alertLoginIsRequired="LoginIsRequired"
        case alertVerificationCodeHasBeenSent="VerificationCodeHasBeenSent"
        case alertTakeAPhotoOrASelectionFromTheGallery="TakeAPhotoOrASelectionFromTheGallery"
        case alertDoneSuccessfully="DoneSuccessfully"
        case alertEnterAllFields="EnterAllFields"
        case alertFeatureForLoginedUsers="FeatureForLoginedUsers"
        // MARK:Fields
        case firstName="FirstName"
        case lastName="LastName"
        case fullName="FullName"
        case userName="UserName"
        case password="Password"
        case confirmPassword="ConfirmPassword"
        case address="Address"
        case addressDetails="AddressDetails"
        case city="City"
        case region="Region"
        case mobileNumber="MobileNumber"
        case title="Title"
        case description="Description"
        case details="Details"
        case noData="NoData"
        case email="Email"
        case Gender="Gender"
        case dateOfBirth="DateOfBirth"
        case location="Location"
        case requirements="Requirements"
        case messageTitle="MessageTitle"
        case messageBody="MessageBody"
        case verificationCode="VerificationCode"
        case country="Country"
        case chatTextMessagePlaceholder="ChatTextMessagePlaceholder"
        case message="Message"
        case addressOnMap="AddressOnMap"
        case currentLocation="CurrentLocation"
        case searchHere="SearchHere"
        case nationality="Nationality"
        case drivingLicense="DrivingLicense"
        case birthCertificate="BirthCertificate"
        case universityCertificate="UniversityCertificate"
        case Governorate="Governorate"
        case street="Street"
        case neighborhood="Neighborhood"
        case apartmentNo="ApartmentNo"
        case buildingNo="BuildingNo"
        case floorNo="FloorNo"
        case birthDay="BirthDay"
        case oldPassword="OldPassword"
        case noSubscription="NoSubscription"
        case subscriptionSucess="SubscriptionSucess"
        case purchaseRestored="PurchaseRestored"
        case subscribe="Subscribe"
        case premium="Premium"
        
        public var  string:String{
        return  self.rawValue.internalLocalize_
        }
    }
   
    // MARK:Success Messagaes
    public enum DoneSuccessfully:String{
    case deleted="Deleted_Successfully"
    case added="Added_Successfully"
    case edited="Edited_Successfully"
    case saved="Saved_Successfully"
    case sent="Sent_Successfully"
    case change="Change_Successfully"
    case uploaded="Uploaded_Successfully"
    public func string(_ value:String?=nil)->String{
        if let value:String=value{
            return String.init(format:self.rawValue.internalLocalize_, arguments:[value])
        }else{
            return "\(self.rawValue)_New".internalLocalize_
        }
    }
    }
    // MARK:Quesstion Meesages.
    public enum QuestionMessage:String{
    case delete="QuestionYesNo_Delete"
    case add="QuestionYesNo_Add"
    case edit="QuestionYesNo_Edit"
    case save="QuestionYesNo_Save"
    case send="QuestionYesNo_Send"
    case change="QuestionYesNo_Change"
        public func string(_ value:String?)->String{
        if let value:String=value{
            return String.init(format:self.rawValue.internalLocalize_, arguments:[value])
        }else{
            return "\(self.rawValue)_New".internalLocalize_
        }
    }
    }
}
