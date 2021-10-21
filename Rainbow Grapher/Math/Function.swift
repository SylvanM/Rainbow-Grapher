//
//  Function.swift
//  Rainbow Grapher
//
//  Created by Sylvan Martin on 10/16/21.
//

import Foundation
import Numerics
import MatrixKit

// MARK: Function definition
 
/**
 * Static structure that defines the function to be used in this whole application
 */
public struct Function {
    
    // MARK: Type Descriptions
    
    /**
     * The type of vector used for this functoin
     */
    typealias VectorType = Complex<Double>
    
    /**
     * A struct representing the rectangular window over which to view this function
     */
    struct FunctionWindow {
        
        /**
         * The horizontal bounds
         */
        var horizontal: ClosedRange<Double>
        
        /**
         * The vertical bounds
         */
        var vertical: ClosedRange<Double>
        
        /**
         * The width of this window
         */
        var width: Double {
            vertical.upperBound - vertical.lowerBound
        }
        
        /**
         * The height of this window
         */
        var height: Double {
            horizontal.upperBound - horizontal.lowerBound
        }
        
        /**
         * The aspect ratio of this window
         */
        var aspectRatio: Double {
            return width / height
        }
        
    }
    
    // MARK: Static Definitions
    
    /**
     * The window for this graph to be visualized
     */
    static let window = FunctionWindow(
        horizontal: -5...5,
        vertical: -5...5
    )
    
    /**
     * The function to be visualized by this application
     */
    static func function(_ z: VectorType) -> VectorType {
        let z5 = z * z * z * z * z
        let z3 = z * z * z
        let iz = Complex<Double>(0, 1) * z
        return z5 + 4 * z3 + 3 * iz - 3
    }
    
}
