# Leg 1 README
## Wireframes
The wireframes detailing our initial website design can be found in the `design` directory at the project root.

## Design Rationales
- We combined all users, whether they have resolution abilities or
not into one user table. Resolution permissions are stored in a table
that maps user id to department id, and incidents can be resolved by
users with the same department id. Incidents are also mapped to department
ids in a different table

- We spend a lot of time considering the breakdown of departments and
inter-department hierarchy. Because at least one current department - and 
possibly future departments - have sub-departments, we not only have a
departments table, but also a table that maps parent departments to child
departments. This way, a user with permissions for a parent department can 
resolve submissions for all of that department's children. This system can
handle department hierarchies of deeper complexities.

- We decided to create a more structured question form. Rather than allowing
users to write their own comments about an incident, we ask a series of 
questions to the user about the incident type. As the user answers these 
questions, more relevant questions pop up, allowing us to gather normalized 
data about the incidents occuring at this institution. If there is a need for 
speed, such as a life or death scenario, the user would enter a high urgency 
level and the questions would become abridged or deleted and the incident 
would be immediately directed to the appropriate responder, who would 
afterward fill out the details of the event upon resolution. 

- We have an additional table that keeps track of the changes to an incident as it is resolved. This is to ensure that if an incident grows in severity or takes time to be resolved, there is a clear record including timestamps so that if the incidents are reviewed, the path from submission to resolution is easily viewable. 

- In an attempt to mitigate duplicate events, we will allow users to "bump" an incident, or indicate that it is affecting them as well. We keep track of this property through the "bump_count" of an incident, and that combined with urgency will determine the real-time severity of an incident. However, we recognize that users are oftentimes not observant, and so if duplicate incident reports are created, we will allow resolvers to mark them as duplicates and link them to the original event (likely first chronologically) so they don't falsely represent incidents.  


