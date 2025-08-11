import SwiftUI

struct GridContentView<ViewModel: GridViewModel>: View {
    @StateObject var model: ViewModel
    
    var body: some View {
        VStack(spacing: 10) {
            Text(Ln.Grid.title)
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
        .font(.title3)
        .background(Colors.background.asset.color)
    }
    
    private var introBlock: some View {
        VStack {
            HeaderView(subtitle: Ln.Grid.introductionTitle,
                       desc: Ln.Grid.introductionContext)
            Grid {
                GridRow {
                    Text(Ln.Grid.introductionTextFirst)
                    Color.blue
                        .opacity(0.5)
                        .overlay(Text(Ln.Grid.introductionTextSecond))
                        .frame(height: 50)
                }
                GridRow {
                    Text(Ln.Grid.introductionTextFirst)
                }
                GridRow {
                    Text(Ln.Grid.introductionTextFirst)
                    Image(systemName: "arrow.left")
                }
            }
            .font(.title)
        }
    }
    
    private var comparisonBlock: some View {
        VStack {
            HeaderView(subtitle: Ln.Grid.comparisonTitle,
                       desc: Ln.Grid.comparisonContext)
            VStack {
                HStack {
                    Text(Ln.Grid.comparisonTextFirst)
                    Color.blue
                        .opacity(0.5)
                        .overlay(Text(Ln.Grid.comparisonTextSecond))
                        .frame(height: 50)
                }
                HStack {
                    Text(Ln.Grid.comparisonTextFirst)
                }
                HStack {
                    Text(Ln.Grid.comparisonTextFirst)
                    Image(systemName: "arrow.left")
                }
            }
        }
        .font(.title)
    }
    
    private var columnCountBlock: some View {
        VStack {
            HeaderView(subtitle: Ln.Grid.columnCountTitle,
                       desc: Ln.Grid.columnCountContext)
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
            HeaderView(subtitle: Ln.Grid.noGridRowTitle,
                       desc: Ln.Grid.noGridRowContext)
            Grid {
                GridRow {
                    Text(Ln.Grid.noGridRowTextFirst)
                    Text(Ln.Grid.noGridRowTextSecond)
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
            HeaderView(subtitle: Ln.Grid.sizingTitle,
                       desc: Ln.Grid.sizingContext)
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
            HeaderView(subtitle: Ln.Grid.unSizingTitle,
                       desc: Ln.Grid.unSizingContext)
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
            HeaderView(subtitle: Ln.Grid.alignmentTitle,
                       desc: Ln.Grid.alignmentContext)
            Grid(alignment: .top) {
                GridRow {
                    Text(Ln.Grid.alignmentExampleTop)
                    Color.blue.opacity(0.5)
                }
                .frame(height: 200)
                GridRow(alignment: .bottom) {
                    Text(Ln.Grid.alignmentExampleBottom)
                    VStack(alignment: .trailing) {
                        Text(Ln.Grid.alignmentExampleTop)
                        Text(Ln.Grid.alignmentExampleTrailing)
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
            HeaderView(subtitle: Ln.Grid.spacingTitle,
                       desc: Ln.Grid.spacingContext)
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
            HeaderView(subtitle: Ln.Grid.cellColumnsTitle,
                       desc: Ln.Grid.cellColumnsContext)
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
    GridContentView(model: GridViewModelImpl())
}
