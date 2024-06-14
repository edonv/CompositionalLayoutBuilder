//
//  UICollectionViewController+Extensions.swift
//  
//
//  Created by Edon Valdman on 6/14/24.
//

#if canImport(UIKit)
import UIKit

extension UICollectionViewController {
    // MARK: - Init
    
    /// Initializes a collection view controller and configures the collection view with the provided layout.
    /// - Parameters:
    ///   - layout: The layout object to associate with the collection view. The layout controls how the collection view presents its cells and supplementary views.
    public convenience init(layout: CompositionalLayout) {
        self.init(collectionViewLayout: layout.layout)
    }
    
    /// Initializes a collection view controller and configures the collection view with the provided layout.
    /// - Parameters:
    ///   - layoutBuilder: The layout object to associate with the collection view. The layout controls how the collection view presents its cells and supplementary views.
    public convenience init(
        @CompositionalLayoutBuilder _ layoutBuilder: () -> CompositionalLayout
    ) {
        self.init(collectionViewLayout: layoutBuilder().layout)
    }
}
#endif
