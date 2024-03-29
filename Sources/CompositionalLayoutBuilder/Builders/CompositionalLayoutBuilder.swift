//
//  CompositionalLayoutBuilder.swift
//
//
//  Created by Edon Valdman on 2/24/24.
//

import SwiftUI

#if canImport(UIKit)
public typealias CompositionalLayout = UICollectionViewCompositionalLayout
#else
public typealias CompositionalLayout = NSCollectionViewCompositionalLayout
#endif

@resultBuilder
public struct CompositionalLayoutBuilder {
    public typealias FinalResult = CompositionalLayout
    public typealias Expression = NSCollectionLayoutSection
    public typealias Component = [Expression]
    
    public static func buildExpression(_ expression: Expression) -> Component {
        [expression]
    }
    
    public static func buildExpression(_ expression: CompositionalSection) -> Component {
        [expression.section]
    }
    
    public static func buildBlock(_ components: Component...) -> Component {
        buildArray(components)
    }
    
    public static func buildArray(_ components: [Component]) -> Component {
        components.flatMap { $0 }
    }
    
    public static func buildOptional(_ component: Component?) -> Component {
        buildArray([component].compactMap { $0 })
    }
    
    public static func buildBlock() -> Component {
        []
    }
    
    public static func buildEither(first component: Component) -> Component {
        component
    }
    
    public static func buildEither(second component: Component) -> Component {
        component
    }
    
    public static func buildLimitedAvailability(_ component: Component) -> Component {
        component
    }
    
    public static func buildFinalResult(_ component: Component) -> FinalResult {
        .init { section, _ in
            component[section % component.count]
        }
    }
}
