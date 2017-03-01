//
//  ViewController.swift
//  InAppNotificationsDemo
//
//  Created by Kittitat Rodphotong on 1/25/2560 BE.
//  Copyright © 2560 DevGo. All rights reserved.
//

import UIKit
import BRYXBanner

class ViewController: UIViewController {
    // MARK: - IBOutlet
    

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let c = NSDateComponents()
        c.hour = 23
        c.minute = 55

        
        // Get NSDate given the above date components
        let date = NSCalendar(identifier: NSCalendar.Identifier.gregorian)?.date(from: c as DateComponents)
        
        print(date!)
        
//        scheduleLocalNoti(date: setNotificationDay(today: date! as NSDate, selectedDay: 3))
        
        let notifications = UIApplication.shared.scheduledLocalNotifications
        print(notifications ?? "NO NOTIFICATION")
    }
    
    // MARK: - Function
    func displayBanner() {
        let banner = Banner(title: "Image Notification",
                            subtitle: "Here's a great image notification.",
                            image: UIImage(named: "Icon"),
                            backgroundColor: UIColor(red:48.00/255.0, green:174.0/255.0, blue:51.5/255.0, alpha:1.000))
        banner.dismissesOnTap = true
        banner.show(duration: 3.0)
    }
    
    func localNotification() {
        // create a corresponding local notification
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        let someDateTime = formatter.date(from: "2017/02/27 21:12")
        
        let notification = UILocalNotification()
        notification.alertBody = "Title"
        notification.alertAction = "open"
        notification.fireDate = someDateTime
        notification.userInfo = ["title": "Title", "UUID": "ID"]
        
        UIApplication.shared.scheduleLocalNotification(notification)
    }
    
    // Local Notification Repeat Day
    func scheduleLocalNoti(date: NSDate) {
        let dayDic = [1:"Sunday",
                      2:"Monday",
                      3:"Tuesday",
                      4:"Wednesday",
                      5:"Thursday",
                      6:"Friday",
                      7:"Saturday"]
        
        let calendar = NSCalendar.current
        let weekday = calendar.component(.weekday, from: date as Date)
        
        print("DATE: \(date)")
        
        let notification = UILocalNotification()
        notification.fireDate = date as Date
        notification.repeatInterval = .weekOfYear
        notification.alertTitle = String(format: "%@'s Workout", dayDic[weekday]!)
        notification.alertBody = String(format: "This is the message from %@'s workout", dayDic[weekday]!)
        notification.alertAction = "Snooze"
        notification.category = "workoutReminderID"
        notification.soundName = UILocalNotificationDefaultSoundName
        UIApplication.shared.scheduleLocalNotification(notification)
    }
    
    func setNotificationDay(today: NSDate, selectedDay: Int) -> NSDate {
        let daysToAdd: Int!
        let calendar = NSCalendar.current
        let weekday = calendar.component(.weekday, from: today as Date)
        
        if weekday > selectedDay {
            daysToAdd = (7 - weekday) + selectedDay
        } else {
            daysToAdd = (selectedDay - weekday)
        }
        
        let newDate = calendar.date(byAdding: .weekday, value: daysToAdd, to: today as Date)
        
        return newDate! as NSDate //if you don't have a date it'll crash
    }

}

