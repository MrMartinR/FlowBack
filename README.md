[![Contributor][contributor-shield]][contributor-url]

<br />

<p align="center">
  <h1 align="center">FlowBack
 </h1>
  <p align="center">
    Rail API
    <br />
    <a href="https://github.com/FlowFintech/FlowBack.git"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    ·
    <a href="https://github.com/FlowFintech/FlowBack/issues">Report Bug</a>
    ·
    <a href="https://github.com/FlowFintech/FlowBack/issues/issues">Request Feature</a>
  </p>
</p>

<!-- TABLE OF CONTENTS -->

## Table of Contents

- [About the Project](#about-the-project)
- [Screenshots](#screenshots)
- [Prerequisites Installations](#prerequisites-installations)
- [Technology used](#technology-used)
- [Usage/Getting Started](#how-to-Use)
- [Roles Claim](#Roles-Claim)
- [API Endpoints](#API-Endpoints)
- [Live Version](#live-version)
- [Roadmap](#roadmap)
- [Authors](#authors)

<!-- ABOUT THE PROJECT -->

## About The Project

This project implements an investment management application to track investments, personal finance, budget, retirements, Financial Independence Retire Early movement FIRE, all stuff related to Personal Finance.

### Background information

When a business or an individual is in need of a loan, they reach out to loan originator. In most case, the loan originator does not have the money to give to this client. So, what the loan originator does is to float the loan and allow investors to fund it. The floating or display of a loan that need funding is done on a platform. In most case, the loan originator have their own platform.
Now, the investor does not just invest in one platform but in multiple platforms and at times with different loan originator on the same platform(now referred to as a market place as it has more that one loan originator). These bring us to our application, `Flow`, an investment management application.

Using Flow, an investor is able to take the information `after` investing in a platform and add it to our application for easier management. In the past, the investor would have numerous excel files that stored this data which is messy, not easily accessible and does not have that good user experience with tools such as sort, classify by, just ready available to them; so Flow.

Specification summary:

- RESTful api.
- Api versioning.
- Financial modules
- Patterns and good practices.
- Users management.
- Secret/token api key.
- Rspec testing.
- Setup scripts.
- Postgres database.
- Json serialization.

## Screenshots

#### Home

image goes here

## Prerequisites Installations

- Install ruby version 2.3.0 and set it with your ruby environment manager
  ([more info here](https://www.ruby-lang.org/en/documentation/installation/)).

- Install Postgres and start the PostgreSQL server in the foreground
  ([more info here](https://wiki.postgresql.org/wiki/Detailed_installation_guides)).

<p>If you want a copy of this project running on your machine you have to install:</p>

## Technology used

- Ruby
- Rails
- GitHub
- Postgresql
- Devise_token_auth

## Usage/Getting Started

Once you have installed the required package shown on the [Prerequisites Installations](#required-installations), proceed with the following steps

Clone the Repository,

```Shell
your@pc:~$ git clone https://github.com/FlowFintech/FlowBack
```

Move into the cloned folder

```Shell
your@pc:~$ cd FlowBack
```

Get the dependencies needed for the app

```Shell
your@pc:~$ bundle install
```

Set environment variables

```
export USERNAME="change to your database_username"
export PASSWORD="change to your database_password"
export HOST="change to your host address"
```

NB: Defaults

```
1. The default host is: "localhost" if you have not changed it
2. Ensure that the USERNAME is a Superuser in psql
```

Help cookies

- Go to your terminal in ubuntu and type: `sudo su - postgres`
- Then `psql` to access - Postgres
- `\du` to list all user and their attributes
- `ALTER ROLE username SUPERUSER` to alter the user.

Create a postgres role to let rails manage the db:

```
rake db:create
```

Setup databases migrations:

```
rake db:migrate
```

Seed data for development

```
your@pc:~$ rake db:seed
```

Start the server and use the app

```
your@pc:~$ rails s
```

## Roles Claim

The system has three type of users.

1. Admin => This is the sole owner and add/remove a Contributor. Has full system access
2. User => This is the investors who comes with his/her data after investing on platforms to utilize our system to manage this data and be of value to them.
3. Contributor => This is a user(moderators) given privileges by the admin to add, edit, delete some for the information related to the core app functions eg add platforms data so when an investor come to use the system all they need to scroll from available options.

## API Endpoints

- add the localhost url before the api prefix
- Use Postman to view and run the endpoints

### Configure postman for requests with devise_token_auth token

- Using cURL:

```
curl -XGET -v -H 'Content-Type: application/json' -H 'access-token: lW1c60hYkRwAinzUqgLfsQ' -H 'client: W_xCQuggzNOVeCnNZbjKFw' -H "uid: email@domain.com"  http://127.0.0.1:3000/api/v1/user_accounts
```

- Using Postman:

1. Create a new user with a POST request to your signup request, in this case is http://localhost:3000/api/v1/auth/sign_in and in Body with RAW format set the params you need to create a new user (like in the example) and click send. or login
   <img src="./screenshots/register.png" alt="screenshot1"/>

2. Now that you got the response of the request, the params you need are in the header of the request, click to Headers tab to see them.
   <img src="./screenshots/header.png" alt="screenshot1"/>

3. Then create a new request in Postman with the GET that requires the authorization and in Headers set the values access-token, client, uid from the header of the last request.
   <img src="./screenshots/request.png" alt="screenshot1"/>

### Endpoints

| API Endpoint                       | Functionality                              | Status | User             |
| ---------------------------------- | ------------------------------------------ | ------ | ---------------- |
| POST api/v1/auth/sign_in           | Login a user                               | OK     | ALL              |
| POST api/v1/auth/                  | Register a user                            | OK     | ALL              |
| GET api/v1/user_accounts           | Returns a list of User Accounts            | OK     | investor user    |
| GET api/v1/accounts                | Returns a list of accounts                 | OK     | Admin or contrib |
| POST api/v1/accounts               | Create a new accounts                      | Ok     | Admin or Contrib |
| PUT api/v1/accounts/:id            | Update an account but currency and country | Ok     | Admin or Contrib |
| PUT api/v1/modify_countries/:id    | Update an account countries                | Ok     | Admin or Contrib |
| DELETE api/v1/modify_countries/:id | Delete an account countries                | Ok     | Admin or Contrib |
| GET api/v1/currencies              | Returns a list of Currencies               |
| POST api/v1/currencies             | Create a new Currency                      |
| GET api/v1/countries               | Returns a list of countries                |
| POST api/v1/countries              | Create a new Currency                      |

## Live Version

This is the link to the live preview. Feel free to visit.<br>
[FlowBack](https://app.flowfin.tech/)<br>

<!-- ROADMAP -->

## Roadmap

See the [open issues](https://github.com/FlowFintech/FlowBack/issues/issues) for a list of proposed features (and known issues).

<!-- CONTACT -->

## Authors

Martin

- [GitHub profile](https://github.com/FlowFintech)

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributor-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=for-the-badge
[contributor-url]: https://github.com/FlowFintech/FlowBack/graphs/contributors
