# Leg 3 README
## Table of Contents
1. [Project Live URL](#live-url)
2. [Test Framework](#test-framework)
3. [Load Handling](#load-handling)

## Live URL
[Here is our live web-app](https://shielded-reef-65123.herokuapp.com/).
We decided to use Heroku because a large portion of our team has had experience with it.
We did not want to work with AWS due to the "see-how-deep-the-rabbit-hole-goes" rumors.

## Test Framework
We decided to use Minitest because it's simple, uses the Ruby language (rather than a DSL), and uses the same syntax as the native Rails tests (other reasons are listed [here](http://brandonhilkert.com/blog/7-reasons-why-im-sticking-with-minitest-and-fixtures-in-rails/).
We included the Minitest-reporters gem to beautify the console output produced by Minitest.

## Load Handling
To handle 15,000 unique visitors per day, we would do a couple of things. 
1. We would cache everything that is cacheable.
2. We would use multiple servers (dynos) to balance the load on the web-app.
3. We **have manually** added postgresql uniqueness constraints because Rails does a poor job of handling concurrency. 
For example, the uniqueness constraint queries the database and if the table does not contain the value to be inserted, the insertion will occur.
However, if there are multiple servers, then if they simultaneously do a uniqueness query, duplicate entries can be inserted (uniqueness is not guaranteed!).
4. We plan to use an Amazon S3 bucket to act as a CDN for images, videos, and other files.
5. Minify, uglify, and compress all CSS, Javascript.


