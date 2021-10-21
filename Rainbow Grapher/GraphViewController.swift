//
//  ViewController.swift
//  Rainbow Grapher
//
//  Created by Sylvan Martin on 10/16/21.
//

import Cocoa

import Numerics
import CoreGraphics

class GraphViewController: NSViewController {
    
    // MARK: Properties
    
    @IBOutlet weak var graphView: NSImageView!
    
    // MARK: View Controller

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    override func viewDidAppear() {
        graphFunction()
    }
    
    // MARK: View Updates
    
    func windowResizingStarted() {
        releaseView()
    }
    
    func windowResizingEnded() {
        constrainView()
        graphFunction()
    }
    
    // MARK: View Functoins
    
    /**
     * Release the constraints on the graphView so that the view can be resized
     */
    func releaseView() {
        NSLayoutConstraint.deactivate(graphView.constraints)
    }
    
    /**
     * Reactivate constraints
     */
    func constrainView() {
        
        let topConstraint = NSLayoutConstraint(
            item: graphView as Any,
            attribute: .top,
            relatedBy: .equal,
            toItem: view,
            attribute: .top,
            multiplier: 1,
            constant: 0
        )
        
        let leadingConstraint = NSLayoutConstraint(
            item: graphView as Any,
            attribute: .leading,
            relatedBy: .equal,
            toItem: view,
            attribute: .leading,
            multiplier: 1,
            constant: 0
        )
        
        let bottomConstraint = NSLayoutConstraint(
            item: graphView as Any,
            attribute: .bottom,
            relatedBy: .equal,
            toItem: view,
            attribute: .bottom,
            multiplier: 1,
            constant: 0
        )
        
        let trailingConstraint = NSLayoutConstraint(
            item: graphView as Any,
            attribute: .trailing,
            relatedBy: .equal,
            toItem: view,
            attribute: .trailing,
            multiplier: 1,
            constant: 0
        )
        
        NSLayoutConstraint.activate([topConstraint, bottomConstraint, leadingConstraint, trailingConstraint])
    }
    
    /**
     * Graphs the function accoring to the new window size
     */
    func graphFunction() {
        
        var vectorField = VectorField<Function.VectorType>(forFunction: Function.function, overWindow: Function.window, forRect: graphView.bounds)
        
        let horizontalAxis  = Set<Function.VectorType>.horizontalAxis(width: 0.001)
        let verticalAxis    = Set<Function.VectorType>.verticalAxis(width: 0.001)
        let mandlebrot      = Set<Complex<Double>>.mandlebrot()
        
        vectorField.overlaySet(set: horizontalAxis, color: .black)
        vectorField.overlaySet(set: verticalAxis, color: .black)
        vectorField.overlaySet(set: mandlebrot, color: .black)
        
        let pixels = NSImageView.convertToPixels(for: vectorField)

        graphView.setPixels(pixels)

    }

}

