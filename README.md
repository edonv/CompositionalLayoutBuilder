# CompositionalLayoutBuilder

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fedonv%2FCompositionalLayoutBuilder%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/edonv/CompositionalLayoutBuilder)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fedonv%2FCompositionalLayoutBuilder%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/edonv/CompositionalLayoutBuilder)

`CompositionalLayoutBuilder` gives you the ability to "compose" a `UICollectionViewCompositionalLayout`/`NSCollectionViewCompositionalLayout` via result builders syntax.

It can be used in any context you might use a `UICollectionView`/`NSCollectionView`, including another package of mine: [`CollectionView`](https://github.com/edonv/CollectionView) (which will come pre-packaged with initializers that use the layout builders).

## Install

To add `CompositionalLayoutBuilder` to an Xcode project, go to `File` > `Add Package Dependencies...`, and paste `https://github.com/edonv/CompositionalLayoutBuilder` into the Search field.

To add it manually to a Swift Package, add the following to the `dependencies` property in the `Package.swift` file:

```swift
.package(
    url: "https://github.com/edonv/CompositionalLayoutBuilder",
    upToNextMajor(from: "0.0.0")
)
```

## Comparison

With `CompositionalLayoutBuilder`:

```swift
@CompositionalLayoutBuilder
let layout: CompositionalLayout = {
    LayoutSection {
        LayoutGroup(.horizontal, width: .fractionalWidth(1), height: .absolute(200)) {
            LayoutGroup(.vertical, width: .fractionalWidth(0.75), height: .fractionalHeight(1)) {
                LayoutItem(width: .fractionalWidth(1), height: .fractionalHeight(0.5))
                    .repeating(count: 2)
            }
            .interItemSpacing(.fixed(8))
            
            LayoutItem(width: .fractionalWidth(0.25), height: .fractionalHeight(1))
        }
        .interItemSpacing(.fixed(16))
    }

    LayoutSection {
        LayoutGroup(.horizontal, width: .fractionalWidth(1), height: .absolute(100)) {
            LayoutItem(width: .fractionalWidth(0.5), height: .fractionalHeight(1))
        }
    }
    .orthogonalScrollingBehavior(.continuous)
}()
```

With vanilla `UICollectionViewCompositionalLayout`:

```swift
let layout: UICollectionViewCompositionalLayout = {
    UICollectionViewCompositionalLayout { section, _ in
        switch section {
        case 0:
            let innerItem = NSCollectionLayoutItem(layoutSize: .init(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(0.5)
            ))
            
            let innerGroup = NSCollectionLayoutGroup.vertical(
                layoutSize: .init(
                    widthDimension: .fractionalWidth(0.75),
                    heightDimension: .fractionalHeight(1)
                ),
                subitem: innerItem,
                count: 2
            )
            
            innerGroup.interItemSpacing = .fixed(8)
            
            let outerItem = NSCollectionLayoutItem(layoutSize: .init(
                widthDimension: .fractionalWidth(0.25),
                heightDimension: .fractionalHeight(1)
            ))
            
            let mainGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: .init(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(200)
                ),
                subitems: [innerGroup, outerItem]
            )
            
            return .init(group: mainGroup)
            
        case 1:
            let innerItem = NSCollectionLayoutItem(layoutSize: .init(
                widthDimension: .fractionalWidth(0.5),
                heightDimension: .fractionalHeight(1)
            ))
            
            let mainGroup = NSCollectionLayoutGroup.horizontal(
                layoutSize: .init(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(100)
                ),
                subitems: [innerItem]
            )
            
            let section = NSCollectionLayoutSection(group: mainGroup)
            section.orthogonalScrollingBehavior = .continuous
            return section
            
        default:
            return nil
        }
    }
}()
```

## Documentation

Documentation can be found [here, hosted on Swift Package Index](https://swiftpackageindex.com/edonv/CompositionalLayoutBuilder//documentation/compositionallayoutbuilder).

## To-Do's

- [ ] Add documentation to `@CompositionalLayoutBuilder` initializers.
- [x] Add equivalent UIKit code to README for comparison.
