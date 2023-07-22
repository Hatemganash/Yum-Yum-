
import UIKit

class ListOrdersViewController: UIViewController {

    @IBOutlet weak var tabelView: UITableView!
    
    var orders : [Order] = [
        .init(id: "Id1", name: "Endomi",dish: .init(id: "Id1", name: "Macarona m3afena", image: "https://picsum.photos/100/200", description: "This is the best i have ever seen forever" , calories: 134)) ,
        .init(id: "Id1", name: "Pizza",dish: .init(id: "Id1", name: "Ayy 3aaakkkkk ", image: "https://picsum.photos/100/200", description: "This is the best i have ever seen forever" , calories: 134)),
        .init(id: "Id1", name: "Grace Okawara",dish: .init(id: "Id1", name: "Haaateeemmmm", image: "https://picsum.photos/100/200", description: "This is the best i have ever seen forever" , calories: 134))
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Orders"
      registerCells()
    }
    
    private func registerCells () {
        tabelView.register(UINib(nibName: DishListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: DishListTableViewCell.identifier)
        
    }

}
extension ListOrdersViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return orders.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DishListTableViewCell.identifier, for: indexPath
        ) as! DishListTableViewCell
        cell.setup(order: orders[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DishDetailViewController.instantiate()
        controller.dish = orders[indexPath.row].dish
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
}
