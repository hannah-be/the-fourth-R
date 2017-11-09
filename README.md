# THE FOURTH R

#### The Problem:
In an economy that increasingly relies on and accepts planned obselescence in everything from refrigerators to smartphones, and an environment that is running out of space for its waste, we should be encouraging re-use and repair of our goods.

Services like AirTasker and TaskRabbit are focused on online work or simple tasks, and are structured in a way that hugely benefits the customer/receiver (which is not in itself a negative) while causing the workers/taskers to constantly underbid each other in order to get work. This model discourages people with high value skills from partaking, and thus making their skills widely known and available, and those that have little recourse to other employment to work for far below the minimum wage. 

Bright Sparks program: https://medium.com/@erinlewisfitz/lessonsfrombrightsparks-8d56714356ad

#### Objective: 
Design a two-way market place that provides a way for owners of broken or run-down goods to connect with people and business who have the skills to repair and maintain them. 

## Basic functionality for prototype
- Repairers can develop a profile that lists their skills and location. 
- Owners can sign in and create a post for their item that lists its type, problem and a photo. 
- Owners can filter through the registered repairers to find one that has the right skill set in their region.
- Owners can submit their item to a repairer who can send a message to find out more, or provide a quote for repair.
- Repairers can request and receive payment for completion of tasks.

Further functionality
- System will match them with repairers who have the right skill set in their region.
- Owners can leave reviews for repairers.

## Ethical issues
The movement towards a "gig economy" which devalues skills - purposely did not include any kind of bidding functionality. Instead promoting reuse and repair and a skills-based economy which is more sustainable. 


## Design
I used [NIICE](https://niice.co/m/70ecd2f5c183512ade440736f245dc1e) to collect sources of inspiration for before starting to design my wireframes. 
![Inspiration](/app/assets/images/niice.png) 
I wanted something green because of the instantly recognisable motif of the leaf as part of the reuse-reduce-recycle, and used this to develop a style guide.

Style guide: 
<img src="/app/assets/images/styleguide.png" width="100">

I designed for mobile first - especially as photos would be a key element of the user experience. I used [Figma](https://www.figma.com/file/fDL71gH16gZv1DHKe1SZWa6a/TheFourthR) to develop my wireframes and map the workflow for the user journey.
![Landing page](/app/assets/images/figmascreen.png)
Using the prototyping function encouraged me to have to think through the actual functionality of each button I was placing on the page and consider how the user would navigate the app. 
![Prototype](/app/assets/images/figmaprototype.png)

I looked at sites such as Etsy and Airtasker to understand how they set up their user experience and database models. 


#### Tools and methodologies

I used [Trello](https://trello.com/b/IpcW7stE/thefourthr) to project manage my application. I planned out my [user stories](https://trello.com/b/IpcW7stE/thefourthr), and then used those to develop my models (these were then mapped out using [DBDesigner](http://dbdesigner.net/designer/schema/121955)). 
![User Stories](/app/assets/images/userstories.png)
![ERD](/app/assets/images/erd.png)

I reviewed all of the requirements of the assignment, and used those to plan out each part of my project. This also encouraged an Agile approach to my project management - frequently reviewing the plan and where I was at. 
![Sprint](/app/assets/images/sprint.png)

I created a new [GitHub](https://github.com/hannah-be/the-fourth-R) repository to establish my codebase, and encourage regular commits. 

### Build 
#### Rails application code

I set up my users through Devise and then considered a number of different methods to create the database models for the Owner and Repairer, including Single Table Inheritance, Polymorphism, and multiple Devise models. The simplest solution was a single User, with a Profile for all users, which would have many items that would need a repair (join table) and then a table for Repairer attributes when relevant (see ERD Model).

I used `Shrine` to allow users to upload profile photos, and images for their broken items. 

Because addresses would be used by multiple models (both repairers and items would have locations), addresses were set up as their own table. So that users could view and update addresses without having to navigate to a separate form, I used the ``accepts_nested_attributes_for`` association for the Repairer and Item models. By updating the params for each of these models to permit `address_attributes` I could then use the `form.fields_for` tag in the form for each of them. 

Once the Address field was working, I implemented the Google Geocoder API to allow the addresses to be geocoded and represented on a static google map. 

I set up the 

I used pull requests through GitHub to have my code reviewed before merging branches when I implemented the geocoder gem and integrated the payment system through `Stripe`.

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

4. Run the command ``rake db:setup``
5. Lastly, run ``rails server``
6. Open your browser and type `localhost:3000` to enjoy the application

## Presentation
https://docs.google.com/presentation/d/1xc0JVtaoamra0zBatIBw3Ml43Sf4WdvZPnrx_3L6NeA/edit?usp=sharing



## Models

### Admin - Rails_Admin
### User - devise
- user_id: integer
- email: string
- password: string

### Profile
belongs_to :user
has_many :items
- profile_id: integer
- user_id: references
- address: references
- phone_number: string

### Address
- street address: string
- suburb: string
- state: string
- postcode: string
- latitude: float
- longitude: float

### Repairer
belongs_to: user
- user_id: references
- category: string
- addres: references
- rating: integer

### Item
belongs_to user
- id: integer
- title: string
- category: string
- description: text
- problem: text

### Repair
join-table: owner to repairer through good
- item: references
- repairer: references
- user: references (item owner - requests the repair)
- charge_identifier: string

## Messaging System
### Conversation
has_many messages
- owner
- repairer
- sender
- recipient

### Messages
belongs_to conversation
- conversation
- content