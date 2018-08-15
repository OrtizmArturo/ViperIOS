//
//  CameraModuleViewController.swift
//  VIperTemplate
//
//  Created by Arturo Ortiz on 7/12/18.
//  Copyright © 2018 Arturo Ortiz. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
import TesseractOCR
import TesseractOCR
import GPUImage

class CameraModuleViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate, G8TesseractDelegate {

    // MARK: Properties
    var session: AVCaptureSession?
    var device: AVCaptureDevice?
    var input: AVCaptureDeviceInput?
    var prevLayer: AVCaptureVideoPreviewLayer?
    var output = AVCapturePhotoOutput()

    
    var foundImage = UIImage()

    var presenter: CameraModulePresentation?

    let viewBox = CameraModuleBox()

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.shadow = true
        
        let backImage = UIImage.init(named: "back.png")
        let barButton = UIBarButtonItem.init(image: backImage,
                                             style: .plain,
                                             target: self,
                                             action: #selector(goBack))
        self.navigationItem.leftBarButtonItem = barButton

        
        viewBox.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(viewBox)
        viewBox.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        viewBox.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        viewBox.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0).isActive = true
        viewBox.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true

        createSession()

//        let timer = Timer.scheduledTimer(timeInterval: 3.0,
//                                         target: self,
//                                         selector: #selector(getText),
//                                         userInfo: nil,
//                                         repeats: true)
        
        let tapGesture1 = UITapGestureRecognizer.init(target: self, action: #selector(tapPressed))
        let tapGesture2 = UITapGestureRecognizer.init(target: self, action: #selector(tapPressed))
        let tapGesture3 = UITapGestureRecognizer.init(target: self, action: #selector(tapPressed))
        let tapGesture4 = UITapGestureRecognizer.init(target: self, action: #selector(tapPressed))
        viewBox.blur1.addGestureRecognizer(tapGesture1)
        viewBox.blur2.addGestureRecognizer(tapGesture2)
        viewBox.blur3.addGestureRecognizer(tapGesture3)
        viewBox.blur4.addGestureRecognizer(tapGesture4)
        viewBox.addGestureRecognizer(tapGesture1)
        viewBox.btnTakePhoto.addTarget(self, action: #selector(getPhoto), for: .touchUpInside)
        viewBox.btngetText.addTarget(self, action: #selector(getText), for: .touchUpInside)
        viewBox.brightSlider.addTarget(self, action: #selector(brightChanged(sender:)), for: .valueChanged)
        viewBox.conSlider.addTarget(self, action: #selector(contrastChanged(sender:)), for: .valueChanged)

    }
    
    @objc func brightChanged(sender:UISlider) {
        let roundedStepValue = sender.value
//        let roundedStepValue = round(sender.value / 1) * 1
//        sender.value = roundedStepValue
        //print("Slider step value \(Int(roundedStepValue))")
        
        let aCGImage = foundImage.cgImage
        let aCIImage = CIImage(cgImage: aCGImage!)
        let context = CIContext(options: nil)
        let brightnessFilter = CIFilter(name: "CIColorControls")
        brightnessFilter?.setValue(aCIImage, forKey: "inputImage")
        
        brightnessFilter?.setValue(roundedStepValue, forKey: "inputBrightness")
        let outputImage = brightnessFilter?.outputImage!
        let cgimg = context.createCGImage(outputImage!, from: outputImage!.extent)
        let newUIImage = UIImage(cgImage: cgimg!)
        viewBox.thumb.image = newUIImage
        
        //print("brightness")

        
    }

    @objc func contrastChanged(sender:UISlider) {
        let roundedStepValue = sender.value
//        let roundedStepValue = round(sender.value / 1) * 1
//        sender.value = roundedStepValue
//        print("Slider step value \(Int(roundedStepValue))")
        
        let aUIImage = foundImage
        let aCGImage = foundImage.cgImage
        
        let aCIImage = CIImage(cgImage: aCGImage!)
        let context = CIContext(options: nil)
        let contrastFilter = CIFilter(name: "CIColorControls")
        contrastFilter?.setValue(aCIImage, forKey: "inputImage")
        contrastFilter?.setValue(roundedStepValue, forKey: "inputContrast")
        let outputImage = contrastFilter?.outputImage!
        let cgimg = context.createCGImage(outputImage!, from: outputImage!.extent)
        let newUIImage = UIImage(cgImage: cgimg!)
        viewBox.thumb.image = newUIImage
        //print("contrast")

    }

    @objc func tapPressed() {
        self.view.endEditing(true)
    }
    
    func checkImage(img: UIImage) {
        print("TESSERACT")
        
        let tesseract: G8Tesseract = G8Tesseract(language:"eng")
        tesseract.delegate = self
        tesseract.pageSegmentationMode = .circleWord
        tesseract.charWhitelist = "01234567890"
        tesseract.charBlacklist = "ABCDEFGHIJKLMNOPQRSTUVWXYZ.abcdefghijklmnopqrstuvwxyz"
        tesseract.image = img
        tesseract.recognize()
        
        print(tesseract.recognizedText)
        var foundText = tesseract.recognizedText ?? "Texto no reconocido."
        foundText = foundText.replacingOccurrences(of: " ", with: "")
        foundText = foundText.replacingOccurrences(of: "\n", with: "")
    
        var first4 = foundText
        if foundText.count >= 6{
            first4 = foundText.substring(to:foundText.index(foundText.startIndex, offsetBy: 6))
        }
        viewBox.mileage.text = first4

    }
    
    @objc func getPhoto() {
        print("getImage")
        let photoSettings = AVCapturePhotoSettings()
        photoSettings.isHighResolutionPhotoEnabled = true
        if (self.input?.device.isFlashAvailable)! {
            photoSettings.flashMode = .auto
        }
        if let firstAvailablePreviewPhotoPixelFormatTypes = photoSettings.availablePreviewPhotoPixelFormatTypes.first {
            photoSettings.previewPhotoFormat = [kCVPixelBufferPixelFormatTypeKey as String: firstAvailablePreviewPhotoPixelFormatTypes]
        }
        output.capturePhoto(with: photoSettings, delegate: self)
    }
    
    @objc func getText() {
        
        foundImage = increaseContrast(value: 2)
        let noiseR = GPUImageBilateralFilter()
        foundImage = noiseR.image(byFilteringImage: foundImage)

//        let filter = GPUImageAdaptiveThresholdFilter()
//        filter.blurRadiusInPixels = 20
//        foundImage = filter.image(byFilteringImage: foundImage)

//        let sharpenImage = GPUImageSharpenFilter()
//        sharpenImage.sharpness = 4.0
//        foundImage = sharpenImage.image(byFilteringImage: foundImage)
//
//        let grayScale = GPUImageGrayscaleFilter()
//        foundImage = grayScale.image(byFilteringImage: foundImage)
//
//        let contrast = GPUImageContrastFilter()
//        contrast.contrast = 4.0
//        foundImage = contrast.image(byFilteringImage: foundImage)
        
//        let invert = GPUImageColorInvertFilter()
//        foundImage = invert.image(byFilteringImage: foundImage)

        viewBox.thumb.image = foundImage
        checkImage(img: foundImage)

    }
    
    func increaseContrast(value:Int) -> UIImage {
        
        /////////////Binarisation//////////////
        let context = CIContext(options: nil)
        let filter = CIFilter(name: "CIPhotoEffectMono")
        filter!.setValue(CIImage(image: foundImage), forKey: "inputImage")
        let outputImage = filter!.outputImage
        let cgimg = context.createCGImage(outputImage!, from: (outputImage?.extent)!)

        /////////////Binarisation//////////////

        let roundedStepValue = value
        let aCIImage = CIImage(cgImage: cgimg!)
        let contrastFilter = CIFilter(name: "CIColorControls")
        contrastFilter?.setValue(aCIImage, forKey: "inputImage")
        contrastFilter?.setValue(roundedStepValue, forKey: "inputContrast")
        let outputImage2 = contrastFilter?.outputImage!
        let cgimg2 = context.createCGImage(outputImage2!, from: outputImage2!.extent)
        
        let newUIImage = UIImage(cgImage: cgimg2!)
        return newUIImage
    }
    
    override func viewDidLayoutSubviews() {
    }
    
    @objc func goBack() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func createSession() {
        session = AVCaptureSession()
        device = AVCaptureDevice.default(for: AVMediaType.video)
        
        do {
            if (device?.isFocusModeSupported(.continuousAutoFocus))! {
                try! device?.lockForConfiguration()
                device?.focusMode = .continuousAutoFocus
                device?.autoFocusRangeRestriction = .none
                device?.unlockForConfiguration()
            }
            input = try AVCaptureDeviceInput.init(device: device!)
            session?.addInput(input!)

        } catch  {
        }
        
        
        prevLayer = AVCaptureVideoPreviewLayer(session: session!)
        //prevLayer?.frame.size = viewBox.frame.size
        prevLayer?.frame.size = CGSize.init(width: self.view.bounds.width, height: self.view.bounds.height)
        prevLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        
        prevLayer?.connection?.videoOrientation = transformOrientation(orientation: UIInterfaceOrientation(rawValue: UIApplication.shared.statusBarOrientation.rawValue)!)
        
        viewBox.cameraView.layer.insertSublayer(prevLayer!, at: 0)
        if (session?.canAddOutput(output))! {
            session?.addOutput(output)
            output.isHighResolutionCaptureEnabled = true
            output.isLivePhotoCaptureEnabled = (output.isLivePhotoCaptureSupported)
        }

        session?.startRunning()
    }

    
    func transformOrientation(orientation: UIInterfaceOrientation) -> AVCaptureVideoOrientation {
        switch orientation {
        case .landscapeLeft:
            return .landscapeLeft
        case .landscapeRight:
            return .landscapeRight
        case .portraitUpsideDown:
            return .portraitUpsideDown
        default:
            return .portrait
        }
    }
    
    func imageWithImage(image: UIImage, croppedTo rect: CGRect) -> UIImage {
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        let drawRect = CGRect(x: -rect.origin.x, y: -rect.origin.y, width: image.size.width, height: image.size.height)
        context?.clip(to: CGRect(x: 0, y: 0,width: rect.size.width, height: rect.size.height))
        image.draw(in: drawRect)
        let subImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return subImage!
    }

    func transformRect(imageSize:CGSize) -> CGRect {
        //print("phone size: \(self.view.bounds)")
        //print("photo size: \(imageSize)")
        let cRect = viewBox.marco.frame
        //print("frame size: \(cRect)")
        let fullRect = self.view.convert(viewBox.marco.frame, from: viewBox.viewmid)
        //print("fullRect size: \(fullRect)")
        
        let photoWidth = imageSize.width
        let photoHeight = imageSize.height
        
        let frameWidth = viewBox.marco.frame.size.width
        let frameHeight = viewBox.marco.frame.size.height
        let frameX = fullRect.origin.x
        let frameY = fullRect.origin.y
        
        let phoneWidth = self.view.frame.size.width
        let phoneHeight = self.view.frame.size.height
        
        let perW = floor(((frameWidth*100)/phoneWidth))
        let perH = floor(((frameHeight*100)/phoneHeight))
        
        let perX = floor(((frameX*100)/phoneWidth))
        let perY = floor(((frameY*100)/phoneHeight))
        
        let okWidth = floor(photoWidth*(perW/100))
        let okHeight = floor(photoHeight*(perH/100))
        
        let okX = floor(photoWidth*(perX/100))
        let okY = floor(photoHeight*(perY/100))
        let rect = CGRect.init(x: okX, y: okY, width: okWidth, height: okHeight)

        return rect
    }

    
}

extension CameraModuleViewController: AVCapturePhotoCaptureDelegate {
    
    func photoOutput(_ captureOutput: AVCapturePhotoOutput, didFinishProcessingPhoto photoSampleBuffer: CMSampleBuffer?, previewPhoto previewPhotoSampleBuffer: CMSampleBuffer?, resolvedSettings: AVCaptureResolvedPhotoSettings, bracketSettings: AVCaptureBracketedStillImageSettings?, error: Error?) {
        
        if let error = error {
            print("Error capturing photo: \(error)")
        } else {
            if let sampleBuffer = photoSampleBuffer, let previewBuffer = previewPhotoSampleBuffer, let dataImage = AVCapturePhotoOutput.jpegPhotoDataRepresentation(forJPEGSampleBuffer: sampleBuffer, previewPhotoSampleBuffer: previewBuffer) {
                
                if let image = UIImage(data: dataImage) {
                    //self.capturedImage.image = image
                }
            }
        }
        
    }
    
    @available(iOS 11.0, *)
    func photoOutput(_ output: AVCapturePhotoOutput, didFinishProcessingPhoto photo: AVCapturePhoto, error: Error?) {
        
        guard let data = photo.fileDataRepresentation(),
            let image =  UIImage(data: data)  else {
                return
        }
        
        let rectOK = transformRect(imageSize: image.size)
        let miniImg = imageWithImage(image: image, croppedTo: rectOK)
        viewBox.thumbOriginal.image = miniImg
        foundImage = miniImg
        viewBox.thumb.image = foundImage

    }
    
    
}

extension CameraModuleViewController: CameraModuleView {
    // TODO: implement view output methods
}
