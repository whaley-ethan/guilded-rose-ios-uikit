import UIKit

class ItemCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    var items: [Item]
    override init() {
        self.items = Item.getItems()
    }
    
    init(items: [Item]) {
        if items.count == 0 {
            self.items = [Item.noItemsInStock]
        } else {
            self.items = items
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
        // if no items make 1 cell
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ItemCollectionViewCell
        // if no items make one cell with label of "
        cell.itemCellLabel.text = items[indexPath.row].name

        return cell
    }

}