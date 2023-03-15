# Guardener 

## A Leaf Disease Classifier 
This application is written using Swift, AVFoundation and CoreML. The application is used for the identification, detection, and classification of leaf diseases in a particular plant. One of the signs of plants being unhealthy or getting infected is via their leaves. If the leaves of a plant get infected, then it is a good time for gardeners to start applying some treatments to their plants in order to sustain their growth. With the help of this application, users can simply click a picture of a leaf/leaves of their plant that they think is infected with the help of AVFoundation library. Users also have the option of cropping the image or retaking it as per their preference. The application then performs image classification with the help of Machine Learning (specifically Deep Learning) and the CoreML library. The captured image can be classified into 38 different classes. After successful classification, some information about the disease is displayed in the application and a treatment button appears on the screen. Users can then press the treatment button which redirects them to a WebView implemented using the WebKit library. This opens up a WebApp which contains information about the disease, its treatment, and ways to prevent the disease from occurring in the future.

## Dataset 

The dataset being used in the application is trained upon approximately 88,000 images of Plant Village dataset with leaf diseases containing 38 different classes. The dataset is preprocessed and segmented along with different augmentation steps such as flip and rotation to improve its accuracy and precision. 

## Application Features 

### Home Screen 

This is the initial home screen where there is a camera button on the top right corner where the user can click on and upload a picture of a leaf.

<img src="https://github.com/gitpushOmnik/Guardener/blob/main/README%20Images/IMG_2683.jpg" width="275" height="600">

### Camera Permission from the User 

The application asks for camera permission from the user

<img src="https://github.com/gitpushOmnik/Guardener/blob/main/README%20Images/IMG_2684.PNG" width="275" height="600">

### Classification and Displaying Data

After the picture is successfully upload, the Machine Learning Model trained using CreateML and CoreML framework performs its classification and then displays the name of the disease as the navigation bar title. It also displays additional information about the disease below the picture. After the classsification button, a treatment button appears

<img src="https://github.com/gitpushOmnik/Guardener/blob/main/README%20Images/IMG_2687.PNG" width="275" height="600">

<img src="https://github.com/gitpushOmnik/Guardener/blob/main/README%20Images/IMG_2686.PNG" width="275" height="600">

### Treatment

After the treatment button is pressed, a WebView appears where more information about the disease, its cause, prevention and treatment measures are described. The Web App is implemented using WebKit Library

<img src="https://github.com/gitpushOmnik/Guardener/blob/main/README%20Images/RPReplay-Final1678839444.gif" width="275" height="600">

### Pods Used

* Alamofire
* SwiftyJSOn

### Libraries Used

* UIKit
* CoreML
* AVFoundation
* WekKit
* CreateML

