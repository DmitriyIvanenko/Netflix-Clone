//
//  Extensions.swift
//  Netflix Clone
//
//  Created by Dmytro Ivanenko on 12.09.2023.
//

import Foundation
import UIKit

extension UIImage {
    func resizeTo(size: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        let image = renderer.image { _ in
            self.draw(in: CGRect.init(origin: CGPoint.zero, size: size))
        }
        
        return image.withRenderingMode(self.renderingMode)
    }
}
