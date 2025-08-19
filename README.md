# Test-Task


# Subscription Tracker (Netflix Example)

This project recreates the core UI for a subscription service dashboard.  
It displays service details, spending insights, upcoming charges, and transaction history using **mock data**.

---

## Features

- **Service Header**  
  Displays service logo, name, and category text.

- **Current Spend Overview**  
  Prominently shows the upcoming charge.

- **Monthly Spending Bar Chart**  
  Custom collection view showing spending per month with responsive bar heights.

- **Upcoming Charge Notice**  
  Rounded card highlighting the next scheduled payment.

- **Transaction History**  
  List of past charges with date, type, and amount.

---

## Data-Driven UI

- UI is powered by a `Service` model with:
  - `monthlySpending` (array of `MonthlySpend`)
  - `upcomingCharge` (`Charge`)
  - `transactions` (`Transaction`)

- A `MockData` struct provides sample Netflix data.

---

## Improvements Made

- **Accessibility Support**:  
  Added `accessibilityLabel` for bar chart and transactions, so VoiceOver users can hear the spending information.

- **Responsive Bar Chart**:  
  Bars scale according to the max monthly spending, adapting to any dataset size.

- **UI Enhancements**:  
  Rounded corners, dynamic sizing, and scrollable horizontal chart.

---

## How to Run

1. Clone this repo or unzip the project.  
2. Open the `.xcodeproj` in Xcode (v15+ recommended).  
3. Run on Simulator or Device.  
   - iPhone 14 Pro layout tested.  

---

## Constraints & Notes

- No backend/API — data is mock only (`MockData` struct).  
- Focused on modular, clean code.  
- Designed to be extendable if more services are added.  
