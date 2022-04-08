# Leg 5 README
## Table of Contents
1. [Authentication and Authorization](#authentication-and-authorization)
2. [Implementation Discussion](#implementation-discussion)

## Authentication and Authorization
All user operations will require admin authentication and authorization. 
Regular developers will not need to see users' details to make use of our API.
Admin users who are maintaining for the institution our application will need to add and modify users as people move through the institution (new employees, graduating students, etc.).

Authorization will be required for CRUD operations on incidents. 
A developer using our API must have access to a developer key to essentially "log into" the application and have access to the site's features.
Reading all or a signel incident, and creating a new incident will require just authorization.
Updating an incident will require authorization and authentication, because the user or developer should only have access to the incidents they created.
A developer may potentially have accesss to other incidents if given sufficient privileges (authorization, closer to admin).
Deleting an incident will require authorization and authentication because only an admin should be able to delete a resource.
An incident represents a report of a some real-life event that occured, therefore deletion implies the report was falsely created.
Thus, only a strongly privileged user (aka admin) should be able to perform such an important action.

## Implementation Discussion
We decided to not use Grape due to the currently simple nature of our application, and the complexity of Grape.
Using the RESTful API inherent in a Rails app was sufficient for our purposes.


