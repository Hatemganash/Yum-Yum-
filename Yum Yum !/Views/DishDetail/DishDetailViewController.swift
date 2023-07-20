
import UIKit

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
        
        
    }
    



}
