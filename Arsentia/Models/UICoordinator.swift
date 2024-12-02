//
//  UICoordinator.swift
//  Arsentia
//
//  Created by Marta Lo Iacono  on 29/11/24.
//

import SwiftUI



@Observable
class UICoordinator{
    
    // proprietà condivise tra la home e la detail
     var scrollView: UIScrollView = .init(frame: .zero)
     var rect: CGRect = .zero
     var selectedItem: Item?
    // proprietà layer dell'animazione
     var animationLayer: UIImage?
     var animateView: Bool = false
     var hideLayer: Bool = false
    // Root view proprietà
     var hideRootView: Bool = false
    // proprietà della detail
     var headerOffset: CGFloat = .zero
    
    func createVisibleAreaSnapshot() {
        let renderer = UIGraphicsImageRenderer(size: scrollView.bounds.size)
        let image = renderer.image { ctx in
            ctx.cgContext.translateBy(x: -scrollView.contentOffset.x, y: -scrollView.contentOffset.y)
            scrollView.layer.render(in: ctx.cgContext)
        }
        animationLayer = image
    }
    func toggleView(show: Bool, frame: CGRect, post: Item) {
        if show {
            selectedItem = show ? post : nil
            rect = frame
            createVisibleAreaSnapshot()
            hideRootView = true
            
            withAnimation(.easeInOut(duration: 0.3), completionCriteria: .removed) {
                animateView = true
            }completion: {
                self.hideLayer = true
            }
            
        } else {
            hideLayer = false
            withAnimation(.easeInOut(duration: 0.3), completionCriteria: .removed) {
                animateView = false
            }completion: {
                DispatchQueue.main.async {
                    self.resetAnimationProperties()
                }
            }
        }
    }
    private func resetAnimationProperties() {
        headerOffset = 0
        hideRootView = false
        selectedItem = nil
        animationLayer = nil
    }

}

struct ScrollViewExtractor: UIViewRepresentable {
    var result: (UIScrollView) -> ()
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        view.backgroundColor = .clear
        
        DispatchQueue.main.async {
            if let scrollView = view.superview?.superview?.superview as? UIScrollView {
                result(scrollView)
            }
        }
        
        return view
    }
   
    func updateUIView(_ uiView: UIView, context: Context) {
       
   }
}



