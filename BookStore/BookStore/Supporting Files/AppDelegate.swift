//
//  AppDelegate.swift
//  BookStore
//
//  Created by Karl Pfister on 1/19/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Mock data
        let lOTR = Book(author: "J.R.R Tolkein", title: "The Lord Of The Rings", rating: 10.0, synopsis: "In a world where evil is made into jewlry one Hobbit stands above the rest")
        let dVCode = Book(author: "Dan Brown", title: "The Da Vinci Code", rating: 5.4, synopsis: "The Da Vinci Code is a 2003 mystery thriller novel by Dan Brown. It is Brown's second novel to include the character Robert Langdon: the first was his 2000 novel Angels & Demons. The Da Vinci Code follows symbologist Robert Langdon and cryptologist Sophie Neveu after a murder in the Louvre Museum in Paris causes them to become involved in a battle between the Priory of Sion and Opus Dei over the possibility of Jesus Christ and Mary Magdalene having had a child together.")
        let notw = Book(author: "Patrick Rothfuss", title: "Name of the Wind", rating: 9.4, synopsis: "The Kingkiller Chronicle takes place in the fictional world of Temerant, a large continent of which the known part, called the Four Corners of Civilization, is divided into several distinct nations and cultures. Much of the world follows a religion similar, though not identical, to medieval Christianity[citation needed]. Coexisting alongside the mortal world is the realm of The Fae, a parallel universe inhabited by supernatural creatures which can move between the two realms only when the moon is full. Magic exists in Temerant, too, but obeys a well-defined set of rules and principles that can only be exploited by those who have trained in its professional and scientific use.")
        BookController.sharedInstance.books.append(contentsOf: [lOTR,dVCode,notw])
                         
        // Override point for customization after application launch.
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


}

