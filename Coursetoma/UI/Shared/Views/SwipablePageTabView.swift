//
//  SwipeablePageTabView.swift
//  Coursetoma
//
//  Created by Jamiu Jimoh on 16/02/2025.
//

import SwiftUI

struct SwipablePageTabView<T: SwipablePageEnumConstraints, Content: View>: View where T.AllCases: RandomAccessCollection {
//struct SwipablePageTabView<Content: View>: View {
    @Binding var selectedTab: T
    @Namespace private var namespace
    @State private var scrollPosition = ScrollPosition(idType: T.self)
    let childView: (T) -> Content
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                ForEach(T.allCases) { tab in
                    VStack {
                        HStack {
                            Spacer()
                            Text("\(tab)".capitalized)
                                .font(.subheadline.weight(.semibold))
                                .foregroundStyle(selectedTab == tab ? .appPrimary : .appFontSubheadline )
                            Spacer()
                        }
                        .padding(.horizontal, 12)
                        
                        Group {
                            if selectedTab == tab {
                                Rectangle()
                                    .fill(.appPrimary)
                                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                            } else {
                                Rectangle()
                                    .fill(.clear)
                            }
                        }
                        .frame(height: 1)
                    }
                    .onTapGesture {
                        withAnimation(.spring()) {
                            scrollPosition.scrollTo(id: tab)
                        }
                    }
                }
            }
            .padding(.horizontal)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(T.allCases, id: \.self) { tab in
                        childView(tab)
                            .onScrollVisibilityChange { isVisible in
                                if isVisible {
                                    withAnimation(.spring()) {
                                        selectedTab = tab
                                    }
                                }
                            }
                            .scrollTargetLayout()
                    }
                    .containerRelativeFrame(.horizontal)
                }
                .frame(maxHeight: .infinity)
            }
            .scrollPosition($scrollPosition, anchor: .center)
            .scrollTargetBehavior(.viewAligned)
            .scrollIndicators(.hidden)

        }
    }
}

#Preview {
    enum CourseType: String, SwipablePageEnumConstraints {
        case teaching
        case enrolled
        
        var id: String { self.rawValue }
    }
    
    return SwipablePageTabView(selectedTab: .constant(CourseType.teaching)) { tab in
        Text("\(tab)")
    }
}

protocol SwipablePageEnumConstraints: Hashable, CaseIterable, Identifiable { }
