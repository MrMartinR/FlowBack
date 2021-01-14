[![Gitmoji](https://img.shields.io/badge/gitmoji-%20😜%20😍-FFDD67.svg)](https://gitmoji.dev) [![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop-hq/rubocop)

[![Contributor][contributor-shield]][contributor-url]

<br>

<img src="./docs/backend.svg">

<br>

# [Ruby StyleGuide](docs/StyleGuide-Ruby.adoc)

<!-- TABLE OF CONTENTS -->

## Table of Contents

- [Getting Started](#getting-started)
- [Cloning the Repository](#cloning-the-repository)
- [Code Documentation](#code-documentation)
- [Contributing](#contributing)
- [Roles Claim](#Roles-Claim)
- [API Endpoints](#API-Endpoints)
- [Live Version](#live-version)
- [Roadmap](#roadmap)
- [Contributors](#contributors)

```
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
```

# Getting Started

## Package Manager

[<img src="./docs/yarn.svg" width="60px" title="Yarn">](https://yarnpkg.com)
Use [Yarn](https://yarnpkg.com) as a packager manager application.

macOS via [Homebrew](http://brew.sh/)

```shell
brew install yarn
```

Debian/Ubuntu

```shell
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
```

```shell
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
```

<br>

## <img src="./docs/ruby.svg" width="30px" title="Ruby"> [Ruby](https://www.ruby-lang.org/en/documentation/installation/)

Is probably that you already have Ruby installed in your computer, you can check it typing the following comand in your terminal.

```shell
ruby -v
```

We are using ruby version **_2.6.5_**, is important to use this version. If you are using a diferent version of Ruby, upgrade or downgrade the version using the follow command

_macOS_

```shell
brew install ruby@2.6.5
```

_Debian/Ubuntu_

```shell
?????  ruby@2.6.5
```

More info about Ruby instalation [here](https://www.ruby-lang.org/en/documentation/installation/)

> If you need other Ruby versions for other projects, you need to install [Ruby Version Manager](http://rvm.io) (RVM) that allows you to install and manage multiple installations of Ruby on your system. It can also manage different gemsets.

<br>
<br>

## <img src="./docs/postgresql.svg" width="30px" title="PostgreSQL"> [PostgreSQL](https://wiki.postgresql.org/wiki/Detailed_installation_guides)

Flow uses PostgreSQL database version 12.3, so you need to install it in your local and import [this]() data into the tables.

- _macOS_

  - [Postgres.app](https://postgresapp.com/downloads.html)

  - [pgAdmin](https://www.pgadmin.org/download/pgadmin-4-macos/)

<br>

- _Debian/Ubuntu_

  ```shell
  # apt install postgresql postgresql-client
  ```

  - [pgAdmin](https://www.pgadmin.org/download/pgadmin-4-apt/)

<br>
<hr>
<br>

# <img src="./docs/octocat.svg" width="30px" title="Cloning the Repository"> [Cloning the Repository](https://wiki.postgresql.org/wiki/Detailed_installation_guides)

> <img src="./docs/github.svg" width="20px" title="TypeScript"> [GitHub Desktop](https://desktop.github.com)
> Alternatively, you can use GitHub Desktop for Windows and macOS for deal with the repos.

<br>

_Debian/Ubuntu_

- Clone the repo

  ```Shell
  your@pc:~$ git clone https://github.com/FlowFintech/FlowBack
  ```

- Move into the cloned folder

  ```Shell
  your@pc:~$ cd FlowBack
  ```

- Get the dependencies needed for the app

  ```Shell
  your@pc:~$ bundle install
  ```

- Set environment variables

  ```shell
    export USERNAME="change to your database_username"
    export PASSWORD="change to your database_password"
    export HOST="change to your host address"
  ```

- NB: Defaults

  ```shell
    1. The default host is: "localhost" if you have not changed it
    2. Ensure that the USERNAME is a Superuser in psql
  ```

- Help cookies

  - Go to your terminal in ubuntu and type: `sudo su - postgres`
  - Then `psql` to access - Postgres
  - `\du` to list all user and their attributes
  - `ALTER ROLE username SUPERUSER` to alter the user.

- Create a postgres role to let rails manage the db:

  ```shell
  rake db:create
  ```

- Setup databases migrations:

  ```shell
  rake db:migrate
  ```

- Seed data for development

  ```shell
  your@pc:~$ rake db:seed
  ```

- Start the server and use the app

  ```shell
  your@pc:~$ rails s
  ```

<hr>
<br>

## Code Documentation

You can find [here](./doc/index.html) the documentation about Classes and Methods.

Here you can find the [API Documentation ](https://app.swaggerhub.com/apis/Flow-Fintech/FlowAPI/1.0.0/)

<br>
<hr>
<br>

## Contributing

Depending on whether your implementing a **feature**, doing a **chore**, fixing **bugs** or a **hotfix**, you must use the following branches naming convention: {type/short-description}
_Example_

```shell
git checkout -b bug/fixing-layout
git checkout -b feature/adding-loan-details
git checkout -b chore/correct-typo
git checkout -b hotfix/refactor-jb
```

> Your feature/bug branch should be requested to merge into the `dev` branch and upon approval and merging of the PR, the branch should be deleted.

<br>

### **Important**: Do not install any Gem, if you feel you miss some Gem, create a discussion thread in #backend channel in Slack

<br>

You can report <a href="https://github.com/FlowFintech/FlowBack/issues">Report Bugs here</a> or open a discussion thread in Slack.

<br>
<hr>
<br>

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
<br>
<hr>
<br>

## Live Version

This is the link to the live preview. Feel free to visit.<br>
[FlowBack](https://app.flowfin.tech/)<br>

<br>
<hr>
<br>
<!-- ROADMAP -->

## Roadmap

See the [open issues](https://github.com/FlowFintech/FlowBack/issues/issues) for a list of proposed features (and known issues).

<!-- CONTACT -->

## Contributors

[@TODO]

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributor-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=for-the-badge
[contributor-url]: https://github.com/FlowFintech/FlowBack/graphs/contributors
