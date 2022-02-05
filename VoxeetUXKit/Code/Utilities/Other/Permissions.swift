//
//  Permissions.swift
//  VoxeetUXKit
//
//  Created by Corentin Larroque on 10/29/18.
//  Copyright © 2018 Voxeet. All rights reserved.
//

import AVFoundation
import UIKit

class Permissions {
    @discardableResult class func microphone(viewController: UIViewController) -> Bool {
        guard AVAudioSession.sharedInstance().recordPermission == .denied else {
            return true
        }
        
        alert(viewController: viewController, title: "Microphone permission", message: "Microphone permission is required in order to communicate with other people", settingsButton: "Settings", cancelButton: "Cancel")
        
        return false
    }
    
    class func camera(viewController: UIViewController, completion: @escaping ((_ authorisation: Bool) -> Void)) {
        if AVCaptureDevice.authorizationStatus(for: .video) == .authorized {
            completion(true)
            return
        }
        
        AVCaptureDevice.requestAccess(for: .video, completionHandler: { granted in
            DispatchQueue.main.async {
                if granted {
                    completion(true)
                } else {
                    alert(viewController: viewController, title: "Camera permission", message: "Camera permission is required to activate the video", settingsButton: "Settings", cancelButton: "Cancel")
                    
                    completion(false)
                }
            }
        })
    }
    
    private class func alert(viewController: UIViewController, title: String, message: String, settingsButton: String, cancelButton: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let settingsAction = UIAlertAction(title: settingsButton, style: .default) { _ in
            if let settingsURL = URL(string: UIApplication.openSettingsURLString), UIApplication.shared.canOpenURL(settingsURL) {
                if #available(iOS 10.0, *) {
                    UIApplication.shared.open(settingsURL)
                } else {
                    UIApplication.shared.openURL(settingsURL)
                }
            }
        }
        alertController.addAction(settingsAction)
        alertController.addAction(UIAlertAction(title: cancelButton, style: .cancel, handler: nil))
        alertController.preferredAction = settingsAction
        viewController.present(alertController, animated: true, completion: nil)
    }
}
