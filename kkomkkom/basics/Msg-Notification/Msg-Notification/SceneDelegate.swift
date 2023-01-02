//
//  SceneDelegate.swift
//  Msg-Notification
//
//  Created by 문다 on 2023/01/02.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
        guard let _ = (scene as? UIWindowScene) else { return }
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
        
        if #available(iOS 10.0, *) {
            // 알림 동의 여부 확인
            UNUserNotificationCenter.current().getNotificationSettings { settings in
                if settings.authorizationStatus == .authorized {
                    print("5초 후 알림 발송")
                    // 1. 알림 콘텐츠 객체; UNMutableNotificationContent
                    let nContent = UNMutableNotificationContent()
                    nContent.badge = 1 // 앱 아이콘에 표시될 값. ex) 카카오톡 읽지 않은 메시지 수
                    nContent.title = "로컬 알림 메시지"
                    nContent.subtitle = "준비된 내용이 아주 많아요! 얼른 다시 앱을 열어주세요!!"
                    nContent.body = "앗, 왜 나갔어요??? 어서 들어오세요!!"
                    nContent.sound = UNNotificationSound.default
                    nContent.userInfo = ["name": "홍길동"]
                    
                    // 2. 알림 발송 조건 객체; UNTimeIntervalNotificationTrigger
                    let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                    
                    // 3. 알림 요청 객체; UNNotificationRequest
                    let request = UNNotificationRequest(identifier: "wakeup", content: nContent, trigger: trigger)
                    
                    // 4. Notification Center에 추가
                    UNUserNotificationCenter.current().add(request)
                } else {
                    print("사용자 알림 설정 거부")
                }
            }
        } else {
            let application = UIApplication.shared
            let setting = application.currentUserNotificationSettings
            
            // 알림 설정이 되어 있지 않다면 로컬 알림을 보내도 받을 수 없으므로 종료
            guard setting?.types != .none else {
                print("Cannot Schedule")
                return
            }
            
            // 로컬 알람 인스턴스 생성
            let noti = UILocalNotification()
            noti.applicationIconBadgeNumber = 1 // 앱 아이콘에 표시될 값. ex) 카카오톡 읽지 않은 메시지 수
            noti.alertAction = "학습하기" // 잠금 상태일 때 표시될 액션
            noti.alertBody = "앗, 왜 나갔어요??? 어서 들어오세요!!"
            noti.soundName = UILocalNotificationDefaultSoundName
            noti.userInfo = ["name": "홍길동"]
            
            noti.fireDate = Date(timeIntervalSinceNow: 10) // 10초 후 발송
            noti.timeZone = TimeZone.autoupdatingCurrent // 현재 위치에 따라 타임존 설정
            
            // 생성된 알람 객체를 스케줄러에 등록
            application.scheduleLocalNotification(noti)
        }
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

