//
//  AppDelegate.swift
//  Msg-Notification
//
//  Created by 문다 on 2023/01/02.
//

import UIKit
import UserNotifications

@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {


    // 앱이 처음 실행될 때 호출되는 메소드.
    // 정확히는 앱에서 사용할 클래스와 리소스들이 모두 메모리에 로드되고 아직 앱의 첫 화면을 디스플레이하기 직전.
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let notiCenter = UNUserNotificationCenter.current()
        notiCenter.requestAuthorization(options: [.alert, .badge, .sound]) { didAllow, e in
            /*
             didAllow: 사용자의 알림 설정 동의 여부. 동의하면 true, 거부하면 false가 리턴.
             서버 푸시의 경우 알림 설정에 동의했다면 디바이스 토큰 정보를 서버로 보내 저장해두어야 할 것.
             
             e: 오류 객체 타입
             */
        }
        notiCenter.delegate = self

        return true
    }
    
    // 앱 실행 도중 알림 메시지가 도착한 경우
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        if notification.request.identifier == "wakeup" {
            let userInfo = notification.request.content.userInfo
            print(userInfo["name"]!)
        }
        
        // 알림 배너 띄워주기
        // completionHandler([.alert, .badge, .sound])
        // .alert is deprecated; Use .list and .banner
        completionHandler([.list, .banner, .badge, .sound])
        
    }
    
    // 사용자가 알림 메시지를 클릭했을 경우
    @available(iOS 10.0, *)
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        if response.notification.request.identifier == "wakeup" {
            let userInfo = response.notification.request.content.userInfo
            print(userInfo["name"])
        }
        completionHandler()
    }
    
    
    func applicationWillResignActive(_ application: UIApplication) {
        // iOS 13 이후 앱 생명 주기에 따른 이벤트 전달 방식이 바뀌어 SceneDelegate.swift의 sceneWillResignActive 메소드에 정의해야 함
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


}

