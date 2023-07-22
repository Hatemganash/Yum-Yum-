import UIKit
import ProgressHUD


class HomeViewController: UIViewController {
    
    @IBOutlet weak var catogeryCollectionView: UICollectionView!
    
    @IBOutlet weak var popularCollectionView: UICollectionView!
    
    @IBOutlet weak var specialsCollectionView: UICollectionView!
    
    
    
    var categories : [DishCategory] = []
    
    var populars : [Dish] = []
    
    var specials : [Dish] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        catogeryCollectionView.delegate = self
        catogeryCollectionView.dataSource = self
        popularCollectionView.delegate = self
        popularCollectionView.dataSource = self
        specialsCollectionView.delegate = self
        specialsCollectionView.dataSource = self
        
        registerCells()
        ProgressHUD.show()
        NetworkService.shared.fetchAllCategories { [weak self] result  in
            switch result {
            case .success(let allDishes):
                ProgressHUD.dismiss()
                
                self?.categories = allDishes.categories ?? []
                self?.populars = allDishes.populars ?? []
                self?.specials = allDishes.specials ?? []
                
                self?.catogeryCollectionView.reloadData()
                self?.popularCollectionView.reloadData()
                self?.specialsCollectionView.reloadData()
                
            case .failure(let error):
                ProgressHUD.showError(error.localizedDescription)
            }
        }
        
     }
    
    private func registerCells() {
        catogeryCollectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
        popularCollectionView.register(UINib(nibName: DishPortraitCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishPortraitCollectionViewCell.identifier)
        specialsCollectionView.register(UINib(nibName: DishLandscapeCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: DishLandscapeCollectionViewCell.identifier)
    }
    
}

extension HomeViewController : UICollectionViewDelegate , UICollectionViewDataSource {
  
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView {
        case catogeryCollectionView :
            return categories.count

        case popularCollectionView :
            return populars.count
        case specialsCollectionView :
            return specials.count
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
        case specialsCollectionView :
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishLandscapeCollectionViewCell.identifier, for: indexPath) as! DishLandscapeCollectionViewCell
            cell.setup(dish: specials[indexPath.row])
            return cell
            
        default : return UICollectionViewCell()
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == catogeryCollectionView {
            let controller = ListDishesViewController.instantiate()
            controller.category = categories[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        } else {
            let controller = DishDetailViewController.instantiate()
            controller.dish = collectionView == popularCollectionView ? populars[indexPath.row] : specials[indexPath.row]
            navigationController?.pushViewController(controller, animated: true)
        }
    }
    
    
}
