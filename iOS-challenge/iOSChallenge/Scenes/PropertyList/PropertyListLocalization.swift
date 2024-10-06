//
//  PropertyListLocalization.swift
//  iOSChallenge
//
//  Created by Silvia España Gil on 6/10/24.
//

import SwiftUI

struct PropertyListLocalization {
    
    let title: String
    
    init(title: String = NSLocalizedString("property_list_toolbar_title",comment: "Title shown in the toolbar")) {
        
        self.title = title
    }
}
