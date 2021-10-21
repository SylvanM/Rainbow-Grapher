//
//  GraphWindowController.swift
//  Rainbow Grapher
//
//  Created by Sylvan Martin on 10/16/21.
//

import AppKit

class GraphWindowDelegate: NSWindowController, NSWindowDelegate {
    
    // MARK: Window Properties
    
    /**
     * The graph shown in this view
     */
    var graphViewController: GraphViewController {
        contentViewController as! GraphViewController
    }
    
    // MARK: Window Controller
    
    /**
     * Called when the window is about to resize
     */
    func windowWillResize(_ sender: NSWindow, to frameSize: NSSize) -> NSSize {
        
        // we want to fix the aspect ratio
        
        let aspectRatio = Function.window.aspectRatio
        
        let heightAdjusted  = NSSize(width: (frameSize.height * CGFloat(aspectRatio)), height: frameSize.height)
        let widthAdjusted   = NSSize(width: frameSize.width, height: frameSize.width / CGFloat(aspectRatio))
            
        return sender.frame.height != frameSize.height ? heightAdjusted : widthAdjusted
    }

    /**
     * Called when the window is starting to be resized
     */
    func windowWillStartLiveResize(_ notification: Notification) {
        graphViewController.windowResizingStarted()
    }
    
    /**
     * Called when the window has resized
     */
    func windowDidEndLiveResize(_ notification: Notification) {
        graphViewController.windowResizingEnded()
    }
    
    
    

}
