//
//  VTUXLocalized.swift
//  VoxeetUXKit
//
//  Created by Corentin Larroque on 14/08/2019.
//  Copyright © 2019 Voxeet. All rights reserved.
//

import UIKit
class VTUXLocalized {
    static func string(_ key: String) -> String {
        let strLocalBundle = NSLocalizedString(key, bundle: Bundle(for: VTUXLocalized.self), comment: "")
        let strMainBundle = NSLocalizedString(key, comment: "")
        
        return strMainBundle != key ? strMainBundle : strLocalBundle
    }
}
