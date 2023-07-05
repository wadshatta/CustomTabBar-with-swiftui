//
//  CustomTabView.swift
//  CustomTabBar
//
//  Created by MacBook Pro on 05/07/2023.
//

import SwiftUI

struct CustomTabView: View {
    @Binding  var TabSelection : Int
    @Namespace private var animationNamespace
    let tabBarItem:[(image:String,title:String)] =  [
        ("house","Home"),
        ("magnifyingglass","Search"),
        ("heart","Favorites"),
        ("person","Profile"),
        ("gear","Settings"),
    ]
    var body: some View {
        ZStack{
            Capsule()
                .frame(height: 80)
                .foregroundColor(Color(.secondarySystemBackground))
                .shadow(radius: 1)
            HStack{
                ForEach(0..<5){ index in
                    Button{
                        TabSelection = index + 1
                    } label: {
                        VStack(spacing: 8){
                            Spacer()
                            
                            Image(systemName: tabBarItem[index].image)
                            Text(tabBarItem[index].title)
                            
                            if index + 1 == TabSelection {
                                Capsule()
                                    .frame(height: 8)
                                    .foregroundColor(.blue)
                                    .matchedGeometryEffect(id: "selectedTabId", in:
                                    animationNamespace
                                    )
                                    .offset(y:3)
                            }
                            else{
                                frame(height: 8)
                                    .foregroundColor(.clear)
                                    .offset(y:3)
                            }
                        }
                        .foregroundColor(index + 1 == TabSelection ? .blue : .gray)
                    }
                }
            }
            .frame(height: 80)
            .clipShape(Capsule())
        }
        .padding(.horizontal)
        
    }
}

struct CustomTabView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabView(TabSelection: .constant(1))
            .previewLayout(.sizeThatFits)
            .padding(.vertical)
    }
}
