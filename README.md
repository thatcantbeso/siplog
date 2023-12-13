# ☕️ Sip Log Specification ☕️

Streamline your coffee experience with Siplog—an intuitive app designed to effortlessly track your coffee-making process.
Log details about your coffees, brewers, and grinders, gaining a deeper understanding of what influences the taste of your brews. 
Elevate your coffee game by creating a comprehensive log for better, more informed, and consistently delightful results.

## Pain Points
- Unorganized journals are clumsy, easy to lose/misplace, and not intuitive.
- It's annoying to carry a journal around.
- There are many recipes to brew coffee.

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
- photo
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
