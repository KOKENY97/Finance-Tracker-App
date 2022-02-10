

import Foundation

class Transfer {
    let value: Double
    let date: String
    let description: String
    let recipient: String
    
    init(value: Double, date: String, description: String, recipient: String) {
        self.value = value
        self.date = date
        self.description = description
        self.recipient = recipient
    }

}
