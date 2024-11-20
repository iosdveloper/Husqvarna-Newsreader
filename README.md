# Husqvarna-Newsreader

Overview
The NewsReader app is a SwiftUI-based iOS application that allows users to browse news articles fetched from a public news API. Users can filter news by categories, view full article details, and bookmark articles for later reading. The app demonstrates modern iOS development practices, including the use of SwiftUI, Core Data, and MVVM architecture.

Features
1. Browse News Articles:
    * Fetch articles from the News API.
    * Display article titles, summaries, and images in a user-friendly interface.
2. Category Filtering:
    * Filter news by category (e.g., General, Technology, Sports).
    * API calls automatically trigger when a new category is selected.
3. Read Full Articles:
    * Tap on an article to view its full content.
4. Bookmarking:
    * Save articles to bookmarks for offline reading.
    * View and manage bookmarked articles using Core Data.

Technical Details
Architecture
The app follows the MVVM (Model-View-ViewModel) architecture to ensure separation of concerns and maintainability.
Technologies Used
* SwiftUI: For building the user interface.
* Core Data: For persistent storage of bookmarked articles.
* URLSession: For making API calls to fetch news articles.
* Combine: To manage state and data flow between components.

Setup Instructions
Prerequisites
* Xcode 14.0+.
* iOS 15.0+ device or simulator.
* A valid API key from NewsAPI.
Steps to Run
1. Clone the repository:bash Copy code   git clone https://github.com/your-username/NewsReader.git  
2. Open the project in Xcode:bash Copy code   cd NewsReader
3. open NewsReader.xcodeproj   
4. Replace the placeholder YOUR_API_KEY in the fetchNews(for:) function with your News API key.
5. Build and run the app on a simulator or device:
    * Command + R.

How It Works
Core Features
Fetching News
* The app fetches news articles from the News API based on the selected category.
* API responses are parsed into a NewsArticle model and displayed in the UI.
Category Filtering
* A Picker control allows users to select a category.
* The app automatically triggers an API call when the selection changes using the .onChange modifier.
Bookmarking
* Users can save articles to Core Data for offline viewing.
* The CoreDataManager handles all database operations (save, fetch, delete).
View Full Articles
* Users can tap on a news item to navigate to a detailed view showing the full article content.

File Structure
Folders
* Model:
    * NewsArticle.swift: Data model for news articles.
* View:
    * NewsReaderApp.swift: Main app interface.
    * NewsListView.swift: Displays a list of news articles.
    * ArticleDetailView.swift: Shows full article details.
    * BookmarksView.swift: Displays bookmarked articles.
    * BookmarksDetailView.swift: Shows full bookmarked article details.
* ViewModel:
    * NewsViewModel.swift: Handles fetching and processing news data.
* Manager:
    * CoreDataManager.swift: Manages Core Data operations.

Core Data Integration
CoreDataManager.swift
This singleton class provides an interface to manage Core Data operations:
* Save Bookmarks:swift Copy code   func createBookmark(title: String, description: String, content: String, url: String, urlToImage: String?)
*   
* Fetch Bookmarks:swift Copy code   func fetchBookmarks() -> [Bookmark]
*   
* Delete Bookmark:swift Copy code   func deleteBookmark(bookmark: Bookmark)
*   

API Details
NewsAPI
* Base URL: https://newsapi.org/v2/top-headlines
* Required Parameters:
    * category: News category (e.g., general, technology, sports).
    * apiKey: Your API key from NewsAPI.
* Example Request:bash Copy code   https://newsapi.org/v2/top-headlines?category=technology&apiKey=YOUR_API_KEY
*   

