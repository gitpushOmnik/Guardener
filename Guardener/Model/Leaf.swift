//
//  Leaf.swift
//  Guardener
//
//  Created by Omkar Nikhal.
//

import Foundation

struct Leaf{
    
    var name: String?
    var leafType: LeafDisease?
    
    init(name: String) {
        self.name = name
        
        if name.contains("Apple Scab") {
            self.leafType = .appleScab
        }
        else if name.contains("Apple Black Rot") {
            self.leafType = .appleBlackRot
        }
        else if name.contains("Apple Rust"){
            self.leafType = .appleRust
        }
        else if name.contains("Healthy"){
            self.leafType = .healthy
        }
        else if name.contains("Powdery Mildew"){
            self.leafType = .powderyMildew
        }
        else if (name.contains("Leaf Spot") || name.contains("Bacterial Spot")){
            self.leafType = .bacterialLeafSpot
        }
        else if name.contains("Common Rust"){
            self.leafType = .commonRust
        }
        else if name.contains("Leaf Blight"){
            self.leafType = .leafBlight
        }
        else if name.contains("Grape Black Rot"){
            self.leafType = .grapeBlackRot
        }
        else if name.contains("Early Blight"){
            self.leafType = .earlyBlight
        }
        else if name.contains("Late Blight"){
            self.leafType = .lateBlight
        }
        else if name.contains("Leaf Scorch"){
            self.leafType = .leafScorch
        }
        else if name.contains("Leaf Mold"){
            self.leafType = .leafMold
        }
        else if name.contains("Target Spot"){
            self.leafType = .targetSpot
        }
        else if name.contains("Mosaic Virus"){
            self.leafType = .mosaicVirus
        }
        else if name.contains("Leaf Curl"){
            self.leafType = .leafCurl
        }
        else if name.contains("Spider Mites"){
            self.leafType = .spiderMites
        }
        else if name.contains("Orange Haunglongbing"){
            self.leafType = .orangeHaunglongbing
        }
    }
    
    var wikiName: String {
        switch leafType {
        case .appleScab:
            return "Apple_scab"
        case .appleBlackRot:
            return "Black_rot"
        case .appleRust:
            return "Gymnosporangium_juniperi-virginianae"
        case .healthy:
            return "Plant_health"
        case .powderyMildew:
            return "Powdery_mildew"
        case .bacterialLeafSpot:
            return "Leaf_spot"
        case .commonRust:
            return "Puccinia_sorghi"
        case .leafBlight:
            return "Blight"
        case .grapeBlackRot:
            return "Black_rot"
        case .earlyBlight:
            return "Alternaria_solani"
        case .lateBlight:
            return "Phytophthora_infestans"
        case .leafScorch:
            return "Leaf_scorch"
        case .leafMold:
            return "Leaf_mold"
        case .targetSpot:
            return "Corynespora_cassiicola"
        case .mosaicVirus:
            return "Mosaic_virus"
        case .leafCurl:
            return "Leaf_curl"
        case .spiderMites:
            return "Spider_mite"
        case .orangeHaunglongbing:
            return "Citrus_greening_disease"
        case .none:
            return ""
        }
    }
    
    var urlString: String {
        switch leafType {
        case .appleScab:
            return "https://www.planetnatural.com/pest-problem-solver/plant-disease/apple-scab"
        case .appleBlackRot:
            return "https://extension.umn.edu/plant-diseases/black-rot-apple"
        case .appleRust:
            return "https://www.planetnatural.com/pest-problem-solver/plant-disease/cedar-apple-rust"
        case .healthy:
            return "https://www.planetnatural.com/pest-problem-solver/houseplant-pests/"
        case .powderyMildew:
            return "https://www.planetnatural.com/pest-problem-solver/plant-disease/powdery-mildew"
        case .bacterialLeafSpot:
            return "https://www.planetnatural.com/pest-problem-solver/plant-disease/bacterial-leaf-spot"
        case .commonRust:
            return "https://www.planetnatural.com/pest-problem-solver/plant-disease/common-rust"
        case .leafBlight:
            return "https://www.gardentech.com/disease/leaf-blight"
        case .grapeBlackRot:
            return "https://www.gardeningknowhow.com/edible/fruits/grapes/black-rot-grape-treatment.htm"
        case .earlyBlight:
            return "https://www.planetnatural.com/pest-problem-solver/plant-disease/early-blight"
        case .lateBlight:
            return "https://www.planetnatural.com/pest-problem-solver/plant-disease/late-blight"
        case .leafScorch:
            return "https://www.planetnatural.com/pest-problem-solver/plant-disease/fire-blight"
        case .leafMold:
            return "https://www.planetnatural.com/pest-problem-solver/plant-disease/gray-mold"
        case .targetSpot:
            return "https://www.gardeningknowhow.com/edible/vegetables/tomato/target-spot-on-tomatoes.htm"
        case .mosaicVirus:
            return "https://www.planetnatural.com/pest-problem-solver/plant-disease/mosaic-virus"
        case .leafCurl:
            return "https://www.planetnatural.com/pest-problem-solver/plant-disease/leaf-curl"
        case .spiderMites:
            return "https://www.gardeningknowhow.com/plant-problems/pests/insects/spider-mite-treatment.htm"
        case .orangeHaunglongbing:
            return "https://www.gardeningknowhow.com/edible/fruits/citrus/citrus-greening-disease.htm"
        case .none:
            return ""
        }
    }
    
    var leafName: String {
        switch leafType {
        case .appleScab:
            return "Apple Scab"
        case .appleBlackRot:
            return "Apple Black Rot"
        case .appleRust:
            return "Apple Rust"
        case .healthy:
            return "Healthy"
        case .powderyMildew:
            return "Powdery Mildew"
        case .bacterialLeafSpot:
            return "Bacterial Leaf Spot"
        case .commonRust:
            return "Common Rust"
        case .leafBlight:
            return "Leaf Blight"
        case .grapeBlackRot:
            return "Black Rot"
        case .earlyBlight:
            return "Early Blight"
        case .lateBlight:
            return "Late Blight"
        case .leafScorch:
            return "Leaf Scorch"
        case .leafMold:
            return "Leaf Mold"
        case .targetSpot:
            return "Target Spot"
        case .mosaicVirus:
            return "Mosaic Virus"
        case .leafCurl:
            return "Leaf Curl"
        case .spiderMites:
            return "Spider Mites"
        case .orangeHaunglongbing:
            return "Citrus Greening"
        case .none:
            return ""
        }
    }
}
