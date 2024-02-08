import Foundation
import Combine

struct Quote: Codable, Equatable {
    let quote: String
    let author: String
}

class QuotesProvider: ObservableObject {
    @Published var currentQuote: Quote = Quote(quote: "Quote could not be loaded", author: "Author could not be loaded")
    private var quotes: [Quote] = []
    private var lastIndex: Int?
    private var timer: Timer?
    
    
    init() {
        loadQuotesFromJSON()
        self.currentQuote = getRandomQuote()
        setupTimer()
    }
    
    func changeQuote() {
        resetTimer()
        currentQuote = getRandomQuote()
    }
    
    
    private func loadQuotesFromJSON() {
        guard let url = Bundle.main.url(forResource: "Quotes", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("Error loading the quotes JSON file.")
            return
        }
        
        let decoder = JSONDecoder()
        if let loadedQuotes = try? decoder.decode([Quote].self, from: data) {
            self.quotes = loadedQuotes
        } else {
            print("Error decoding the quotes JSON file.")
        }
    }
    
    private func getRandomQuote() -> Quote {
        var newIndex: Int
        repeat {
            newIndex = Int.random(in: 0..<quotes.count)
        } while quotes.count > 1 && newIndex == lastIndex // Repeat if the new index is the same as the last index and there are more than one quote
        
        lastIndex = newIndex // Store the new index as the last index
        return quotes[newIndex]
    }
    
    private func setupTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 300, repeats: true) { [weak self] _ in
            self?.changeQuote()
        }
    }
    
    private func resetTimer() {
        timer?.invalidate() // Stop the current timer
        setupTimer() // Start a new timer
    }
    
    deinit {
        timer?.invalidate()
    }
}
