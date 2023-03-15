//
//  Leaf.swift
//  Guardener
//
//  Created by Omkar Nikhal on 3/14/23.
//

import Foundation

struct Leaf{
    
    var name = ""
    var wikiName = ""
    var temp = ""
    var urlString = "https://www.planetnatural.com/pest-problem-solver/plant-disease/"
    
    mutating func compute() {
        
        if name.contains("Apple Scab"){
            self.wikiName = "Apple_scab"
            self.urlString += "apple-scab"
            self.temp = "Apple Scab"
        }
        else if name.contains("Apple Black Rot"){
            self.wikiName = "Black_rot"
            self.urlString = "https://extension.umn.edu/plant-diseases/black-rot-apple"
            self.temp = "Apple Black Rot"
        }
        else if name.contains("Apple Rust"){
            self.wikiName = "Gymnosporangium_juniperi-virginianae"
            self.urlString += "cedar-apple-rust"
            self.temp = "Apple Rust"
        }
        else if name.contains("Healthy"){
            self.wikiName = "Plant_health"
            self.urlString = "https://www.planetnatural.com/pest-problem-solver/houseplant-pests/"
            self.temp = "Healthy"
        }
        else if name.contains("Powdery Mildew"){
            self.wikiName = "Powdery_mildew"
            self.urlString += "powdery-mildew"
            self.temp = "Powdery Mildew"
        }
        else if (name.contains("Leaf Spot") || name.contains("Bacterial Spot")){
            self.wikiName = "Leaf_spot"
            self.urlString += "bacterial-leaf-spot"
            self.temp = "Bacterial Leaf Spot"
        }
        else if name.contains("Common Rust"){
            self.wikiName = "Puccinia_sorghi"
            self.urlString += "common-rust"
            self.temp = "Common Rust"
        }
        else if name.contains("Leaf Blight"){
            self.wikiName = "Blight"
            self.urlString = "https://www.gardentech.com/disease/leaf-blight"
            self.temp = "Leaf Blight"
        }
        else if name.contains("Grape Black Rot"){
            self.wikiName = "Black_rot"
            self.urlString = "https://www.gardeningknowhow.com/edible/fruits/grapes/black-rot-grape-treatment.htm"
            self.temp = "Grape Black Rot"
        }
        else if name.contains("Early Blight"){
            self.wikiName = "Alternaria_solani"
            self.urlString += "early-blight"
            self.temp = "Early Blight"
        }
        else if name.contains("Late Blight"){
            self.wikiName = "Phytophthora_infestans"
            self.urlString += "late-blight"
            self.temp = "Late Blight"
        }
        else if name.contains("Leaf Scorch"){
            self.wikiName = "Leaf_scorch"
            self.urlString += "fire-blight"
            self.temp = "Leaf Scorch"
        }
        else if name.contains("Leaf Mold"){
            self.wikiName = "Leaf_mold"
            self.urlString += "gray-mold"
            self.temp = "Leaf Mold"
        }
        else if name.contains("Target Spot"){
            self.wikiName = "Corynespora_cassiicola"
            self.urlString = "https://www.gardeningknowhow.com/edible/vegetables/tomato/target-spot-on-tomatoes.htm"
            self.temp = "Target Spot"
        }
        else if name.contains("Mosaic Virus"){
            self.wikiName = "Mosaic_virus"
            self.urlString += "mosaic-virus"
            self.temp = "Mosaic Virus"
        }
        else if name.contains("Leaf Curl"){
            self.wikiName = "Leaf_curl"
            self.urlString += "leaf-curl"
            self.temp = "Leaf Curl"
        }
        else if name.contains("Spider Mites"){
            self.wikiName = "Spider_mite"
            self.urlString =     "https://www.gardeningknowhow.com/plant-problems/pests/insects/spider-mite-treatment.htm"
            self.temp = "Spider Mites"
        }
        else if name.contains("Orange Haunglongbing"){
            self.wikiName = "Citrus_greening_disease"
            self.urlString = "https://www.gardeningknowhow.com/edible/fruits/citrus/citrus-greening-disease.htm"
            self.temp = "Orange Haunglongbing"
        }
    }
    
    func getwikiName() -> String{
        return self.wikiName
    }
    
    func geturlString() -> String{
        return self.urlString
    }
    
    func getName() -> String{
        return self.temp
    }
    
}
