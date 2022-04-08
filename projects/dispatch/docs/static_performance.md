# Leg 4 README
## Table of Contents
1. [Optimization Techniques Utilized](#optimization-techniques-utilized)
2. [Test Tools](#test-framework)
3. [Performance Improvements](#performance-improvements)
4. [Unresolved Performance Issues](#unresolved-performance-issues)

## Optimization Techniques Utilizied
We used the following optimization techniques to improve our webapp's performance:

1. JavaScript and CSS combination 
    * handled by Rails (produces application.css and application.js).
2. JavaScript and CSS minification 
    * handled by Rails, uglifier gem included by default (produces application.css and application.js).
3. Expiry
    * modified config/environments/production.rb to enable expiration dates on static content
4. Compression / Gzip
    * used the heroku_rails_deflate gem and modified config/environments/production.rb to add compression
    * added asset precompilation to config/initializers/assets.rb to prevent Heroku runtime compilation (which is a big slow-down)


## Test Tools
We used YSlow, Loader.io, and Google PageSpeed Insights to examine our webapp's performance.
Our initial scores were as follows:

1. YSlow - 99/100
    * only recommendation was to add Expires headers.
2. PageSpeed Insights - 91/100 for Desktop
    * eliminate render-blocking JS and CSS in above-the-fold content.
    * leverage browser caching
    * enable compression
    * minify html
3. Loader.io
    * 13,664 ms average response time for ~1000 requests per minute (uniformly distributed).

## Performance Improvements

1. YSlow - 97/100
    * suggests a CDN (for minified, combined application.js and .css)
2. PageSpeed Insights - 93/100 for Desktop
    * eliminate render-blocking JS and CSS in above-the-fold content
3. Loader.io
    * 12,402 ms average response time for ~1200 requests per minute (uniformly distributed)


## Unresolved Performance Issues
Some lingering performance issues for our webapp are: we need to add a CDN, caching for dynamic content, and reduce how many incidents are returned (size of db query) for the index or home page.
