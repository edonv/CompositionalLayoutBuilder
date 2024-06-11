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
    
    // MARK: - Specifying scroll direction
    
    #if canImport(UIKit)
    public typealias ScrollDirection = UICollectionView.ScrollDirection
    #else
    public typealias ScrollDirection = NSCollectionView.ScrollDirection
    #endif
    
    /// The axis that the content in the collection view layout scrolls along.
    public func scrollDirection(_ scrollDirection: ScrollDirection) -> Self {
        let new = self
        new.layout.configuration.scrollDirection = scrollDirection
        return new
    }
    
    // MARK: - Configuring spacing
    
    /// The amount of space between the sections in the layout.
    public func interSectionSpacing(_ interSectionSpacing: CGFloat) -> Self {
        let new = self
        new.layout.configuration.interSectionSpacing = interSectionSpacing
        return new
    }
    
    #if canImport(UIKit)
    /// The boundary to reference when defining content insets.
    ///
    /// For more details, see: [UIContentInsetsReference](https://developer.apple.com/documentation/uikit/uicontentinsetsreference)
    @available(iOS 14.0, tvOS 14.0, visionOS 1.0, *)
    public func contentInsetsReference(
        _ contentInsetsReference: UIContentInsetsReference
    ) -> Self {
        let new = self
        new.layout.configuration.contentInsetsReference = contentInsetsReference
        return new
    }
    #endif
    
    // MARK: - Configuring additional views
    
    /// An array of the supplementary items that are associated with the boundary edges of the entire layout, such as global headers and footers.
    public func boundarySupplementaryItems(
        _ boundarySupplementaryItems: [NSCollectionLayoutBoundarySupplementaryItem]
    ) -> Self {
        let new = self
        new.layout.configuration.boundarySupplementaryItems = boundarySupplementaryItems
        return new
    }
}
