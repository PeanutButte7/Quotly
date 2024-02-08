import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @StateObject private var quotesProvider = QuotesProvider()
    
    // Track the offset during drag
    @State private var dragOffset: CGFloat = 0
    
    var body: some View {
        HStack(alignment: .center) {
            VStack(spacing: 0.0) {
                Text(quotesProvider.currentQuote.quote)
                    .font(.title)
                    .fontWeight(.medium)
                    .multilineTextAlignment(.center)
                    .padding()
                
                Text("– " + quotesProvider.currentQuote.author)
                    .font(.subheadline)
                    
            }
            
            Button("Next quote", systemImage: "chevron.right", action: {
                withAnimation {
                    quotesProvider.changeQuote()
                }
            })
            .help("You can also swipe on the text")
            .labelStyle(.iconOnly)
            .buttonBorderShape(.circle)
            .controlSize(.regular)
        }
        .transition(.opacity)
        .animation(.default, value: quotesProvider.currentQuote)
        .padding(.all, 20.0)
        .offset(x: dragOffset) // Apply the offset here
        .gesture(
            DragGesture()
                .onChanged { gesture in
                    if (gesture.translation.width >= 0) {
                        dragOffset = gesture.translation.width
                    }
                }
                .onEnded { value in
                    if value.translation.width > 100 { // Threshold to trigger the change
                        withAnimation {
                            quotesProvider.changeQuote()
                        }
                    }
                    dragOffset = 0 // Reset the offset
                }
        )
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
