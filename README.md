# README

This is a coding excercise for Synap Software Labs https://getsynap.com/

The task was to build out four api endpoints like below and have them return JSON objects with the necessary info.

    GET /people.json
    GET /people/:id.json
    GET /organizations.json
    GET /organizations/:id.json

This is a standard Rails API app, so all the commands work as normal.

Rails Server: `rails server` or just `rails s` and navigate to localhost:3000

An example of one endpoint on the local server would be `localhost:3000/people` or `localhost:3000/people.json`

Seed data came from a csv file stored in `lib/seeds` along with the code to process it. The actual seeding call comes in `db/seeds.rb` and can be run by running `rails db:seed` in your project directory.

The code for seeding can be used for any identical file. The path to the seed data csv is hardcoded so would need to be refactored to handle anything more demanding.

The test coverage is basically non-existant. I only added two as sanity checks.
