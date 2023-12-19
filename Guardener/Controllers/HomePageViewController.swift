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


/// The view controller responsible for the home page of the Guardener app.
class HomePageViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    /// Image view displaying the user-selected image.
    @IBOutlet weak var userImageView: UIImageView!
    
    /// Label displaying the description of the leaf disease.
    @IBOutlet weak var descriptionLabel: UILabel!
    
    /// Button triggering the treatment view.
    @IBOutlet weak var treatmentButton: UIButton!
    
    /// Image picker for capturing leaf images.
    let imagePicker = UIImagePickerController()
    
    /// URL for Wikipedia API.
    let wikipediaURL = "https://en.wikipedia.org/w/api.php"
    
    /// Name of the leaf for Wikipedia search.
    var wikiName = ""
    
    /// URL string for leaf disease information.
    var urlString = ""
    
    override func viewWillAppear(_ animated: Bool) {
        if let nav = navigationController?.navigationBar {
            // Configure navigation bar appearance.
            let standardAppearance = UINavigationBarAppearance()
            standardAppearance.backgroundColor = UIColor.green
            standardAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
            nav.barTintColor = UIColor.black
            nav.standardAppearance = standardAppearance
            nav.scrollEdgeAppearance = standardAppearance
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Set the title and initial description.
        navigationItem.title = "Guardener"
        descriptionLabel.text = "Press the camera button on the top right corner to click a picture of a leaf"
        treatmentButton.isHidden = true
        imagePicker.delegate = self
    }
    
    /// Action triggered when the treatment button is pressed.
    @IBAction func treatmentButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToWebView", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToWebView" {
            // Pass the URL to the web view controller.
            let destinationVC = segue.destination as! WKWebViewController
            destinationVC.webURL = urlString
        }
    }
    
    /// Action triggered when the camera button is pressed.
    @IBAction func cameraButtonPressed(_ sender: UIBarButtonItem) {
        imagePicker.sourceType = .camera
        imagePicker.allowsEditing = true
        present(imagePicker, animated: true)
    }
    
    /// Delegate method called when an image is picked from the camera.
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        // Process the picked image.
        guard let imagePicked = info[.editedImage] as? UIImage else {
            fatalError("Failed to store the image captured by the user")
        }
        
        userImageView.image = imagePicked
        if let ciimage = CIImage(image: imagePicked) {
            // Perform leaf classification.
            performClassification(ciimage: ciimage)
        }
        
        treatmentButton.isHidden = false
        imagePicker.dismiss(animated: true)
    }
    
    /// Perform leaf disease classification using Core ML and Vision.
    func performClassification(ciimage: CIImage) {
        do {
            let model = try VNCoreMLModel(for: LeafDiseaseClassifier(configuration: MLModelConfiguration()).model)
            
            let request = VNCoreMLRequest(model: model) { request, error in
                if error != nil {
                    print("Error performing classification \(error!)")
                } else {
                    if let topResult = request.results?.first as? VNClassificationObservation {
                        self.getDisease(diseaseName: topResult.identifier)
                    }
                }
            }
            
            let handler = VNImageRequestHandler(ciImage: ciimage)
            
            do {
                try handler.perform([request])
            }
        } catch {
            print("Error loading the model \(error)")
        }
    }
    
    /// Retrieve detailed information about the leaf disease from a custom Leaf class.
    func getDisease(diseaseName: String) {
        var leafDisease = Leaf(name: diseaseName)
        
        wikiName = leafDisease.wikiName
        urlString = leafDisease.urlString
        
        DispatchQueue.main.async {
            self.navigationItem.title = leafDisease.leafName
            self.extractDescription(name: self.wikiName)
        }
    }
    
    /// Extract the description of the leaf disease from Wikipedia using Alamofire and SwiftyJSON.
    func extractDescription(name: String) {
        let parameters: [String: String] = [
            "format": "json",
            "action": "query",
            "prop": "extracts|pageimages",
            "exintro": "",
            "explaintext": "",
            "titles": name,
            "redirects": "1",
            "pithumbsize": "500",
            "indexpageids": ""
        ]
        
        AF.request(wikipediaURL, method: .get, parameters: parameters).responseJSON { response in
            switch response.result {
            case .success(let value):
                let leafJSON = JSON(value)
                
                let pageid = leafJSON["query"]["pageids"][0].stringValue
                
                let leafDescription = leafJSON["query"]["pages"][pageid]["extract"].stringValue
                
                DispatchQueue.main.async {
                    self.descriptionLabel.text = leafDescription
                }
                
            case .failure(let error):
                print("Error \(String(describing: error))")
                DispatchQueue.main.async {
                    self.descriptionLabel.text = "Connection Issues"
                }
            }
        }
    }
}
