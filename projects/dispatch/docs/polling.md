# Leg 6 README
## Table of Contents
1. [Polling](#polling)
2. [Caching](#caching)

## Polling
Polling was implemented using socket.io along with node.js and Redis.
Instead of querying the database every interval, the app publishes a message to the Redis server whenever a new incident is created. A [Node.js app](https://github.com/mayasaxena/comp120-node-realtime.git), running at https://radiant-plains-47289.herokuapp.com/, is subscribed to the Redis server, and when an incident is created, it publishes the message to all subscribers.
When the app receives the message, it shows a div that allows users to refresh the page.
If the user selects to refresh the page, the page is reloaded and the new incidents are displayed at the top of the page.

Our implementation is very similar to how Facebook handles new events on the news feed.
There are numerous trade-offs with our design decisions.
The pros:
* No direct polling of the Heroku webserver every preset time interval (fewer web requests)
* User isn't disrupted by an automatically updated view

The cons:
* User must refresh the page to see the new incidents
* Having a high activity period (many new incidents reported) will stress the Redis servers

Thus, our design will work well during periods of low activity, but its performance will suffer with higher load.
The rate of incoming packets in a network does not follow the Poisson distribution in practice, but rather has giant spikes in activity and otherwise has a relatively low uniform activity rate.
If we had more resources to counter the issues, we would have a larger number of Redis servers and also apply some sort of rate limiting so that the Redis servers would update the subscribers only some interval after a new incident was reported.
For example, our Redis server would wait 5-20 seconds after a new incident was reported before informing the subscribers of the new incident, because it is highly likely even more new incidents will be reported in the short timespan following the initial incident.
The exact waiting time would be selected based on testing what wait time maximized performance.

## Caching

We used Heroku's memcachier add-on to implement caching via memcached.
All of the incidents are cached, and the cache expires when a new incident is saved or an old incident is updated/deleted.
Just like before, this design decision puts the app's performance at risk during periods of high activity, because a large number of new incidents can be reported and each will consecutively cause the cache to be re-cached and expire. 
A solution to this would be to (just like before) add some wait interval to allow the influx of new incidents to end, and thus update the cache fewer times.


