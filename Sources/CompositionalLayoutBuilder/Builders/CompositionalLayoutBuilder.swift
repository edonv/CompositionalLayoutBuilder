//
//  CompositionalLayoutBuilder.swift
//
//
//  Created by Edon Valdman on 2/24/24.
//

import SwiftUI

@resultBuilder
public struct CompositionalLayoutBuilder {
    public typealias FinalResult = CompositionalLayout
    public typealias Expression = CompositionalSection
    public typealias Component = [Expression]
    
    public static func buildExpression(_ expression: CompositionalSection) -> Component {
        [expression]
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
        .init(sections: component.map(\.section))
    }
}
