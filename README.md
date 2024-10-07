# iOS Challenge: Property Listing App

¡Hola mundo!

I was presented with the Idealista iOS Challenge to create a property listing app that allows users to browse through a list of properties, view details, and favorite their top choices. This project showcases my approach to building a modern, scalable iOS application using Clean Architecture combined with MVVM patterns.

## Built with 🔨

- SwiftUI & UIKit
- Combine
- Core Data
- MapKit

## Architecture Overview 🏗️

The project follows Clean Architecture principles, divided into clear layers:

### Domain Layer
```
├── Entities
│   ├── Entity
│   │   ├── Detail
│   │   ├── Favorite
│   │   └── List
│   └── ServerEntities
│       ├── Detail
│       └── List
├── UseCases
```
This layer contains business logic using Combine. It includes:
- Business entities
- Use case interfaces
- Repository interfaces

### Data Layer
```
├── Repositories
│   └── Property
├── Persistence
│   └── Model
```
Implements data access and storage:
- Repository implementations
- Core Data models
- API clients

### Presentation Layer (MVVM)
```
├── Scenes
│   ├── PropertyDetail
│   │   ├── ViewModels
│   │   ├── Views
│   │   └── Localization
│   ├── PropertyList
│       ├── PropertyListCell
│           ├── Views
│           ├── .xib
│           ├── Localization
│       ├── Views
│       ├── ViewModel
│       ├── Controller
│       ├── ControllerWrapper
│       └── Localization
```
Uses MVVM patterns:
- ViewModels handle presentation logic
- Views (UIKit & SwiftUI) for UI
- Use of ControllerWrapper to allow interoperability between UIKIT and SwiftUI

## Key Features 📋

All the features are available in iPhone and iPad devices since iOS 15, have dark mode support and can be read both in English and Spanish. 

The API information is retrieved using Combine, taking benefit of Combine's reactiveness. The views are rendered by state, allowing to have:
- Loading state with loading animation
- Loaded state with content

### Property Listing 🏠
- Displays a collection of properties with their information
- Properties can be favorited by the user
- Each property has a detail view
- Seamless UIKit and SwiftUI integration

 <img src="https://github.com/user-attachments/assets/9e24ba97-e2fa-4431-9aa1-4704e9b32824" alt="" width="250"/> <img src="https://github.com/user-attachments/assets/942660d8-5f4f-48c2-9bef-aeda42ec1090" alt="" width="250"/>

### Property Details 🔍
- Detailed view of each property
- Main property information is already loaded to ensure seamless experience
- Interactive map showing property location
- Favorite functionality with date tracking

 <img src="https://github.com/user-attachments/assets/f5394a17-0f06-4c47-9339-3a645f89fd7d" alt="" width="250"/> <img src="https://github.com/user-attachments/assets/ca1883bd-5514-4075-8a15-c7b9dccc9995" alt="" width="250"/> <img src="https://github.com/user-attachments/assets/6b5cc449-6557-4897-b751-b2f28cf45192" alt="" width="250"/> 
 <img src="https://github.com/user-attachments/assets/043dd7a9-07c4-4a13-903f-564bf833f073" alt="" width="250"/> <img src="https://github.com/user-attachments/assets/731ab7ad-6065-43f9-a08b-74867065fd8e" alt="" width="250"/> <img src="https://github.com/user-attachments/assets/0a65c37e-3e55-443b-ab9f-026b26c8f969" alt="" width="250"/>

### Data Persistence 💾
Core Data is used for local storage allowing the user to add or remove favorites. Other methods has been created to allow the functionality to work properly, for that reason there're methods to get all the favorites and to check if an specific property has been favorited.
The model storage the property id, the date the user has added the property as favorite and the favorite value per se.

### Localization 🌍
The app supports two languages: 

- English
- Spanish

Localization is done using the native String Catalog.

## Development Details ⌨️

### API Integration 📞
The app connects to two endpoints. Combine is used for all service calls.
- List: https://idealista.github.io/ios-challenge/list.json
- Detail: https://idealista.github.io/ios-challenge/detail.json

### Testing ✅

There are currently 31 unit tests in the app. I've given test priority to the domain and data layer files.
- Convert to entity files with 100% coverage
- Data source with 92,9% coverage
- Repository implementation with 100% coverage
- Persistance with 85,7% coverage
- Extensions are also tested with more than 88% coverage each

## Technical Challenges 🏋️‍♂️

- **UIKit & SwiftUI Interoperability**: Implemented a wrapper pattern to seamlessly integrate UIKit components with SwiftUI views

## The app in action 🎬

<img src="https://github.com/user-attachments/assets/a90c14d2-4400-436c-ad0d-df45b558393f" alt="" width="250"/> <img src="https://github.com/user-attachments/assets/20daff58-13e4-40eb-803f-d8bf544c88b1" alt="" width="250"/>

## Future Improvements 🔮

Even tho they are no part of the challenge I will surely keep adding some functionalities for my own sake.

- [ ] Favorites list
- [ ] Add filtering capabilities
- [ ] Implement property sharing functionality
- [ ] Add unit tests for ViewModels
- [ ] Add ViewInspector library for UI tests
- [ ] Enhance iPad layout for better use of screen space
- [ ] Refactor of FavoritesManager to have a CLEAN approach
- [ ] CI/CD implementation with Github Actions for testing automation

## Installation 🚀

1. Clone the repository
2. Open `Property.xcodeproj` in Xcode 16.0 or later
3. Build and run the project

## Requirements 📱
- iOS 15.0+
- Xcode 16.0+
- Swift 5.0+

