# Leg 2 README
## Table of Contents
1. [Project Dependencies](#dependencies)
2. [Learning Ruby](#learning-ruby)
3. [Challenges](#challenges)
4. [Implementation Rational](#implementation-rationale)

## Dependencies
Below are the project's Ruby Packages, API's, and dependencies
* Ruby 2.3.0
* Rails 4.2.0
* Simple_Form
* paper_trail (considering, unsure if it's the best choice for an audit trail as it is not DRY)

## Learning Ruby
We spent approximately 3 hours learning Ruby.
We spent around 10 hours figuring out Rails (and how it interacts with databases) as well as implementing the MVP.

## Challenges
We spent a non-trivial amount of time (3-4 hours) setting up our machines with Ruby and PostgreSQL.
We did not immediately realize that we had to create roles for Rails to use.

One major challenge was learning how Rails handles data model relationships and constraints. 
Unfortunately, Rails is not too strong on the concurrency as having a uniqueness validation does NOT actually insert a uniqueness constraint in the database, but rather, queries the database and checks for the same value.
Thus, in a N-client system, if two server instances queried the database about identical input that does not exist in the database, each individual Rails server would deduce that their input is unique.
Both would then input the identical data and the database would have duplicate entries, breaking the uniqueness constraint.

A solution is to add a b-tree index which indirectly creates a unique constraint, however, the migration then becomes irreversible as one cannot reference the constraint by name.
Thus, the preferred solution is to execute SQL code in a migration which explicitly creates a unique constraint on some field.

Another major challenge was figuring out how to create an interactive "submit an incident" page, where the questions were determined by how the user answered earlier broader questions.
We determined that this was beyond the scope of the MVP and did not implement it.

## Implementation Rationale
We choose Ruby on Rails because it is a popular, time-tested web framework with a large community of support.
We choose PostgreSQL because it is one of the top two relational databases



