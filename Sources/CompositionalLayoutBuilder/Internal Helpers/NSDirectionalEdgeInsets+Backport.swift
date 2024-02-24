//
//  NSDirectionalEdgeInsets+Backport.swift
//
//
//  Created by Edon Valdman on 2/24/24.
//

import SwiftUI

extension NSDirectionalEdgeInsets {
    internal init(backport edgeInsets: EdgeInsets) {
        if #available(iOS 14.0, macCatalyst 14.0, macOS 11.0, tvOS 14.0, visionOS 1.0, *) {
            self.init(edgeInsets)
        } else {
            self.init(
                top: edgeInsets.top,
                leading: edgeInsets.leading,
                bottom: edgeInsets.bottom,
                trailing: edgeInsets.trailing
            )
        }
    }
}
