//
//  UICollectionView+Extensions.swift
//
//
//  Created by Edon Valdman on 6/14/24.
//

#if canImport(UIKit)
import UIKit

extension UICollectionView {
    /// Changes the collection view’s layout and notifies you when the animations complete.
    ///
    /// This method initiates a layout change programmatically, notifying you when the transition is complete. If you choose to animate the layout change, the animation timing and parameters are controlled by the collection view.
    /// - Parameters:
    ///   - layout: The new layout for the collection view.
    ///   - animated: Specify `true` if you want to animate changes from the current layout to the new layout specified by the `layoutBuilder` parameter. Specify `false` to make the change without animations.
    ///   - completion: The block that’s executed when the layout transition finishes or is terminated by the user. This block takes the following parameter:
    ///   - finished: A Boolean indicating whether the transition completed successfully. This parameter is true if the transition finished and the new layout is installed. It’s false if the user aborted the transition and returned to the old layout.
    public func setCompositionalLayout(
        _ layout: CompositionalLayout,
        animated: Bool,
        completion: ((_ finished: Bool) -> Void)? = nil
    ) {
        self.setCollectionViewLayout(layout.layout, animated: animated, completion: completion)
    }
    
    /// Changes the collection view’s layout and optionally animates the change.
    ///
    /// This method makes the layout change without further interaction from the user. If you choose to animate the layout change, the animation timing and parameters are controlled by the collection view.
    /// - Parameters:
    ///   - layout: The new layout for the collection view.
    ///   - animated: Specify `true` if you want to animate changes from the current layout to the new layout specified by the `layoutBuilder` parameter. Specify `false` to make the change without animations.
    public func setCompositionalLayout(
        _ layout: CompositionalLayout,
        animated: Bool
    ) {
        self.setCollectionViewLayout(layout.layout, animated: animated)
    }
    
    /// Changes the collection view’s layout and notifies you when the animations complete.
    ///
    /// This method initiates a layout change programmatically, notifying you when the transition is complete. If you choose to animate the layout change, the animation timing and parameters are controlled by the collection view.
    /// - Parameters:
    ///   - animated: Specify `true` if you want to animate changes from the current layout to the new layout specified by the `layoutBuilder` parameter. Specify `false` to make the change without animations.
    ///   - layoutBuilder: The new layout for the collection view.
    ///   - completion: The block that’s executed when the layout transition finishes or is terminated by the user. This block takes the following parameter:
    ///   - finished: A Boolean indicating whether the transition completed successfully. This parameter is true if the transition finished and the new layout is installed. It’s false if the user aborted the transition and returned to the old layout.
    public func setCompositionalLayout(
        animated: Bool,
        @CompositionalLayoutBuilder _ layoutBuilder: () -> CompositionalLayout,
        completion: ((_ finished: Bool) -> Void)? = nil
    ) {
        self.setCollectionViewLayout(layoutBuilder().layout, animated: animated, completion: completion)
    }
    
    /// Changes the collection view’s layout and optionally animates the change.
    ///
    /// This method makes the layout change without further interaction from the user. If you choose to animate the layout change, the animation timing and parameters are controlled by the collection view.
    /// - Parameters:
    ///   - animated: Specify `true` if you want to animate changes from the current layout to the new layout specified by the `layoutBuilder` parameter. Specify `false` to make the change without animations.
    ///   - layoutBuilder: The new layout for the collection view.
    public func setCompositionalLayout(
        animated: Bool,
        @CompositionalLayoutBuilder _ layoutBuilder: () -> CompositionalLayout
    ) {
        self.setCollectionViewLayout(layoutBuilder().layout, animated: animated)
    }
}
#endif
