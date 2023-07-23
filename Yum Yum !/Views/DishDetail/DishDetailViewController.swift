
import UIKit
import ProgressHUD

class DishDetailViewController: UIViewController {
    
    @IBOutlet weak var dishImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var caloriesLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var nameField: UITextField!
    
    
    var dish : Dish!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        populateView()

    }
    
    private func populateView () {
        
        dishImageView.kf.setImage(with: dish.image?.asUrl)
        titleLabel.text = dish.name
        caloriesLabel.text = dish.formattedCalories
        descriptionLabel.text = dish.description
        
    }
    
    
    @IBAction func placeOrderButtonClicked(_ sender: Any) {
        guard let name = nameField.text?.trimmingCharacters(in: .whitespaces) ,
              !name.isEmpty else {
            ProgressHUD.showError("Please Enter Your Name")
            return
        }
        ProgressHUD.show("Placing Order ... ")
        NetworkService.shared.placeOrder(dishId: dish.id ?? "", name: name) { [weak self](result) in
            switch result {
            case . success(_):
                ProgressHUD.showSuccess("Your Order Has Been Recieved")
                self!.nameField.text = ""
            case .failure(let error) :
                ProgressHUD.showError(error.localizedDescription)
            }
        }
    }
    



}
