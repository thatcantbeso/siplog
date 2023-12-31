# ☕️ Sip Log FULL Functional Specification ☕️
Straight forward application in order to track how you make your coffee.
Streamline your coffee experience with Siplog—an intuitive app designed to effortlessly track your coffee-making process.
Log details about your coffees, brewers, and grinders, gaining a deeper understanding of what influences the taste of your brews. 
Elevate your coffee game by creating a comprehensive log for better, more informed, and consistently delightful results.

## Pain Points
### Unorganized journals are insufficient, clumsy, and easy to lose
  Coffee journals usually are not well structured and organization is not great. It's hard to remember which recipes you like when it is very full. Plus, they are generally small and can be misplaced.
### Accessibility anywhere
 An app makes it available for generally anyone with an internet connection. There is almost twice as many phones as there are people. Plus, this app is also available on desktop.
### Readability, Structure, and Intuitive
 Handwriting can be messy when referring back to old data. It should be easy to see your favorite logs and coffees. Accessing your data is just as important as writing data. Tracking your logs and referencing them is important to understanding.

## Proposed Solution
Create an application that keeps track of all the coffee equipment and coffees that you have. Siplog will make it simple to view and store all of your coffee logs and look back into them. Making coffee can be very difficult and time-consuming. It's important for users to be able to track what they have and replicate great brews they've down before. It should be easy for users to also diverge and experiment with new coffee, grinders, and brewers to try new brews.

## User Stories
- As a user, I want to be able to create an account with my email and password and log in to see only my logs.

- As a user, I want to be able to log my brews.

- As a user, I want to be able to store my coffee, grinders, and brewers.

- As a user, I want to see a few of my last logs.

## Domain Model

### Users
- id
- email
- devise fields

### Logs
- id
- owner_id
- coffee_id
- grinder_id
- brewer_id
- photo_id
- notes
- filter_paper
- dosage
- water_temperature
- water_type
- grind_size
- bloom_time
- total_brew_time
- date_time
- rating

### Coffees
- id
- species
- variety
- process
- elevation
- region
- subregion
- roast_level
- roast_date
- cup_score
- tasting_notes
- name
- roaster
- producer

### Grinders
- name
- power
- burr_type
- burr
- owner_id

### Brewers
- name
- material
- owner_id
- brew_type

### Entity Relationship Diagram
<img src="/app/assets/images/erd.png" alt="Entity Relationship Diagram">

### Early Sketches
<img src="https://res.cloudinary.com/dgw4azuip/image/upload/f_auto,q_auto/speedy_eights_uhwdfk" alt="speedy eights siplog">
<img src="https://res.cloudinary.com/dgw4azuip/image/upload/f_auto,q_auto/final_sketch_iopifk" alt="Final siplog sketch">
