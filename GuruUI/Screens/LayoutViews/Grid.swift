import SwiftUI

struct GridContentView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("")
                .font(.largeTitle)
            
            ScrollView {
                introBlock
                comparisonBlock
                columnCountBlock
                noGridRowBlock
                sizingBlock
                unSizingBlock
                alignmentBlock
                spacing
                cellColumns
            }
        }
    }
    
    private var introBlock: some View {
        VStack {
            HeaderView(subtitle: "Introduction",
                       desc: "The Grid creates invisible columns that views in other rows will follow.")
            Grid {
                GridRow {
                    Text("Column 1")
                    Color.blue
                        .opacity(0.5)
                        .overlay(Text("Column 2"))
                        .frame(height: 50)
                }
                GridRow {
                    Text("Column 1")
                }
                GridRow {
                    Text("Column 1")
                    Image(systemName: "arrow.left")
                }
            }
            .font(.title)
        }
    }
    
    private var comparisonBlock: some View {
        VStack {
            HeaderView(subtitle: "Comparison",
                       desc: "If you create the same view using VStacks and HStacks you can better understand how a Grid view creates invisible columns where other views do not. Without a Grid, other views follow their own layout and alignment rules.")
            VStack {
                HStack {
                    Text("Column 1")
                    Color.blue
                        .opacity(0.5)
                        .overlay(Text("Column 2"))
                        .frame(height: 50)
                }
                HStack {
                    Text("Column 1")
                }
                HStack {
                    Text("Column 1")
                    Image(systemName: "arrow.left")
                }
            }
        }
        .font(.title)
    }
    
    private var columnCountBlock: some View {
        VStack {
            HeaderView(subtitle: "Column Count", 
                       desc: "The grid row with the most views will establish how many columns there will be. Views within a GridRow will always stay within a column.")
            Grid {
                GridRow {
                    ForEach(1..<3) { number in
                        Image(systemName: "\(number).square")
                    }
                }
                GridRow {
                    ForEach(1..<5) { number in
                        Image(systemName: "\(number).square")
                    }
                }
                GridRow {
                    ForEach(1..<8) { number in
                        Image(systemName: "\(number).square")
                    }
                }
            }
            .font(.largeTitle)
        }
    }
    
    private var noGridRowBlock: some View {
        VStack {
            HeaderView(subtitle: "No GridRow",
                       desc: "This view is in the Grid but NOT inside a GridRow. This means it will follow its own layout rules and not be restricted to the columns the other GridRows create.")
            Grid {
                GridRow {
                    Text("Column 1")
                    Text("Column 2")
                }
                GridRow {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.blue.opacity(0.5))
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.orange.opacity(0.5))
                        .frame(width: 150)
                }
                .frame(height: 50)
                
                RoundedRectangle(cornerRadius: 16)
                .fill(Color.red.opacity(0.5))
                .frame(height: 50)
                
                GridRow {
                    RoundedRectangle(cornerRadius: 16)
                        .fill(Color.blue.opacity(0.5))
                }
                .frame(height: 50)
            }
            .font(.title)
            
        }
    }
    
    private var sizingBlock: some View {
        VStack {
            HeaderView(subtitle: "Sizing",
                       desc: "A width is set to this column, but as you can see, it does not determine the width of the whole column. The second row’s width is “stronger” for this column. How do you make it “weaker” so the second row’s column width is the same? The height is set for this view but how do you get the other views in this row (blue and orange) to not expand beyond this height?")
            Grid {
                GridRow {
                    Color.blue.opacity(0.5)
                    Color.orange.opacity(0.5)
                        .frame(width: 75)
                    Color.red.opacity(0.5)
                }
                .frame(height: 50)
                
                GridRow {
                    Color.blue.opacity(0.5)
                    Color.orange.opacity(0.5)
                    Color.red.opacity(0.5)
                        .frame(height: 20)
                }
                .frame(height: 50)
            }
        }
    }
    
    private var unSizingBlock: some View {
        VStack {
            HeaderView(subtitle: "Unsized Axes",
                       desc: "By using the unsized axes modifier, you are telling that grid cell not to size itself but to rather use the size of the other views in the same row/column (vertical/horizontal). You will also notice that this also affects the height/width of the entire Grid as it pulls in horizontally and vertically. This is something to keep in mind when using this view and designing your UI.")
            Grid {
                GridRow {
                    Color.blue.opacity(0.5)
                    Color.orange.opacity(0.5)
                        .frame(width: 75)
                    Color.red.opacity(0.5)
                }
                .frame(height: 50)
                
                GridRow {
                    Color.blue.opacity(0.5)
                        .gridCellUnsizedAxes(.vertical)
                    Color.orange.opacity(0.5)
                        .gridCellUnsizedAxes(.vertical)
                        .gridCellUnsizedAxes(.horizontal)
                    Color.red.opacity(0.5)
                }
                .frame(height: 50)
            }
        }
    }
    
    private var alignmentBlock: some View {
        VStack {
            HeaderView(subtitle: "Alignmant",
                       desc: "You can set alignment for all views on a grid level. The default alignment is center. You can override the Grid alignment by setting alignment on the GridRow. You can override the GridRow alignment by setting alignment on the grid cell using a modifier.")
            Grid(alignment: .top) {
                GridRow {
                    Text("Top")
                    Color.blue.opacity(0.5)
                }
                .frame(height: 200)
                GridRow(alignment: .bottom) {
                    Text("Bottom")
                    VStack(alignment: .trailing) {
                        Text("Top")
                        Text("Trailing")
                    }
                    .gridCellAnchor(.topTrailing)
                    Color.blue.opacity(0.5)
                }
                .frame(height: 200)
            }
            .padding()
            .font(.title)
        }
    }
    
    private var spacing: some View {
        VStack {
            HeaderView(subtitle: "Spacing",
                       desc: "You can set horizontal and vertical spacing for all views within the Grid.")
            Grid(horizontalSpacing: 24, verticalSpacing: 24) {
                GridRow {
                    Color.green.opacity(0.5)
                    Color.green.opacity(0.5)
                    Color.green.opacity(0.5)
                }
                .frame(height: 50)
                GridRow {
                    Color.blue.opacity(0.5)
                    Color.orange.opacity(0.5)
                    Color.red.opacity(0.5)
                }
                .frame(height: 50)
                GridRow {
                    Color.blue.opacity(0.5)
                    Color.orange.opacity(0.5)
                    Color.red.opacity(0.5)
                }
                .frame(height: 50)
                GridRow {
                    Color.orange.opacity(0.5)
                    Color.orange.opacity(0.5)
                    Color.red.opacity(0.5)
                }
                .frame(height: 50)
            }
        }
    }
    
    private var cellColumns: some View {
        VStack {
            HeaderView(subtitle: "Cell Columns",
                       desc: "You can have cells span multiple columns with a modifier.")
            Grid(horizontalSpacing: 24, verticalSpacing: 24) {
                GridRow {
                    Color.green.opacity(0.5)
                        .gridCellColumns(3)
                }
                .frame(height: 50)
                GridRow {
                    Color.blue.opacity(0.5)
                    Color.red.opacity(0.5)
                        .gridCellColumns(2)
                }
                .frame(height: 50)
                GridRow {
                    Color.blue.opacity(0.5)
                    Color.orange.opacity(0.5)
                    Color.red.opacity(0.5)
                }
                .frame(height: 50)
                GridRow {
                    Color.orange.opacity(0.5)
                        .gridCellColumns(2)
                    Color.red.opacity(0.5)
                }
                .frame(height: 50)
            }
        }
    }
}


#Preview {
    GridContentView()
}
