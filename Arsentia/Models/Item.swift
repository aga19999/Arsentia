//
//  Item.swift
//  Arsentia
//
//  Created by Marta Lo Iacono  on 29/11/24.
//


 import SwiftUI



struct Item: Identifiable, Hashable {
    private(set) var id: UUID = .init()
    
    var title: String
    var image: UIImage?
    var content: String = ""
    var emotion: [String]  = ["Happy", "Sad", "Calm", "Anxious", "In Love", "Lonely", "Stressed", "Angry"]
    var isFavorite: Bool = false
}
    
var sampleImages: [Item] = [
   
 
    .init(title: "The Scream", image: UIImage(named:"theScream"), content: "Although this iconic work is often associated with existential despair, it also captures the raw, overwhelming force of rage. The distorted figure seems to channel an uncontrollable internal scream, as if releasing years of suppressed anger. The swirling sky and blood-red hues heighten the emotional intensity, creating a sense of rage that spills beyond the figure into the very fabric of the scene." , emotion: ["Angry"], isFavorite: true),
 
    .init(title: "Saturn devouring His Son", image: UIImage(named:"saturnDevouringHisSon"),isFavorite: true),
 
    .init(title: "Judith Slaying Holofernes", image: UIImage(named:"giudittaDecapitaOloferne"),isFavorite: true),
 
    .init(title: "Crucifixion", image: UIImage(named:"crucifixion"),isFavorite: true),
 
   .init(title: "The Burial of the Sardine", image: UIImage(named:"theBurialSardine")),
 
   .init(title: "Figures in a Room", image: UIImage(named:"figuresInARoom")),
    
   .init(title: "Malancholy and mystery of a street", image: UIImage(named:"melancholyAndMystery")),
  
   .init(title: "Study for a Portrait", image: UIImage(named:"studyForAPortrait")),
 
   .init(title: "Anxiety", image: UIImage(named:"anxiety")),
 
   .init(title: "Woman with a hat", image: UIImage(named:"womanWithAHat")),
    
   .init(title: "The sad young man", image: UIImage(named:"sadYoungMan")),
    
   .init(title: "Self Portrait with cropped hair", image: UIImage(named:"selfPortraitWithCroppedHair")),
    
   .init(title: "Woman in a red armchair", image: UIImage(named:"womanInARedArmchair")),
    
   .init(title: "Self portrait with thorn neckless and hummingbird", image: UIImage(named:"necklessHummingbird"))
    
]



