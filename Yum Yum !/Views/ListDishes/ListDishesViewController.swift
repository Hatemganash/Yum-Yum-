 
import UIKit

class ListDishesViewController: UIViewController {
    
    @IBOutlet weak var tabelView: UITableView!
    
    var category : DishCategory!
    
    var dishes : [Dish] = [
        .init(id: "Id1", name: "Checken", image: "https://picsum.photos/100/200", description: "This is the best i have ever seen forever This is the best i have ever seen forever This is the best i have ever seen forever This is the best i have ever seen forever" , calories: 34),
        .init(id: "Id1", name: "Endomi", image: "https://picsum.photos/100/200", description: "This is the best i have ever seen forever" , calories: 134),
        .init(id: "Id1", name: "Pizza", image: "https://picsum.photos/100/200", description: "This is the best i have ever seen forever" , calories: 42),
        .init(id: "Id1", name: "FriedChecken", image: "https://picsum.photos/100/200", description: "This is the best i have ever seen forever" , calories: 100)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = category.title
        registerCells()
        
    }
    
    private func registerCells() {
        tabelView.register(UINib(nibName: DishListTableViewCell.identifier , bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
    }
    

}

extension ListDishesViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath) as! DishListTableViewCell
        cell.setup(dish: dishes[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = dishes[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
    
}
