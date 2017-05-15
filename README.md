# _Volunteer Tracker_

#### _Application for managing volunteering projects. Built with Ruby, 5 May 2017_

#### _By: **Marko Ludlow**_

## Description

This project was created at [Epicodus](https://www.epicodus.com/) in a day, for an individual code review. Built after the third week of classes in **Ruby** to demonstrate an understanding of Sinatra and PostgreSQL databases. All back-end behaviors were tested using RSpec and all front-end behaviors using RSpec and Capybara. The front end was built using Sinatra, and allows a user to create volunteering projects, save the names of individual volunteers and assign volunteers to certain projects. All information from the front end is processed in Ruby using the PG gem and stored in a SQL database using PostgreSQL.

## Specifications

| Behavior | Input | Output |
|----------|:-----:|:------:|
| User can create volunteering projects. | Click projects, enter project name, click 'Add project'. | New project will display in 'All Projects' list. |
| User can add volunteers to the database. | Click Volunteers, enter volunteer's name, click 'Add volunteer'. | New volunteer will display in 'All Volunteers' list. |
| User can assign a volunteer to a project. (Provided a project exists) | Click volunteer's name. Select project from list. Click update. | Volunteer's name shows up in corresponding project page. |

## Database Installation

This program depends on a [PostgreSQL](https://www.postgresql.org/) (Postgres) database to store information. Set up the database using the information below before running the program. These instructions were tested using macOS, and require you to have [Homebrew](https://brew.sh/) installed. Once you have done that, you can find [detailed instructions here](https://www.learnhowtoprogram.com/ruby/ruby-database-basics/installing-postgres-7fb0cff7-a0f5-4b61-a0db-8a928b9f67ef). Postgres installation is fairly straightforward on Windows machines, you can find a link to an installer [here](https://www.enterprisedb.com/downloads/postgres-postgresql-downloads#windows).

* Install Homebrew (macOS only)
* Install PostgreSQL
* Start Postgres server
  * macOS: in a shell run the command `postgres`

## Database Setup

This program relies on a specific database naming conventions. The creation of these databases can be done using the interactive terminal for Postgres `psql` ([detailed documentation can be found here](https://www.postgresql.org/docs/9.2/static/app-psql.html)). To get things working, run the following commands in psql.

  * `CREATE DATABASE volunteer_tracker_test`
  * `\c volunteer_tracker`
  * `CREATE TABLE projects (id serial PRIMARY KEY, name varchar)`
  * `CREATE TABLE volunteers (id serial PRIMARY KEY, name varchar, project_id int)`

All unit and integration tests currently rely on a primary development database named `volunteer_tracker_test`.

 * `CREATE DATABASE volunteer_tracker_test`

## Database Schema

<img src="http://i.imgur.com/8qMpm6B.png" />

## Setup/Installation Requirements

To run this site on your own machine you must have Ruby installed. All gems used in the project are included in the `Gemfile`, and the site was tested using the current bundled `Gemfile.lock`.

* Clone this repository in a shell using the command:
`git clone https://github.com/aubreymasten/volunteer_db`
* Follow Database Installation & Setup instructions above
* In the `volunteer_db` folder run the command `ruby app.rb`
* The site should be available in your browser at `localhost:4567` (the port number (`4567`) may not be accurate on every device. Check your shell, Sinatra should provide you the correct port.)

## Known Bugs

All development and setup instructions were tested on macOS
## Support and contact details

_If you have any questions or find any issues with the site, get in touch. My email address is: ludlow.marko@gmail.com_

## Technologies Used

* _[Ruby](https://www.ruby-lang.org/en/)_
* _[Postgres](https://www.postgresql.org/)_
* _[RSpec](http://rspec.info/)_
* _[Sinatra](http://www.sinatrarb.com/)_
* _[Capybara](https://teamcapybara.github.io/capybara/)_

## License

MIT License

Copyright (c) 2017 Marko Ludlow

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
