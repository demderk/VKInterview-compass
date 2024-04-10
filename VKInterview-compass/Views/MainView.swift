//
//  MainView.swift
//  VKInterview-compass
//
//  Created by Roman Zheglov on 09.04.2024.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var vm: MainVM = MainVM()
    
    let width = 416.0
    let markersGap: Double = 176
    
    var body: some View {
        VStack {
            Spacer().frame(height: 64)
            ZStack {
                ZStack {
                    Rectangle()
                        .fill(.primary)
                        .opacity(0.5)
                        .frame(width: 2, height: 128)
                    Rectangle()
                        .fill(.primary)
                        .opacity(0.5)
                        .frame(width: 6, height: 64)
                        .offset(y: -166)
                    Rectangle()
                        .fill(.primary)
                        .opacity(0.5)
                        .frame(width: 128, height: 2)
                }.frame(width: 128, height: 320)
                ZStack {
                    ForEach(0..<180) { position in
                        ZStack {
                            Capsule()
                                .fill(.primary)
                                .clipped(antialiased: true)
                                .frame(width: position % 15 == 0 ? 3 : 1,
                                       height: 20)
                                .offset(y: (width - 128) / 2)
                                .rotationEffect(.init(degrees: Double(position) * 2))
                            if (position % 15 == 0) {
                                Text(String(position * 2))
                                    .rotationEffect(.degrees(180))
                                    .offset(y: (width - 80) / 2)
                                    .rotationEffect(.init(degrees: Double(position) * 2))
                            }
                        }
                    }
                    Text("N")
                        .font(Font.title3.weight(.bold))
                        .offset(y: (width - markersGap) / 2)
                    Text("E")
                        .font(Font.title3.weight(.bold))
                        .offset(y: (width - markersGap) / 2)
                        .rotationEffect(.init(degrees: 90))
                    Text("S")
                        .font(Font.title3.weight(.bold))
                        .offset(y: (width - markersGap) / 2)
                        .rotationEffect(.init(degrees: 180))
                    Text("W")
                        .font(Font.title3.weight(.bold))
                        .offset(y: (width - markersGap) / 2)
                        .rotationEffect(.init(degrees: 270))
                    
                }.frame(width: width, height: width)
                    .rotationEffect(.degrees(-vm.rotationDegree+180))
                
            }
            Text("\(Int(vm.rotationDegree))°")
                .font(.largeTitle.weight(.semibold))
                .transaction { transaction in
                    transaction.animation = nil
                }
            Spacer()
        }
    }
}

#Preview {
    MainView()
}
