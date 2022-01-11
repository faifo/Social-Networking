//
//  StoryboardBuilder.swift
//  Quickscop
//
//  Created by Solo on 21/10/2021.
//

import UIKit

class StoryboardBuilder {
    init() {}
    
    static let shared = StoryboardBuilder()
    
    private var auth : UIStoryboard = UIStoryboard(name: "Auth", bundle: Bundle.main)
    private var home : UIStoryboard = UIStoryboard(name: "Home", bundle: Bundle.main)
    private var contest : UIStoryboard = UIStoryboard(name: "Contest", bundle: Bundle.main)
    private var categories : UIStoryboard = UIStoryboard(name: "Categories", bundle: Bundle.main)
    private var notifications : UIStoryboard = UIStoryboard(name: "Notifications", bundle: Bundle.main)
    private var profile : UIStoryboard = UIStoryboard(name: "Profile", bundle: Bundle.main)


}


// Auth
extension StoryboardBuilder {
    func signIn() -> SignInVC {
        return auth.instantiateViewController(withIdentifier: "SignInVC") as! SignInVC
    }
    
    func signUp1() -> SignUp1Vc {
        return auth.instantiateViewController(withIdentifier: "SignUp1Vc") as! SignUp1Vc
    }
    
    func signUp2() -> SignUp2VC {
        return auth.instantiateViewController(withIdentifier: "SignUp2VC") as! SignUp2VC
    }
    
    func forgotPassword() -> ForgotPasswordVC {
        return auth.instantiateViewController(withIdentifier: "ForgotPasswordVC") as! ForgotPasswordVC
    }
}

// Home
extension StoryboardBuilder {
    func homeVC() -> HomeVC {
        return home.instantiateViewController(withIdentifier: "HomeVC") as! HomeVC

    }
}

//Contest
extension StoryboardBuilder {
    func contestVC() -> ContestVC {
        return contest.instantiateViewController(withIdentifier: "ContestVC") as! ContestVC
    }
}

//Categories
extension StoryboardBuilder {
    func mainCategoriesVC() -> CategoriesMainVC {
        return categories.instantiateViewController(withIdentifier: "CategoriesMainVC") as! CategoriesMainVC
    }
}

//Notifications
extension StoryboardBuilder {
    func mainNotificationsVC() -> NotificationsMainVC {
        return notifications.instantiateViewController(withIdentifier: "NotificationsMainVC") as! NotificationsMainVC
    }
}

//Profile
extension StoryboardBuilder {
    func mainProfile() -> MainProfileVC {
        return profile.instantiateViewController(withIdentifier: "MainProfileVC") as! MainProfileVC
    }
    
    func recordings() -> RecordingsVC {
        return profile.instantiateViewController(withIdentifier: "RecordingsVC") as! RecordingsVC
    }
    
    func editProfile() -> EditProfileVC {
        return profile.instantiateViewController(withIdentifier: "EditProfileVC") as! EditProfileVC
    }
    
    func verifyProfile() -> VerifyProfileVC {
        return profile.instantiateViewController(withIdentifier: "VerifyProfileVC") as! VerifyProfileVC
    }
    
    func certification() -> CertificationVC {
        return profile.instantiateViewController(withIdentifier: "CertificationVC") as! CertificationVC
    }
    
    func videoExplain() -> VideoExplainVC {
        return profile.instantiateViewController(withIdentifier: "VideoExplainVC") as! VideoExplainVC
    }
    
    func personalInfo() -> PersonalInfoVC {
        return profile.instantiateViewController(withIdentifier: "PersonalInfoVC") as! PersonalInfoVC
    }
    
}
