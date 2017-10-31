# README

#### Brief: 
A full stack developer needs to be able to demonstrate they can build a complete application from design through to deployment, using appropriate tools and methodologies. You must build a two sided marketplace. This app will cater to two markets that your app brings together.

#### Submission:
Submit your project via Canvas. It should include a link to the published project (Heroku/AWS) and a .zip folder containing:
- Documentation
- ERD
- Wireframes
- Evidence of your design process
- Your entire app in the original file structure and all assets


## Deliverables

### Design 
#### Design Documentation
Demonstrate your ability to break down the problem and design a solution.
- One page summary of your application including problem definition, solution.
- A workflow diagram of the user journey/s.
- Wireframes for at least 5 screens.
- User stories for the whole application.
- Entity Relationship Diagram (ERD).
- Project plan and estimation.


## Design
I used [NIICE](https://niice.co/m/70ecd2f5c183512ade440736f245dc1e) to collect some sources of inspiration for before starting to design my wireframes. 
I wanted something green because of the instantly recognisable motif of the leaf as part of the environment movement. 

Green - leaf motif instantly recognisable. 
Mobile first - especially as photos may be a key element. 


I used [Figma](https://www.figma.com/file/fDL71gH16gZv1DHKe1SZWa6a/TheFourthR) to develop my wireframes and map the workflow for the user journey. Using the prototyping function encouraged me to have to think through the actual functionality of each button I was placing on the page and consider how the user would navigate the app. 

I looked at sites such as Etsy and Airtasker to understand how they set up their user experience and database models. 


#### Tools and methodologies
- Code review. Demonstrate that you have had your code reviewed by other students and that you have provided a code review for others.
- GitHub. Demonstrate use of frequent commits, pull requests, documentation.
- Provide evidence you have used code quality tools (eg. Traceroute, Bullet, Brakeman, Rails Best Practices tool, RuboCop, RubyCritic, CodeClimate).

I used [Trello](https://trello.com/b/IpcW7stE/thefourthr) to project manage my application. I planned out my [user stories](https://trello.com/b/IpcW7stE/thefourthr), and then used those to develop my models (these were then mapped out using [DBDesigner](http://dbdesigner.net/designer/schema/121955)). I reviewed all of the requirements of the assignment, and used those to plan out each part of my project. This also encouraged an Agile approach to my project management - frequently reviewing the plan and where I was at. 

I created a new [GitHub](https://github.com/hannah-be/the-fourth-R) repository to establish my codebase, and encourage regular commits. 

### Build 
#### Rails application code
- Use an API (eg. Omniauth, Geocoding, Maps, other..).
- Use appropriate gems.
- Use environmental variables to protect API keys etc. (dotenv)
- Implement a payment system for your product. (e.g. Stripe)
- Your app must send transactional emails (eg. using Mailgun).
- Your app should have an internal user messaging system.
- Your app will have some type of searching, sorting and/or filtering capability.
- Your app will have some type of file uploading capability (eg. images).
- Your app will have authentication (eg. Devise, must have full functionality in place).
- Your app will have authorisation (users have restrictions on what they can see and edit).
- Your app will have an admin dashboard for the admin user to administrate the site.


## Deployment
The application has been deployed to Heroku: ................[insert URL]
- Document your application with a README that explains how to setup, configure and use your application.

## Presentation
https://docs.google.com/presentation/d/1xc0JVtaoamra0zBatIBw3Ml43Sf4WdvZPnrx_3L6NeA/edit?usp=sharing


#### Objective: 
Design a two-way market place that provides a way for owners of broken or run-down goods to connect with people and business who have the skills to repair or maintain them. 

#### Need:
Services like AirTasker and TaskRabbit are focused on online work or simple tasks, 
 in an economy that increasingly relies on and accepts planned obselescence 

## Basic functionality for prototype
- Repairers can develop a profile that lists their skills and location. 
- Owners can sign in and create a post for their item that lists its type, problem and a photo. 
- System will match them with repairers who have the right skill set in their region? Can notifiy repairers...

## Ethical issues
The movement towards a "gig economy" which devalues skills - purposely did not include any kind of bidding functionality. Instead promoting reuse and repair and a skills-based economy which is more sustainable. 



## Models

### User - devise
- user_id: integer
- email: string
- password: string

### Owners
- [check gumtree]
- favourite-repairers: join table - repairer-id

### Repairer
- location/region: geolocation?
- category: string
- rating: integer [comes from user feedback]

## Admin

### Goods
belongs_to owner
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