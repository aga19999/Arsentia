import UIKit

struct Opera: Identifiable, Codable {
    var id = UUID()
    let title: String
    let file:  String
    var favorite = false//l'opera inzialmente non sarà tra i preferiti
    var emotion: String = ""
}

