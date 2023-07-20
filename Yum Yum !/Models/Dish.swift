

import Foundation

struct Dish {
    
    let id , name , image , description  : String?
    let calories : Int?
    
    
    var formattedCalories : String {
        return "\(calories ?? 0 ) Calories"
    }
    
}
