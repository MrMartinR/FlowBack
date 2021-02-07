[![Gitmoji](https://img.shields.io/badge/gitmoji-%20😜%20😍-FFDD67.svg)](https://gitmoji.dev) [![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop-hq/rubocop)

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

# [Ruby StyleGuide](docs/StyleGuide-Ruby.adoc)


<!-- TABLE OF CONTENTS -->

## Table of Contents

- [About the Project](#about-the-project)
- [Screenshots](#screenshots)
- [Prerequisites Installations](#prerequisites-installations)
- [Gems](#gems)
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

When a business or an individual is in need of a loan, they reach out to loan originator. In most case, the loan originator does not have the money to give to this client. So, what the loan originator does is to float the loan and allow investors to fund it. The floating or display of a loan that need funding is done on a platform. Sometimes, the loan originator have their own platform.
Now, the investor does not just invest in one platform but in multiple platforms and at times with different loan originator on the same platform (now referred to as a market place as it has more that one loan originator). These bring us to our application, `Flow`, an investment management application.

Using Flow, an investor is able to take the information `after` investing in a platform and add it to our application for easier management. In the past, the investor would have numerous excel files that stored this data which is messy, not easily accessible and does not have that good user experience with tools such as sort, classify by, just ready available to them; so Flow.

Specification Summary:

- RESTful API.
- API Versioning.
- Financial Modules.
- Patterns and Good Practices.
- Users Management.
- Secret/Token API Key.
- Rspec Testing.
- Setup Scripts.
- Postgres Database.
- JSON Serialization.

## Screenshots

#### Home

image goes here

## Prerequisites Installations

- Install ruby version 2.6.5 and set it with your ruby environment manager
  ([more info here](https://www.ruby-lang.org/en/documentation/installation/)).

- Install Postgres and start the PostgreSQL server in the foreground
  ([more info here](https://wiki.postgresql.org/wiki/Detailed_installation_guides)).

<p>If you want a copy of this project running on your machine you have to install:</p>

## Technology used

- Ruby
- Rails
- GitHub
- PostgreSQL
- Devise_token_auth

## Gems


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

- Add the localhost url before the api prefix
- Use Postman to view and run the endpoints

### Configure postman for requests with devise_token_auth token

- Using cURL:

```
curl -XGET -v -H 'Content-Type: application/json' -H 'access-token: lW1c60hYkRwAinzUqgLfsQ' -H 'client: W_xCQuggzNOVeCnNZbjKFw' -H "uid: email@domain.com"  http://127.0.0.1:3000/api/v1/user_accounts
```

- Using Postman:

1. Create a new user with a POST request to your signup request, in this case is http://localhost:3000/api/v1/auth/sign_in and in Body with RAW format set the params you need to create a new user (like in the example) and click send. or login
   <img src="./docs/screenshots/register.png" alt="screenshot1"/>

2. Now that you got the response of the request, the params you need are in the header of the request, click to Headers tab to see them.
   <img src="./docs/screenshots/header.png" alt="screenshot1"/>

3. Then create a new request in Postman with the GET that requires the authorization and in Headers set the values access-token, client, uid from the header of the last request.
   <img src="./docs/screenshots/request.png" alt="screenshot1"/>

### Endpoints

Here you can find the API Documentation
([API Documentation ](https://app.swaggerhub.com/apis/Flow-Fintech/FlowAPI/1.0.0/)).

| API Endpoint                           | Functionality                                | Status | User                       |
| -------------------------------------- | -------------------------------------------- | ------ | -------------------------- |
| POST api/v1/auth/sign_in               | Login a user                                 | OK     | ALL                        |
| POST api/v1/auth/                      | Register a user                              | OK     | ALL                        |
| GET api/v1/user_accounts               | Returns a list of User Accounts              | OK     | User                       |
| GET api/v1/accounts                    | Returns a list of accounts                   | OK     | Admin or contrib           |
| POST api/v1/accounts                   | Create a new accounts                        | Ok     | Admin or Contrib           |
| PUT api/v1/accounts/:id                | Update an account bt nt currency & country   | Ok     | Admin or Contrib           |
| DELETE api/v1/accounts/:id             | Delete an account                            | Ok     | Admin or Contrib           |
| PUT api/v1/modify_countries/:id        | Update an account countries                  | Ok     | Admin or Contrib           |
| DELETE api/v1/modify_countries/:id     | Delete an account countries                  | Ok     | Admin or Contrib           |
| PUT api/v1/modify_currencies/:id       | Update an account currencies                 | Ok     | Admin or Contrib           |
| DELETE api/v1/modify_currencies/:id    | Delete an account currencies                 | Ok     | Admin or Contrib           |
| GET api/v1/currencies                  | Returns a list of Currencies                 |
| POST api/v1/currencies                 | Create a new Currency                        |
| GET api/v1/countries                   | Returns a list of countries                  |
| POST api/v1/countries                  | Create a new Currency                        |
| POST api/v1/contacts                   | Create a new contact                         | OK     | Admin, Contrib or User     |
| GET api/v1/contacts                    | Get all public contact                       | OK     | Admin, Contrib or User-own |
| GET api/v1/contacts/:id                | Get a contact                                | OK     | Admin, Contrib or User-own |
| PUT api/v1/contacts/:id                | Update a contact                             | OK     | Admin, Contrib or User-own |
| DELETE api/v1/contacts/:id             | Delete a contact                             | OK     | Admin, Contrib or User-own |
| POST api/v1/originators                | Create a new originators                     | OK     | Admin, Contrib             |
| GET api/v1/originators                 | Get all originators                          | OK     | ALL                        |
| GET api/v1/originators/:id             | Get an originators                           | OK     | ALL                        |
| PUT api/v1/originators/:id             | Update originator                            | OK     | Admin, Contrib             |
| DELETE api/v1/originators/:id          | Delete originator                            | OK     | Admin, Contrib             |
| POST api/v1/platforms                  | Create a new platform                        | OK     | Admin, Contrib             |
| GET api/v1/platforms                   | Get all platforms                            | OK     | ALL                        |
| GET api/v1/platforms/:id               | Get an platforms                             | OK     | ALL                        |
| PUT api/v1/platforms/:id               | Update a platforms                           | OK     | Admin, Contrib             |
| DELETE api/v1/platforms/:id            | Delete a platforms                           | OK     | Admin, Contrib             |
| POST api/v1/platform_originators       | Create a new platform originator             | OK     | Admin, Contrib             |
| GET api/v1/platform_originators        | Get all platform originators                 | OK     | ALL                        |
| GET api/v1/platform_originators/:id    | Get a platform originator                    | OK     | ALL                        |
| PUT api/v1/platform_originators/:id    | Update a platform_originator                 | OK     | Admin, Contrib             |
| DELETE api/v1/platform_originators/:id | Delete a platform_originators                | OK     | Admin, Contrib             |
| POST api/v1/contact_methods            | Create a new contact_method                  | OK     | Admin, Contrib or User     |
| GET api/v1/contact_methods             | Get all public and own contact_methods       | OK     | Admin, Contrib or User-own |
| GET api/v1/contact_methods/:id         | Get a contact_methods                        | OK     | Admin, Contrib or User-own |
| PUT api/v1/contact_methods/:id         | Update a contact_methods                     | OK     | Admin, Contrib or User-own |
| DELETE api/v1/contact_methods/:id      | Delete a contact_methods                     | OK     | Admin, Contrib or User-own |
| POST api/v1/loans                      | Create a new loan                            | OK     | Admin, Contrib             |
| GET api/v1/loans                       | Get all loans                                | OK     | ALL                        |
| GET api/v1/loans/:id                   | Get a loan                                   | OK     | ALL                        |
| PUT api/v1/loans/:id                   | Update a loan                                | OK     | Admin, Contrib             |
| DELETE api/v1/loans/:id                | Delete a loan                                | OK     | Admin, Contrib             |
| POST api/v1/user_accounts              | Create a new user_accounts                   | OK     | Admin, Contrib or User own |
| GET api/v1/user_accounts               | Get all user user_accounts                   | OK     | Admin, Contrib or User own |
| GET api/v1/user_accounts/:id           | Get a user user_accounts                     | OK     | Admin, Contrib or User own |
| PUT api/v1/user_accounts/:id           | Update a user_accounts                       | OK     | Admin, Contrib or User own |
| DELETE api/v1/user_accounts/:id        | Delete a user_accounts                       | OK     | Admin, Contrib or User own |
| POST api/v1/transactions               | Create a new transactions under user_account | OK     | Admin, Contrib or User own |
| GET api/v1/transactions                | Get all transactions under user_account      | OK     | Admin, Contrib or User own |
| GET api/v1/transactions/:id            | Get a transactions under user_account        | OK     | Admin, Contrib or User own |
| PUT api/v1/transactions/:id            | Update a transactions under user_account     | OK     | Admin, Contrib or User own |
| DELETE api/v1/transactions/:id         | Delete a transactions under user_account     | OK     | Admin, Contrib or User own |
| POST api/v1/user_loans                 | Create a new user_loan                       | OK     | User own                   |
| GET api/v1/user_loans                  | Get all user_loans                           | OK     | User own                   |
| GET api/v1/user_loans/:id              | Get a user_loan                              | OK     | User own                   |
| PUT api/v1/user_loans/:id              | Update a user_loan                           | OK     | User own                   |
| DELETE api/v1/user_loans/:id           | Delete a user_loan                           | OK     | User own                   |
| POST api/v1/user_platforms             | Create a new user_platforms                  | OK     | User own                   |
| GET api/v1/user_platforms              | Get all user_platforms                       | OK     | User own                   |
| GET api/v1/user_platforms/:id          | Get a user_platforms                         | OK     | User own                   |
| PUT api/v1/user_platforms/:id          | Update a user_platforms                      | OK     | User own                   |
| DELETE api/v1/user_platforms/:id       | Delete a user_platforms                      | OK     | User own                   |
| GET api/v1/users                       | Get all users                                | OK     | Admin                      |
| GET api/v1/user_profile                | Get logged in user profile                   | OK     | Admin, Contrib or User     |
| POST api/v1/update_profile             | Update the currency and country in profile   | OK     | Admin, Contrib or User     |
| PUT api/v1/users/:id                   | Update user profile                          | OK     | Admin, Contrib or User     |

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
