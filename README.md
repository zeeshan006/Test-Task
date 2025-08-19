# Test Task

---

## How to Run

1. Clone this repo or unzip the project.  
2. Open the `.xcodeproj` in Xcode (v15+ recommended).  
3. Run on Simulator or Device.  
   - iPhone 14 Pro layout tested.  

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
