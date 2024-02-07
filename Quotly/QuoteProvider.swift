import Foundation
import Combine

struct Quote {
    let quote: String
    let author: String
}

class QuotesProvider: ObservableObject {
    private let quotes: [Quote] = [
        Quote(quote: "The only limit to our realization of tomorrow will be our doubts of today.", author: "Franklin D. Roosevelt"),
        Quote(quote: "Success is not final, failure is not fatal: It is the courage to continue that counts.", author: "Winston S. Churchill"),
        Quote(quote: "It does not matter how slowly you go as long as you do not stop.", author: "Confucius"),
        Quote(quote: "The future belongs to those who believe in the beauty of their dreams.", author: "Eleanor Roosevelt"),
        Quote(quote: "Tell me and I forget. Teach me and I remember. Involve me and I learn.", author: "Benjamin Franklin"),
        Quote(quote: "The best and most beautiful things in the world cannot be seen or even touched - they must be felt with the heart.", author: "Helen Keller"),
        Quote(quote: "It is during our darkest moments that we must focus to see the light.", author: "Aristotle"),
        Quote(quote: "Whoever is happy will make others happy too.", author: "Anne Frank"),
        Quote(quote: "Do not go where the path may lead, go instead where there is no path and leave a trail.", author: "Ralph Waldo Emerson"),
        Quote(quote: "You will face many defeats in life, but never let yourself be defeated.", author: "Maya Angelou"),
        Quote(quote: "The only thing necessary for the triumph of evil is for good men to do nothing.", author: "Edmund Burke"),
        Quote(quote: "Life is really simple, but we insist on making it complicated.", author: "Confucius"),
        Quote(quote: "In the end, it's not the years in your life that count. It's the life in your years.", author: "Abraham Lincoln"),
        Quote(quote: "Never let the fear of striking out keep you from playing the game.", author: "Babe Ruth"),
        Quote(quote: "Life is either a daring adventure or nothing at all.", author: "Helen Keller"),
        Quote(quote: "Many of life's failures are people who did not realize how close they were to success when they gave up.", author: "Thomas A. Edison"),
        Quote(quote: "You have brains in your head. You have feet in your shoes. You can steer yourself any direction you choose.", author: "Dr. Seuss"),
        Quote(quote: "An unexamined life is not worth living.", author: "Socrates"),
        Quote(quote: "Your time is limited, don't waste it living someone else's life.", author: "Steve Jobs"),
        Quote(quote: "Winning isn't everything, but wanting to win is.", author: "Vince Lombardi"),
        Quote(quote: "I have learned over the years that when one's mind is made up, this diminishes fear.", author: "Rosa Parks"),
        Quote(quote: "I alone cannot change the world, but I can cast a stone across the water to create many ripples.", author: "Mother Teresa"),
        Quote(quote: "Whether you think you can or you think you can't, you're right.", author: "Henry Ford"),
        Quote(quote: "The only way to do great work is to love what you do.", author: "Steve Jobs"),
        Quote(quote: "I find that the harder I work, the more luck I seem to have.", author: "Thomas Jefferson"),
        Quote(quote: "The journey of a thousand miles begins with one step.", author: "Lao Tzu"),
        Quote(quote: "What you get by achieving your goals is not as important as what you become by achieving your goals.", author: "Zig Ziglar"),
        Quote(quote: "The greatest glory in living lies not in never falling, but in rising every time we fall.", author: "Nelson Mandela"),
        Quote(quote: "The way to get started is to quit talking and begin doing.", author: "Walt Disney"),
        Quote(quote: "The pessimist sees difficulty in every opportunity. The optimist sees opportunity in every difficulty.", author: "Winston Churchill"),
        Quote(quote: "Don’t judge each day by the harvest you reap but by the seeds that you plant.", author: "Robert Louis Stevenson"),
        Quote(quote: "The best time to plant a tree was 20 years ago. The second best time is now.", author: "Chinese Proverb"),
        Quote(quote: "It’s not whether you get knocked down, it’s whether you get up.", author: "Vince Lombardi"),
        Quote(quote: "If you set your goals ridiculously high and it's a failure, you will fail above everyone else's success.", author: "James Cameron"),
        Quote(quote: "Life is what happens when you're busy making other plans.", author: "John Lennon"),
        Quote(quote: "You miss 100% of the shots you don't take.", author: "Wayne Gretzky"),
        Quote(quote: "I don't measure a man's success by how high he climbs but how high he bounces when he hits bottom.", author: "George S. Patton"),
        Quote(quote: "If you want to live a happy life, tie it to a goal, not to people or things.", author: "Albert Einstein"),
        Quote(quote: "Never give in except to convictions of honor and good sense.", author: "Winston Churchill"),
        Quote(quote: "The most difficult thing is the decision to act, the rest is merely tenacity.", author: "Amelia Earhart"),
        Quote(quote: "Every strike brings me closer to the next home run.", author: "Babe Ruth"),
        Quote(quote: "Definiteness of purpose is the starting point of all achievement.", author: "W. Clement Stone"),
        Quote(quote: "We must balance conspicuous consumption with conscious capitalism.", author: "Kevin Kruse"),
        Quote(quote: "Life is 10% what happens to us and 90% how we react to it.", author: "Charles R. Swindoll"),
        Quote(quote: "The mind is everything. What you think you become.", author: "Buddha"),
        Quote(quote: "The best revenge is massive success.", author: "Frank Sinatra"),
        Quote(quote: "Life is about making an impact, not making an income.", author: "Kevin Kruse"),
        Quote(quote: "Eighty percent of success is showing up.", author: "Woody Allen"),
        Quote(quote: "Your time is precious, so don't waste it living someone else's life.", author: "Steve Jobs"),
        Quote(quote: "Winning isn’t everything, but wanting to win is.", author: "Vince Lombardi")
    ]

    
    private var lastIndex: Int?
    
    @Published var currentQuote: Quote = Quote(quote: "", author: "")
    
    init() {
        self.currentQuote = getRandomQuote()
    }
    
    func changeQuote() {
        currentQuote = getRandomQuote()
    }
    
    func getRandomQuote() -> Quote {
        var newIndex: Int
        repeat {
            newIndex = Int.random(in: 0..<quotes.count)
        } while quotes.count > 1 && newIndex == lastIndex // Repeat if the new index is the same as the last index and there are more than one quote
        
        lastIndex = newIndex // Store the new index as the last index
        return quotes[newIndex]
    }
}
