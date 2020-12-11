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
- [Live Version](#live-version)
- [Roadmap](#roadmap)
- [Authors](#authors)

<!-- ABOUT THE PROJECT -->

## About The Project

This project implements a web application to track investments, personal finance, budget, retirements, Financial Independence Retire Early movement FIRE, all stuff related to Personal Finance.

## Screenshots

#### Home

## Prerequisites Installations

<p>If you want a copy of this project running on your machine you have to install:</p>

- <a href="https://www.ruby-lang.org/en/downloads/">Ruby</a>
- <a href="https://git-scm.com/downloads">Git version control system</a>
- <a href="https://www.postgresql.org/download/">Postgres</a>

## Technology used

- Ruby
- Rails
- GitHub
- Postgresql

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
- Then `psql` to access - Postgresql
- `\du` to list all user and their attributes
- `ALTER ROLE username SUPERUSER` to alter the user.

Start the server and use the app

```Shell
your@pc:~$ rails s
```

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

