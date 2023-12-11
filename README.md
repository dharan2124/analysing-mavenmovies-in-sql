# analysing-mavenmovies-in-sql
## Maven Movies Database Overview
### Introduction
The "Maven Movies" database represents a comprehensive movie rental system with interconnected tables capturing information about actors, films, customers, payments, and more. This dataset is designed to facilitate data analysis and retrieval related to a movie rental business.
### Database Schema
Actor Table

actor_id: Unique identifier for each actor.
first_name: First name of the actor.
last_name: Last name of the actor.
last_update: Timestamp indicating the last update of the actor's information.

Actor Award Table

actor_award_id: Unique identifier for each actor award entry.
actor_id: Reference to the actor who received the award.
first_name: First name of the actor.
last_name: Last name of the actor.
awards: Type of award received.
last_update: Timestamp indicating the last update of the award information.

Address Table

address_id: Unique identifier for each address.
address: Street address.
address2: Additional address information.
district: District or region.
city_id: Reference to the city associated with the address.
postal_code: Postal code.
phone: Contact phone number.
last_update: Timestamp indicating the last update of the address information.

Advisor Table

advisor_id: Unique identifier for each advisor.
first_name: First name of the advisor.
last_name: Last name of the advisor.
is_chairmain: Indicator of whether the advisor is the chairman.

Category Table

category_id: Unique identifier for each category.
name: Name of the category.
last_update: Timestamp indicating the last update of the category information.

City Table

city_id: Unique identifier for each city.
city: City name.
country_id: Reference to the country associated with the city.
last_update: Timestamp indicating the last update of the city information.
Country Table
country_id: Unique identifier for each country.
country: Country name.
last_update: Timestamp indicating the last update of the country information.
Customer Table
customer_id: Unique identifier for each customer.
store_id: Reference to the store associated with the customer.
first_name: First name of the customer.
last_name: Last name of the customer.
email: Email address of the customer.
address_id: Reference to the address associated with the customer.
active: Indicator of customer's active status.
create_date: Date when the customer was created.
last_update: Timestamp indicating the last update of the customer information.
Film Table
film_id: Unique identifier for each film.
title: Title of the film.
description: Description or summary of the film.
release_year: Year when the film was released.
language_id: Reference to the language of the film.
original_language_id: Reference to the original language of the film.
rental_duration: Duration for which the film can be rented.
rental_rate: Rental rate of the film.
length: Duration of the film in minutes.
replacement_cost: Replacement cost of the film.
rating: Rating of the film (G, PG, PG-13, R, NC-17).
special_features: Special features associated with the film.
last_update: Timestamp indicating the last update of the film information.
Film Actor Table
actor_id: Reference to the actor associated with the film.
film_id: Reference to the film associated with the actor.
last_update: Timestamp indicating the last update of the relationship between actor and film.
Film Category Table
film_id: Reference to the film associated with the category.
category_id: Reference to the category associated with the film.
last_update: Timestamp indicating the last update of the relationship between film and category.
Film Text Table
film_id: Reference to the film associated with the text.
title: Title of the film.
description: Full text description of the film.
last_update: Timestamp indicating the last update of the film text.
Inventory Table
inventory_id: Unique identifier for each inventory item.
film_id: Reference to the film associated with the inventory.
store_id: Reference to the store associated with the inventory.
last_update: Timestamp indicating the last update of the inventory information.
Investor Table
investor_id: Unique identifier for each investor.
first_name: First name of the investor.
last_name: Last name of the investor.
company_name: Name of the investor's company.
Language Table
language_id: Unique identifier for each language.
name: Name of the language.
last_update: Timestamp indicating the last update of the language information.
Payment Table
payment_id: Unique identifier for each payment.
customer_id: Reference to the customer associated with the payment.
staff_id: Reference to the staff member associated with the payment.
rental_id: Reference to the rental associated with the payment.
amount: Amount of the payment.
payment_date: Date of the payment.
last_update: Timestamp indicating the last update of the payment information.
Rental Table
rental_id: Unique identifier for each rental.
rental_date: Date when the rental occurred.
inventory_id: Reference to the inventory associated with the rental.
customer_id: Reference to the customer associated with the rental.
return_date: Date when the rental was returned.
staff_id: Reference to the staff member associated with the rental.
last_update: Timestamp indicating the last update of the rental information.
Staff Table
staff_id: Unique identifier for each staff member.
first_name: First name of the staff member.
last_name: Last name of the staff member.
address_id: Reference to the address associated with the staff member.
picture: BLOB representing the staff member's picture.
email: Email address of the staff member.
store_id: Reference to the store associated with the staff member.
active: Indicator of staff member's active status.
username: Username used by the staff member.
password: Encrypted password of the staff member.
last_update: Timestamp indicating the last update of the staff member information.
Store Table
store_id: Unique identifier for each store.
manager_staff_id: Reference to the staff member managing the store.
address_id: Reference to the address associated with the store.
last_update: Timestamp indicating the last update of the store information.
