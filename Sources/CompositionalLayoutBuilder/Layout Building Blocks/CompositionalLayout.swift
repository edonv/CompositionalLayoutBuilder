//
//  CompositionalLayout.swift
//  
//
//  Created by Edon Valdman on 6/11/24.
//

import SwiftUI

public struct CompositionalLayout {
    #if canImport(UIKit)
    public typealias Layout = UICollectionViewCompositionalLayout
    #else
    public typealias Layout = NSCollectionViewCompositionalLayout
    #endif
    
    public let layout: Layout
    
    public init(
        @CompositionalLayoutBuilder builder: () -> CompositionalLayout
    ) {
        self = builder()
    }
    
    #if canImport(UIKit)
    @available(iOS 14.0, tvOS 14.0, visionOS 1.0, *)
    public init(
        list configuration: UICollectionLayoutListConfiguration
    ) {
        self.layout = .list(using: configuration)
    }
    #endif
    
    internal init(sections: [NSCollectionLayoutSection]) {
        self.layout = Layout { section, _ in
            sections[section % sections.count]
        }
    }
}
