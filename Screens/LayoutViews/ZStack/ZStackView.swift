import SwiftUI

struct ZStackView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("ZStack")
                .font(.largeTitle)
            
            ScrollView {
                introductionBlock
                safeArea
                layering
                aligning
            }
        }
        .font(.title3)
        .background(Colors.background.asset.color)
    }
}

private extension ZStackView {
    var introductionBlock: some View {
        VStack {
            HeaderView(subtitle: "Introduction", desc: "ZStacks are great for setting a background color. But notice the Color stops at the Safe Areas edges (white areas on top and bottom. \n The “Safe Area” is the part of the view where important UI elements can safely go without being covered up by things like the notch from the phone or the home indicator bar at the bottom.")
        }
    }
    
    var safeArea: some View {
        VStack {
            HeaderView(subtitle: "Ignores Safe Area Edges",
                       desc: "Ignoring the Safe Areas will extend a view to fill the whole scene.")
            
            DescView(desc: "Having the ZStack edges ignoring the safe area edges might be a mistake. \nYou notice that the top Text view is completely under the notch.")
            
            HeaderView(subtitle: "Color Ignores Safe Area Edges", desc: "To solve the problem, you want just the color (bottom layer) to ignore the safe area edges and fill the screen. Other layers above it will stay within the Safe Area.")
            
        }
    }
    
    var layering: some View {
        VStack {
            HeaderView(
                subtitle: "Layering",
                desc: "ZStacks are great for layering views. For example, putting text on top of an image."
            )
            
            ZStack {
                Image("yosemite")
                    .resizable()
                    .scaledToFit()
                
                Rectangle()
                    .fill(Color.white.opacity(0.6))
                    .frame(maxWidth: .infinity, maxHeight: 50)
                
                Text("Yosemite National Park")
            }
            
            DescView(desc: "But what if you wanted to have all the views align to the bottom?")
        }
    }
    
    var aligning: some View {
        VStack {
            HeaderView(
                subtitle: "Aligning",
                desc: "The ZStack allows you to align all the views within it."
            )
            
            ZStack(alignment: .topLeading) {
                Image("yosemite")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Rectangle()
                    .fill(Color.white.opacity(0.6))
                    .frame(maxWidth: .infinity, maxHeight: 60)
                
                Text("Yosemite National Park")
                    .font(.title)
                    .padding()
            }
            
            ZStack(alignment: .bottomTrailing) {
                Image("yosemite")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                
                Rectangle()
                    .fill(Color.white.opacity(0.6))
                    .frame(maxWidth: .infinity, maxHeight: 60)
                
                Text("Yosemite National Park")
                    .font(.title)
                    .padding()
            }
            
            DescView(desc: "ZStack Alignment Choices:\ncenter \nleading \ntrailing \ntop \nbottom \ntopLeading \ntopTrailing \nbottomLeading \nbottomTrailing")
        }
    }
}

#Preview {
    ZStackView()
}
