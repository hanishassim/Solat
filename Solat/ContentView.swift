//
//  ContentView.swift
//  Solat
//
//  Created by Hanis on 08/07/2023.
//

import SwiftUI

enum Time {
    case subuh, zohor, asar, maghirb, isyak, special(name: String)
    
    var description: String {
        switch self {
        case .subuh:
            return "Subuh"
        case .zohor:
            return "Zohor"
        case .asar:
            return "Asar"
        case .maghirb:
            return "Maghrib"
        case .isyak:
            return "Isyak"
        case .special(let name):
            return name
        }
    }
    
    var iconName: String {
        switch self {
        case .subuh:
            return "sunrise.fill"
        case .zohor:
            return "sun.max.fill"
        case .asar:
            return "sun.and.horizon.fill"
        case .maghirb:
            return "sunset.fill"
        case .isyak:
            return "moon.fill"
        case .special:
            return "sparkles"
        }
    }
}

struct Schedule {
    let name: Time
    let time: String
}

struct ContentView: View {
    @State private var width: CGFloat? = nil
    
    let times = [
        Schedule(name: .subuh, time: "1111 am"),
        Schedule(name: .zohor, time: "1111 am"),
        Schedule(name: .asar, time: "1111 am"),
        Schedule(name: .maghirb, time: "1111 am"),
        Schedule(name: .isyak, time: "1111 am"),
    ]
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.pink, .purple, .white]), center: .topTrailing, startRadius: 0, endRadius: 300)
                .ignoresSafeArea()
            
            RadialGradient(gradient: Gradient(colors: [.purple, .pink, .clear]), center: .bottomLeading, startRadius: 0, endRadius: 300)
                .ignoresSafeArea()
            
            Color.defaultBackground
                .opacity(0.25)
                .background(.ultraThinMaterial)
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Image(systemName: "clock")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Solat time!")
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.primary)
                
                Spacer()
                
                VStack(alignment: .listRowSeparatorLeading, spacing: 20) {
                    Text("Today's Schedule")
                        .font(.largeTitle)
                        .foregroundStyle(.tertiary)
                    
                    ForEach(times, id: \.name.description) { time in
                        HStack(spacing: 20) {
                            Image(systemName: time.name.iconName)
                                .imageScale(.large)
                                .foregroundColor(.accentColor)
                            Text(time.name.description)
                                .font(.headline)
                                .foregroundStyle(.primary)
                            Text(time.time)
                                .font(.headline)
                                .foregroundStyle(.primary)
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
