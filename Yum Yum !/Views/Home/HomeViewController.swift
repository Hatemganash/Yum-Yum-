import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var catogeryCollectionView: UICollectionView!
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    @IBOutlet weak var spetialsCollectionView: UICollectionView!
    
    
    
    var categories : [DishCategory] = [
        .init(id: "id1", name: "Africa Dish", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish2", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish3", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish4", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish5", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish5", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish5", image: "https://picsum.photos/100/200"),
        .init(id: "id1", name: "Africa Dish5", image: "https://picsum.photos/100/200")

    ]
    
    var populars :[Dish] = [
        .init(id: "Id1", name: "Checken", image: "https://picsum.photos/100/200", description: "This is the best i have ever seen forever This is the best i have ever seen forever This is the best i have ever seen forever This is the best i have ever seen forever" , calories: 34),
        .init(id: "Id1", name: "Endomi", image: "https://picsum.photos/100/200", description: "This is the best i have ever seen forever" , calories: 134),
        .init(id: "Id1", name: "Pizza", image: "https://picsum.photos/100/200", description: "This is the best i have ever seen forever" , calories: 42),
        .init(id: "Id1", name: "FriedChecken", image: "https://picsum.photos/100/200", description: "This is the best i have ever seen forever" , calories: 100)
        
    ]
    
    var spetials : [Dish] = [
        
        .init(id: "Id1", name: "Fried Plaintain", image: "https://picsum.photos/100/200", description: "This is the best i have ever seen forever" , calories: 134),
        .init(id: "Id1", name: "Cake", image: "https://picsum.photos/100/200", description: "This is the best i have ever seen forever" , calories: 42),
        .init(id: "Id1", name: "Beans and Garri", image: "https://picsum.photos/100/200", description: "This is the best i have ever seen forever" , calories: 100)
    ]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        catogeryCollectionView.delegate = self
        catogeryCollectionView.dataSource = self
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        spetialsCollectionView.delegate = self
        spetialsCollectionView.dataSource = self
        
        registerCells()
     }
    
    private func registerCells() {
        catogeryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
        spetialsCollectionView.register(UINib(nibName: DishLandscapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.identifier)
    }
    
}

extension HomeViewController : UICollectionViewDelegate , UICollectionViewDataSource {
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case catogeryCollectionView :
            return categories.count

        case popularCollectionView :
            return populars.count
        case spetialsCollectionView :
            return spetials.count
        default : return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch collectionView {
        case catogeryCollectionView :
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
            cell.setup(category: categories[indexPath.row])
            return cell

        case popularCollectionView :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishPortraitCollectionViewCell.identifier, for: indexPath) as! DishPortraitCollectionViewCell
            cell.setup(dish: populars[indexPath.row])
            return cell
        case spetialsCollectionView :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.identifier, for: indexPath) as! DishLandscapeCollectionViewCell
            cell.setup(dish: spetials[indexPath.row])
            return cell
            
        default : return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == catogeryCollectionView {
            
        } else {
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView == popularCollectionView ? populars[indexPath.row] : spetials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    
}
