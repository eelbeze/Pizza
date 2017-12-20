//
//  ViewController.swift
//  Pizza
//
//  Created by El BEZE on 18/12/2017.
//  Copyright © 2017 El BEZE. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var previewView: UIView!

    var captureSession: AVCaptureSession? 
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?

    // MARK: - life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCameraToPreviousView()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
         videoPreviewLayer!.frame = previewView.bounds
    }


    // MARK: - Setup camera
    private func setupCameraToPreviousView() {
        attachInputDeviceToCapture()
        showPreviousOfCamera()
        captureSession?.startRunning()
    }

    private func attachInputDeviceToCapture() {
        guard let captureDevice = AVCaptureDevice.default(for: .video) ,
            let input = try? AVCaptureDeviceInput(device: captureDevice) else {
            return
        }

        captureSession = AVCaptureSession()
        captureSession?.addInput(input)
    }

    private func showPreviousOfCamera() {
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession!)
        videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspect
        videoPreviewLayer?.connection?.videoOrientation = .portrait
        previewView.layer.addSublayer(videoPreviewLayer!)
    }

}

