//
//  AppDelegate.swift
//  SalahUtilityExample
//
//  Created by Salah on 11/16/20.
//  Copyright © 2020 Salah. All rights reserved.
//
import UIKit
import BackgroundTasks
import SalahUtility
import AppTexts
@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var newVariable=1
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
//        var a = NewNew.externalIPAddress;
//        var a = AppTexts.ConfirmPassword;
//        print(a);
//        let data: UnsafePointer<UInt8>? = UnsafePointer<UInt8>.init(bitPattern: 0)
//        print(data)
//        var a = data?[0]
//        print(a);
//        var b = data?[1]
//        print(b);
//        UINavigationBar.appearance(whenContainedInInstancesOf: [UINavigationController.self]).standardAppearance = AppStyle.greenBarStyle
//        UINavigationBar.appearance(whenContainedInInstancesOf: [UINavigationController.self]).scrollEdgeAppearance = AppStyle.greenBarStyle
//
//        UINavigationBar.appearance(whenContainedInInstancesOf: [SecondViewController.self]).standardAppearance = AppStyle.defaultBarStyle
//        UINavigationBar.appearance(whenContainedInInstancesOf: [SecondViewController.self]).scrollEdgeAppearance = AppStyle.defaultBarStyle
//
//        UINavigationBar.appearance().standardAppearance = AppStyle.defaultBarStyle
//        UINavigationBar.appearance().scrollEdgeAppearance = AppStyle.defaultBarStyle
        
        
        BGTaskScheduler.shared.cancelAllTaskRequests()

        NotificationCenter.default.addObserver(forName:UIApplication.didEnterBackgroundNotification, object: nil, queue: nil) { (_) in
            BGTaskScheduler.shared.cancelAllTaskRequests()

            if #available(iOS 13.0, *) {
                        do {
                            let request = BGProcessingTaskRequest(identifier: "com.a.1")
                            request.requiresNetworkConnectivity = false
                            request.requiresExternalPower = false
//                            request.earliestBeginDate = Calendar.current.date(byAdding: .second, value:5, to: Date())
                            request.earliestBeginDate = Date(timeIntervalSinceNow:5)
                            try BGTaskScheduler.shared.submit(request)

                            print("Submitted task request")
                        } catch {
                            print("Failed to submit BGTask")
                        }
                    }
            
            
//            UIApplication.shared.setMinimumBackgroundFetchInterval(1)
//
//            var finished = false
//            var bgTask: UIBackgroundTaskIdentifier = UIBackgroundTaskIdentifier(rawValue: 0);
//            bgTask = application.beginBackgroundTask(withName:"com.salahmohamed.SalahUtilityExample.don", expirationHandler: {() -> Void in
//                // Time is up.
//                if bgTask != UIBackgroundTaskIdentifier.invalid {
//                    // Do something to stop our background task or the app will be killed
//                    finished = true
//                    application.endBackgroundTask(bgTask)
//                    bgTask = UIBackgroundTaskIdentifier.invalid
//                }
//            })
        }
        

        // Override point for customization after application launch.
        
        
        
        
//
//        for index in 1...2{
//            NotificationBuilder.init().title("title").subTitle("subTitle").body("body").trigger(NotificationBuilder.Trigger.timeInterval(value: Double(index))).identifier("\(index)").repeats(false).sound(UNNotificationSound.init(named: UNNotificationSoundName(rawValue: "a.m4a"))).build().execute();
//
//        }
        
//        DispatchQueue.main.asyncAfter(deadline: .now()+2) {
//            print(UNUserNotificationCenter.current().getPendingNotificationRequests(completionHandler: { (a:[UNNotificationRequest]) in
//                print(a.map({ (request) -> String in
//                    return request.identifier
//                }).joined(separator:","))
//                print(a.count);
//            }))
//        }
//
        
        
        

        self.configNotification(application:application)

//        var da = Date.init()
//        da.addTimeInterval(3);
//        var dateComponent = Calendar.current.dateComponents([.second,.minute,.hour,.day, .month, .year], from: da);
//
//        NotificationBuilder.init().title("title").subTitle("subTitle").body("body").trigger(NotificationBuilder.Trigger.dateComponents(date: dateComponent)).identifier("aasd").repeats(false).build().execute();
        BGTaskScheduler.shared.register(forTaskWithIdentifier: "com.a.1", using:nil) { task in
            print("com.a.1");
            NotificationBuilder.init().title("Test".bs_localized("ar")+"5").subTitle("Test"+"5").body("Test"+"5").trigger(NotificationBuilder.Trigger.timeInterval(value: 1)).identifier("ad").repeats(false).sound(UNNotificationSound.init(named: UNNotificationSoundName(rawValue: "localNotificationAudio.m4a"))).build().execute();
            print("asd");
            task.expirationHandler = {
            }
            task.setTaskCompleted(success: true)

        }

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
//    func application(_ application: UIApplication, performFetchWithCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
//        NotificationBuilder.init().title("Test".bs_localized("ar")).subTitle("Test".bs_localized("ar")).body("Test".bs_localized("ar")).trigger(NotificationBuilder.Trigger.timeInterval(value: 1)).identifier("ad").repeats(false).sound(UNNotificationSound.init(named: UNNotificationSoundName(rawValue: "localNotificationAudio.m4a"))).build().execute();
//        print("asd");
//        completionHandler(UIBackgroundFetchResult.newData);
//
//    }
    
    func configNotification(application: UIApplication){
        if #available(iOS 10.0, *) {
            UNUserNotificationCenter.current().delegate = self
            let authOptions: UNAuthorizationOptions = [.alert, .badge, .sound]
            UNUserNotificationCenter.current().requestAuthorization(
                options: authOptions,
                completionHandler: {_, _ in })
        } else {
            let settings: UIUserNotificationSettings =
                UIUserNotificationSettings(types: [.alert, .badge, .sound], categories: nil)
            application.registerUserNotificationSettings(settings)
        }
        application.registerForRemoteNotifications()
    }
    

}

extension AppDelegate:UNUserNotificationCenterDelegate{
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void){
        print("moko");
    }
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print("moko");

    }

}

class AppStyle:NSObject{
    static var defaultBarStyle:UINavigationBarAppearance = {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.red
        appearance.titleTextAttributes = [.foregroundColor:UIColor.white];
        return appearance;
    }()
    static var greenBarStyle:UINavigationBarAppearance = {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.green
        appearance.titleTextAttributes = [.foregroundColor:UIColor.white];
        return appearance;
    }()
}
class Newww{
    static func getIPAddress()->String?{
        
        var address : String?
        
        // Get list of all interfaces on the local machine:
        var ifaddr : UnsafeMutablePointer<ifaddrs>?
        guard getifaddrs(&ifaddr) == 0 else { return nil }
        guard let firstAddr = ifaddr else { return nil }
        
        // For each interface ...
        for ifptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
            let interface = ifptr.pointee
            
            // Check for IPv4 or IPv6 interface:
            let addrFamily = interface.ifa_addr.pointee.sa_family
            if addrFamily == UInt8(AF_INET) || addrFamily == UInt8(AF_INET6) {
                
                // Check interface name:
                let name = String(cString: interface.ifa_name)
                if  name == "en0" {
                    
                    // Convert interface address to a human readable string:
                    var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                    getnameinfo(interface.ifa_addr, socklen_t(interface.ifa_addr.pointee.sa_len),
                                &hostname, socklen_t(hostname.count),
                                nil, socklen_t(0), NI_NUMERICHOST)
                    address = String(cString: hostname)
                    
                }
                
            }
            
        }
        
        freeifaddrs(ifaddr)
        
        return address
        
    }
}
