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
    var content: String = ""
    var emotion: [String] = ["Happy", "Sad", "Calm", "Anxious", "In Love", "Lonely", "Stressed", "Angry"]
    var isFavorite: Bool = false
    var imageName: String
}
    
var sampleImages: [Item] = [
   
 
    .init(title: "The Scream", content: "Although this iconic work is often associated with existential despair, it also captures the raw, overwhelming force of rage. The distorted figure seems to channel an uncontrollable internal scream, as if releasing years of suppressed anger. The swirling sky and blood-red hues heighten the emotional intensity, creating a sense of rage that spills beyond the figure into the very fabric of the scene." , emotion: ["Angry"], isFavorite: true, imageName: "theScream"),
 
    .init(title: "Saturn devouring His Son", isFavorite: true, imageName: "saturnDevouringHisSon"),
 
    .init(title: "Judith Slaying Holofernes",  isFavorite: true, imageName: "giudittaDecapitaOloferne"),
 
    .init(title: "Crucifixion", isFavorite: true, imageName: "crucifixion"),
 
    .init(title: "The Burial of the Sardine", imageName: "theBurialSardine"),
 
    .init(title: "Figures in a Room", imageName: "figuresInARoom"),
    
    .init(title: "Malancholy and mystery of a street", imageName: "melancholyAndMystery"),
  
    .init(title: "Study for a Portrait", imageName: "studyForAPortrait"),
 
    .init(title: "Anxiety", imageName: "anxiety"),
 
    .init(title: "Woman with a hat", imageName: "womanWithAHat"),
    
    .init(title: "The sad young man", imageName: "sadYoungMan"),
    
    .init(title: "Self Portrait with cropped hair", imageName: "selfPortraitWithCroppedHair"),
    
    .init(title: "Woman in a red armchair", imageName: "womanInARedArmchair"),
    
    .init(title: "Self portrait with thorn neckless and hummingbird", imageName: "selfPortraitWithThornNecklessAndHummingbird")
    
]



