[![Gitmoji](https://img.shields.io/badge/gitmoji-%20😜%20😍-FFDD67.svg)](https://gitmoji.dev) [![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop-hq/rubocop)

[![Contributor][contributor-shield]][contributor-url]

<br>

<img src="https://dev.flowfin.tech/docs-back/docs/flow-header.svg">

<br>

<br>

# [Ruby StyleGuide (Read)](https://dev.flowfin.tech/docs-back/docs/StyleGuide-Ruby.adoc)

<br>

# Getting Started

⚠️ First you must go to [Flow Developer Portal](https://dev.flowfin.tech) for the general requirements and the project overview.

<hr>

<br>

## <img src="./docs/ruby.svg" width="30px" title="Ruby"> [Ruby](https://www.ruby-lang.org/en/documentation/installation/)

Is possible that you already have Ruby installed in your computer, you can check it typing the following comand in your terminal.

```terminal
ruby -v
```

<br>

### Installing Ruby

_**macOS**_ using [Homebrew](http://brew.sh/")

```terminal
brew install ruby@2.6.5
```

_**Ubuntu**_

```terminal
sudo apt install ruby-full
```

More info about Ruby instalation [here](https://www.ruby-lang.org/en/documentation/installation/)

We are using ruby version **_2.6.5_**, is important to use this version. If you are using a diferent version of Ruby, upgrade or downgrade the version using the [Ruby Version Manager](http://rvm.io) (RVM) that allows you to install and manage multiple installations of Ruby on your system. It can also manage different gemsets.

<br>
<hr>
<br>

# <img src="./docs/octocat.svg" width="30px" title="Cloning the Repository"> [Cloning the Repository](https://github.com/FlowFintech/FlowBack)

<br>

_**Ubuntu**_

- Clone the repo

  ```terminal
  your_username@pc:~$ git clone git@github.com:FlowFintech/FlowBack.git
  ```

- Move into the cloned folder

  ```terminal
  your_username@pc:~$ cd FlowBack
  ```

## Normal Install

- Get the dependencies needed for the app

  ```terminal
  FlowBack:~$ bundle install
  ```

- Set environment variables

  ```terminal
  FlowBack:~$ export USERNAME="change to your database_username"
  ```

  ```terminal
  FlowBack:~$ export PASSWORD="change to your database_password"
  ```

  ```terminal
  FlowBack:~$ export HOST="change to your host address"
  ```

- NB: Defaults

  ```terminal
    1. The default host is: "localhost" if you have not changed it
    2. Ensure that the USERNAME is a Superuser in psql
  ```

- Help cookies

  - Go to your terminal in ubuntu and type: `sudo su - postgres`
  - Then `psql` to access - Postgres
  - `\du` to list all user and their attributes
  - `ALTER ROLE username SUPERUSER` to alter the user.

- Create a postgres role to let rails manage the db:

  ```terminal
  rake db:create
  ```

- Setup databases migrations:

  ```terminal
  rake db:migrate
  ```

- Seed data for development

  ```terminal
  your_username@pc:~$ rake db:seed
  ```

- Start the server and use the app

  ```terminal
  your_username@pc:~$ rails s
  ```

## Docker Install

- Install Docker if you haven't done yet from [here](https://www.docker.com/get-started).
- Make sure you have docker running before commencing with this installation.
- You may also need to uncomment the 25th line of the `config/database.yml` file for some of the instructions below to work.

  ⚠️**Be sure NOT to commit and push the changes affecting this file though**.

```yml
  #  host: <%= ENV['HOST'] || 'flowback_db_1' %>
```

- Docker is already configured. Please DO NOT add anything to the following files when pushing changes:
  - `config/database.yml`
  - `docker-compose.yml`
  - `dockerfile`

### After you have started docker, in your root directory run the following commands in the order

**_Steps:_**

1. Go to backend folder

2. Run this one time only:

  ```terminal
  your_username@pc:~$ docker build -t flowbackend ./
  ```

- Open a new terminal, and inside the flow directory run the following to create and respective databases and run the migrations.

  ```terminal
  docker-compose run web rails db:create && docker-compose run web rails db:migrate
  ```

- Go back to the previous terminal.

- Run this command to start docker: every time you want to restart backend.

  ```terminal
  your_username@pc:~$ docker run -dp 3001:3001 flowbackend
  ```

#### Short order of the same instructions

**_Steps:_**

1. Go to backend folder.

2. Open a new terminal, and inside the flow directory run the following to create and respective databases and run the migrations.

  ```terminal
  docker-compose run web rails db:create && docker-compose run web rails db:migrate
  ```

- Run this command to bundle up everything and start the server at one go:

  ```terminal
  your_username@pc:~$ docker-compose up --build
  ```

  Confirm if the server is running by heading over to: [http://localhost:3001](http://localhost:3001)

### **Note:** Instructions to seed the database should follow soon

<hr>
<br>

## Contributing

Depending on whether your implementing a **feature**, doing a **chore**, fixing **bugs** or a **hotfix**, you must use the following branches naming convention: {type/short-description}
_Example_

```terminal
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

## Roles

The project has three type of users.

**Admin:** This is the sole owner and add/remove a Contributor. Has full system access

**User:** This is the investors who comes with his/her data after investing on platforms to utilize our system to manage this data and be of value to them.

**Contributor:** This is a user(moderators) given privileges by the admin to add, edit, delete some for the information related to the core app functions eg add platforms data so when an investor come to use the system all they need to scroll from available options.

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
   <img src="https://dev.flowfin.tech/docs-back/docs/screenshots/register.png" alt="screenshot1"/>

2. Now that you got the response of the request, the params you need are in the header of the request, click to Headers tab to see them.
   <img src="https://dev.flowfin.tech/docs-back/docs/screenshots/header.png" alt="screenshot1"/>

3. Then create a new request in Postman with the GET that requires the authorization and in Headers set the values access-token, client, uid from the header of the last request.
<img src="https://dev.flowfin.tech/docs-back/docs/screenshots/request.png" alt="screenshot1"/>
<br>
<hr>
<br>

<!-- MARKDOWN LINKS & IMAGES -->
<!-- https://www.markdownguide.org/basic-syntax/#reference-style-links -->

[contributor-shield]: https://img.shields.io/github/contributors/othneildrew/Best-README-Template.svg?style=for-the-badge
[contributor-url]: https://github.com/FlowFintech/FlowBack/graphs/contributors
