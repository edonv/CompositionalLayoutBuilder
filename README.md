# CompositionalLayoutBuilder

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
