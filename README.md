# CompositionalLayoutBuilder

[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fedonv%2FCompositionalLayoutBuilder%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/edonv/CompositionalLayoutBuilder)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fedonv%2FCompositionalLayoutBuilder%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/edonv/CompositionalLayoutBuilder)

`CompositionalLayoutBuilder` gives you the ability to "compose" a `UICollectionViewCompositionalLayout`/`NSCollectionViewCompositionalLayout` via result builders syntax.

It can be used in any context you might use a `UICollectionView`/`NSCollectionView`, including another package of mine: [`CollectionView`](https://github.com/edonv/CollectionView) (which will come pre-packaged with initializers that use the layout builders).

## Example

```swift
@CompositionalLayoutBuilder
var layout: CompositionalLayout {
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
}
```

## Documentation

Documentation can be found [here, hosted on Swift Package Index](https://swiftpackageindex.com/edonv/CompositionalLayoutBuilder//documentation/compositionallayoutbuilder).

## To-Do's

- [ ] Add documentation to `@CompositionalLayoutBuilder` initializers.
- [ ] Add equivalent UIKit code to README for comparison.
