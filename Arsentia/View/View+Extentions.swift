//
//  View+Extentions.swift
//  Arsentia
//
//  Created by Marta Lo Iacono  on 30/11/24.
//

import SwiftUI

extension View {
    var safeArea: UIEdgeInsets {
        if let safeArea = (UIApplication.shared.connectedScenes.first as? UIWindowScene)?.keyWindow?.safeAreaInsets {
            return safeArea
        }
        
        return .zero
    }
    
    @ViewBuilder
    func offsetY(result: @escaping (CGFloat) -> ()) -> some View {
        self
            .overlay{
                GeometryReader{
                    let minY = $0.frame(in: .scrollView(axis: .vertical)).minY
                    Color.clear
                        .preference(key: OffsetKey.self, value: minY)
                        .onPreferenceChange(OffsetKey.self, perform: { value in
                            result(value)
                            
                        })
                    
                }
            }
    }
    
}

struct OffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
