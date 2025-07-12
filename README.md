# 🔨 Appmatic Infotech – Flutter Practical Task  
## 🛍 Mini Shopping App – Product Listing with Cart

Your Partner in Scalable Software Innovation  

---

## 📌 Task Objective

This project is a Flutter-based **Mini Shopping App** designed to showcase:

- ✅ Logical structuring
- ✅ State management using **Provider**
- ✅ Clean and modular architecture
- ✅ Real-world UI implementation
- ✅ API integration with `https://fakestoreapi.com/`
- ✅ Professional completeness of the project

---

## 🧠 Flow of the Application

### 1. 🚀 Splash Screen
- Displays Appmatic Infotech branding with a 2–3 second loader.
- Automatically navigates to the next screen.

### 2. 🌐 Language Selection Screen 
- Shown on a language 
- Skipped on subsequent launches.

### 3. 🏠 Home Screen
- Displays product list in a responsive grid.
- Includes a floating **Cart Button** with a live badge count.

#### 🛍 Product Grid
- Shows product image, title, description, and price.
- Efficient image loading and error handling.
- On tap → navigates to **Product Detail Page**.

#### 📄 Product Detail Page
- Full product details.
- "Add to Cart" button updates cart state using Provider.

#### 🛒 Cart Button
- Always visible on home screen.
- Dynamic badge showing total cart quantity.
- On tap → navigates to Cart Screen.

### 4. 🛒 Cart Screen
- Lists all added products with their price.
- Shows total amount.
- Includes "Buy Now" (dummy) button for checkout.

---

## 🔗 API Used

**Fake Store API**  
📦 https://fakestoreapi.com/  
Used for fetching dynamic product data.

---

## 📦 Packages Used

| Package              | Purpose                             |
|----------------------|-------------------------------------|
| provider             | State management                    |
| http                 | API calls                           |
| flutter_screenutil   | Responsive design                   |


---

## 🏗️ Architecture & State Management

- Used **Provider** for global state management (cart state).
- Modular structure with separation of:
  - models/
  - providers/
  - views/
  - widgets/
  - services/
- Code follows clean and scalable best practices.

---

## 📝 Special Considerations

- ✅ No use of static data – All product data fetched from live API.
- ✅ No GetX or shortcut libraries – Followed task guideline strictly.
- ✅ Dynamic cart with live badge updates.

---

## 📽️ Demo 
▶ Watch Demo Video](https://youtube.com/shorts/EiAz-r0QjK8?si=yu2myLlJy6bUsN4D)
