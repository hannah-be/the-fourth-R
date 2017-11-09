# README

#### Objective: 
Design a two-way market place that provides a way for owners of broken or run-down goods to connect with people and business who have the skills to repair or maintain them. 

#### Need:
In an economy that increasingly relies on and accepts planned obselescence in everything from refrigerators to smartphones, and a world that is running out of space for its waste, we should be encouraging re-use and repair of our goods. 

Services like AirTasker and TaskRabbit are focused on online work or simple tasks, and are structured in a way that hugely benefits the customer/receiver (which is not in itself a negative) while causing the workers/taskers to constantly underbid each other in order to get work. This model discourages people with high value skills from partaking, and thus making their skills widely known and available, and those that have little recourse to other employment to work for far below the minimum wage. 

Bright Sparks program: https://medium.com/@erinlewisfitz/lessonsfrombrightsparks-8d56714356ad

## Basic functionality for prototype
- Repairers can develop a profile that lists their skills and location. 
- Owners can sign in and create a post for their item that lists its type, problem and a photo. 
- Owners can search through the registered repairers to find one that has the right skill set in their region.
- Owners can submit their item to a repairer who can send a message to find out more, or provide a quote for repair.
- Repairers can request and receive payment for completion of tasks.

Further functionality
- System will match them with repairers who have the right skill set in their region.
- Owners can leave reviews for repairers

## Ethical issues
The movement towards a "gig economy" which devalues skills - purposely did not include any kind of bidding functionality. Instead promoting reuse and repair and a skills-based economy which is more sustainable. 


## Design
I used [NIICE](https://niice.co/m/70ecd2f5c183512ade440736f245dc1e) to collect sources of inspiration for before starting to design my wireframes. 
I wanted something green because of the instantly recognisable motif of the leaf as part of the environmental movement. 

Green - leaf motif instantly recognisable. 

I designed for mobile first - especially as photos may be a key element. I used [Figma](https://www.figma.com/file/fDL71gH16gZv1DHKe1SZWa6a/TheFourthR) to develop my wireframes and map the workflow for the user journey. Using the prototyping function encouraged me to have to think through the actual functionality of each button I was placing on the page and consider how the user would navigate the app. 

I looked at sites such as Etsy and Airtasker to understand how they set up their user experience and database models. 

Style guide: 
![style guide](/app/assets/images/styleguide.png)

#### Tools and methodologies

I used [Trello](https://trello.com/b/IpcW7stE/thefourthr) to project manage my application. I planned out my [user stories](https://trello.com/b/IpcW7stE/thefourthr), and then used those to develop my models (these were then mapped out using [DBDesigner](http://dbdesigner.net/designer/schema/121955)). I reviewed all of the requirements of the assignment, and used those to plan out each part of my project. This also encouraged an Agile approach to my project management - frequently reviewing the plan and where I was at. 

I created a new [GitHub](https://github.com/hannah-be/the-fourth-R) repository to establish my codebase, and encourage regular commits. 

### Build 
#### Rails application code

I set up my users through Devise and then considered a number of different methods to create the database models for the Owner and Repairer, including Single Table Inheritance, Polymorphism, and multiple Devise models. The simplest solution was a single User, with a Profile for all users, and then a table for Repairer attributes when relevant (see ERD Model).


## Deployment
The application has been deployed to Heroku: https://tranquil-anchorage-29674.herokuapp.com/

To setup, configure and use the application on your own server:
1. Download the zipfile of the application and extract
2. Open the terminal and move to the folder where the extraction takes place
3. Create a .env file in the root directory and setup the following environment variables:
S3 Services
  - S3_ACCESS_KEY_ID
  - S3_SECRET_ACCESS_KEY
  - S3_REGION 
  - S3_BUCKET 

Mailgun
  - MAILGUN_API_KEY 
  - MAILGUN_DOMAIN

  - SUPPORT_EMAIL 

Google Maps Geocoder
  - GEOCODER_API_KEY 

Stripe
  - STRIPE_PUBLISHABLE_KEY
  - STRIPE_SECRET_KEY

3. run the command ``rake db:setup``
4. lastly run ``rails server``
5. Open your browser and type `localhost:3000` to enjoy the application

## Presentation
https://docs.google.com/presentation/d/1xc0JVtaoamra0zBatIBw3Ml43Sf4WdvZPnrx_3L6NeA/edit?usp=sharing



## Models

### User - devise
- user_id: integer
- email: string
- password: string

### Profile
- profile_id: integer
- user_id: references
- is_owner: boolean
- is_repairer: boolean
- is_admin: boolean
- address: references??
- phone_number: string
- 

### Address
- street address: string
- suburb: string
- state: string
- postcode: string
- latitude: float
- longitude: float


### Repairer
- location/region: geolocation?
- category: string
- rating: integer [comes from user feedback]

## Admin

### Goods
belongs_to user
- id: integer
- title: string
- category: string
- description: text
- problem-to-fix: text


### RepairTicket
- join-table: owner to repairer through good

## Messaging System
### Conversation
has_many messages
- messages
- owner
- repairer

### Messages
belongs_to conversation
- conversation
- content
- sender
- recipient

## Functionality
- right setup of join tables
- user sign in
- image upload
- feedback system
- messaging system
- user interface