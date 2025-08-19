//
//  SpacerView.swift
//  GuruUI
//
//  Created by Пересыпкина И_Г on 11.08.2025.
//

import SwiftUI

struct SpacerView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Spacer")
                .font(.largeTitle)
            
            ScrollView {
                introduction
                evenlySpaced
                minimumLength
                relativeSpacing
            }
        }
        .font(.title3)
        .background(Colors.background.asset.color)
    }
}

private extension SpacerView {
    var introduction: some View {
        VStack {
            HeaderView(
                subtitle: "Introduction",
                desc: "You may notice that when you add new pull-in views, such as Text views, they appear in the center of the screen. You can use the Spacer to push these views apart, away from the center of the screen."
            )
            
            DescView(desc: "Spacers push things away either vertically or horizontally")
            
            Image(systemName: "arrow.up.circle.fill")
            Spacer(minLength: 100)
            Image(systemName: "arrow.down.circle.fill")
            
            HStack {
                Text("Horizontal Spacer")
                Image(systemName: "arrow.left.circle.fill")
                Spacer()
                Image(systemName: "arrow.right.circle.fill")
            }
            .padding(.horizontal)
            
            Colors.blockBackground.asset.color
                .frame(maxHeight: 50)
        }
    }
    
    var evenlySpaced: some View {
        VStack {
            HeaderView(
                subtitle: "Evenly Spaced",
                desc: "Use Spacer to evenly space views horizontally so they look good on any device."
            )
            
            DescView(desc: "Before")
            HStack {
                evenlySpacedNamesExample
                evenlySpacedColorsExample
            }
            
            Spacer()
            
            DescView(desc: "After")
            HStack {
                Spacer()
                evenlySpacedNamesExample
                Spacer()
                evenlySpacedColorsExample
                Spacer()
            }
            
        }
    }
    
    var minimumLength: some View {
        VStack {
            HeaderView(
                subtitle: "Minimum Length",
                desc: "You can set a minimum space to exist between views using the minLength modifier on the Spacer."
            )
            
            Text("No minLength set (system default is used)")
                .bold()
            HStack {
                Image("yosemite")
                    .resizable()
                    .scaledToFit()
                Spacer()
                Text("This is Yosemite National Park").lineLimit(1)
            }
            .padding()
            
            Text("minLength = 0")
                .bold()
            HStack {
                Image("yosemite")
                    .resizable()
                    .scaledToFit()
                Spacer(minLength: 0)
                Text("This is Yosemite National Park").lineLimit(1)
            }
            .padding()
            
            Text("minLength = 20")
                .bold()
            HStack {
                Image("yosemite")
                    .resizable()
                    .scaledToFit()
                Spacer(minLength: 20)
                Text("This is Yosemite National Park").lineLimit(1)
            }
            .padding()
            
        }
    }
    
    var relativeSpacing: some View {
        VStack {
            HeaderView(
                subtitle: "Relative Spacing",
                desc: "You can add more spacers to create relative spacing in comparison to other spacers."
            )
            
            HStack(spacing: 50) {
                VStack(spacing: 5) {
                    Spacer()
                        .frame(width: 5)
                        .background(Color.blue)
                    Text("33% Down")
                    Spacer()
                        .frame(width: 5)
                        .background(Color.blue)
                    Spacer()
                        .frame(width: 5)
                        .background(Color.blue)
                }
                VStack(spacing: 5) {
                    Spacer()
                        .frame(width: 5)
                        .background(Color.blue)
                    Spacer()
                        .frame(width: 5)
                        .background(Color.blue)
                    Spacer()
                        .frame(width: 5)
                        .background(Color.blue)
                    Text("75% Down")
                    Spacer()
                        .frame(width: 5)
                        .background(Color.blue)
                }
            }
            
            DescView(desc: "You can also use Spacers horizontally to place views a percentage from the leading or trailing sides of the screen.")
        }
    }
    
    var evenlySpacedNamesExample: some View {
        VStack(alignment: .leading) {
            Text("Names")
                .font(.largeTitle)
                .underline()
            Text("Chase")
            Text("Rodrigo")
            Text("Mark")
            Text("Evans")
        }
    }
    
    var evenlySpacedColorsExample: some View {
        VStack(alignment: .leading) {
            Text("Colors")
                .font(.largeTitle)
                .underline()
            Text("Red")
            Text("Orange")
            Text("Green")
            Text("Blue")
        }
    }
}

#Preview {
    SpacerView()
}
