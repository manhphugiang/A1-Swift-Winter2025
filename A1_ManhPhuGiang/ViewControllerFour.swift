//
//  ViewControllerFour.swift
//  A1_ManhPhuGiang
//
//  Created by ManhPhu Giang on 2025-02-17.
//

import Foundation
import UIKit

class ViewControllerFour: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet var resultLabel: UILabel!
    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var uploadButton: UIButton!
    
    var isCorrectAnswer = true

    override func viewDidLoad() {
        super.viewDidLoad()
        resultLabel.text = isCorrectAnswer ? "✅ Correct Answer Congrat!" : "❌ Wrong Answer!"
    }
    @IBAction func uploadImage(_ sender: UIButton) {
           // image picker for photo library
           let imagePickerController = UIImagePickerController()
           imagePickerController.delegate = self
           imagePickerController.sourceType = .photoLibrary
           self.present(imagePickerController, animated: true, completion: nil)
       }
       
       // user selects a photo
       func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
           if let selectedImage = info[.originalImage] as? UIImage {
               profileImageView.image = selectedImage
           }
           dismiss(animated: true, completion: nil)
       }
}
