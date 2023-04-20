//
//  HomePageViewController.swift
//  Guardener
//
//  Created by Omkar Nikhal.
//

import UIKit
import AVFoundation
import Vision
import Alamofire
import SwiftyJSON


class HomePageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var treatmentButton: UIButton!
    
    let imagePicker = UIImagePickerController()
    
    let wikipediaURL = "https://en.wikipedia.org/w/api.php"
    
    var wikiName = ""
    
    var urlString = ""
    
    override func viewWillAppear(_ animated: Bool) {
        if let nav = navigationController?.navigationBar{
            let standardAppearance = UINavigationBarAppearance()
            standardAppearance.backgroundColor = UIColor.green
            standardAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
            nav.barTintColor = UIColor.black
            nav.standardAppearance = standardAppearance
            nav.scrollEdgeAppearance = standardAppearance
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Guardener"
        descriptionLabel.text = "Press the camera button on the top right corner to click picture of a leaf"
        treatmentButton.isHidden = true
        imagePicker.delegate = self
    }
    
    @IBAction func treatmentButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToWebView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToWebView"{
            let destinationVC = segue.destination as! WKWebViewController
            destinationVC.webURL = urlString
        }
    }
    
    @IBAction func cameraButtonPressed(_ sender: UIBarButtonItem) {
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let imagePicked = info[.editedImage] as? UIImage
        guard let userImage = imagePicked else{
            fatalError("Failed to store image captures by user")
        }
        
        userImageView.image = userImage
        if let ciimage = CIImage(image: userImage)
        {
            performClassification(ciimage: ciimage)
        }
        
        treatmentButton.isHidden = false
        imagePicker.dismiss(animated: true)
    }
    
    func performClassification(ciimage: CIImage){
        do{
            let model = try VNCoreMLModel(for: LeafDiseaseClassifier(configuration: MLModelConfiguration()).model)
            
            let request = VNCoreMLRequest(model: model) { request, error in
                if(error != nil){
                    print("Error performing classification \(error!)")
                }else{
                    if let topResult = request.results?.first as? VNClassificationObservation{
                        
                        self.getDisease(diseaseName: topResult.identifier)
                    }
                }
            }
            
            let handler = VNImageRequestHandler(ciImage: ciimage)
            
            do{
                try handler.perform([request])
            }
            
        }catch{
            print("Error loading the model \(error)")
        }
    }
    
    func getDisease(diseaseName: String){
    
        var leafDisease = Leaf(name: diseaseName)
        
        wikiName = leafDisease.wikiName
        urlString = leafDisease.urlString
        
        DispatchQueue.main.async{
            self.navigationItem.title = leafDisease.leafName
            self.extractDescription(name: self.wikiName)
        }
        
    }
    
    func extractDescription(name: String){
        
        let parameters : [String:String] = [
            "format" : "json",
            "action" : "query",
            "prop" : "extracts|pageimages",
            "exintro" : "",
            "explaintext" : "",
            "titles" : name,
            "redirects" : "1",
            "pithumbsize" : "500",
            "indexpageids" : ""
        ]
        
        AF.request(wikipediaURL, method: .get, parameters: parameters).responseJSON { (response) in
            switch response.result{
                
            case .success(let value):
                    let leafJSON = JSON(value)
                    
                    let pageid = leafJSON["query"]["pageids"][0].stringValue
                    
                    let leafDescription = leafJSON["query"]["pages"][pageid]["extract"].stringValue
                    
                DispatchQueue.main.async {
                    self.descriptionLabel.text = leafDescription
                }
                    
                break
                
            case .failure(let error):
                print("Error \(String(describing: error))")
                DispatchQueue.main.async{
                    self.descriptionLabel.text = "Connection Issues"
                }
                    break
            }
        }
    }
    
}

