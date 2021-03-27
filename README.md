[![CI](https://github.com/ravgeetdhillon/dart_shelf_server_sample/actions/workflows/ci.yml/badge.svg)](https://github.com/ravgeetdhillon/dart_shelf_server_sample/actions/workflows/ci.yml)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

# Dart Shelf Server Sample

- [Dart Shelf Server Sample](#dart-shelf-server-sample)
  - [Features](#features)
  - [Getting Started](#getting-started)
  - [Configuration](#configuration)
  - [API](#api)
  - [Static Files](#static-files)
  - [Dart to JS](#dart-to-js)
  - [License](#license)

## Features

A web server built using [Shelf](https://pub.dev/packages/shelf). Following features have been implemented:

- [x] Serve a REST API in JSON
- [x] Serve static files from the server
- [x] Render HTML
- [x] Compile Dart Code to Javascript

## Getting Started

Perform the following operations to set up the project.

```bash
git clone https://github.com/ravgeetdhillon/dart_shelf_server_sample
pub get
nodemon
```

> Nodemon is an NPM package used to watch for the changes in source code and restart the shelf server automatically. You can install it by doing `npm i -g nodemon`.

Visit [http://localhost:8080](http://localhost:8080) and make sure you see the following screen:

![Screenshot of the index page of Web Server](screenshots/main.png)

## Configuration

All of the configurable constants are present in `lib/config/constants.dart`.

## API

All the data related to API is stored in the `data/api` directory.

| Routes                | Description                                 |
| --------------------- | ------------------------------------------- |
| **GET** `/posts`      | Get all the posts                           |
| **GET** `/posts/{id}` | Get a single post identified by its id      |
| **GET** `/files`      | Get a list of files available on the server |

## Static Files

Use the `/files` route to get the list of static files available on the server. Static files are stored in the `files` directory.

## Dart to JS

Dart code is compiled to JS using the **dart2js** library. Nodemon automatically watches for the changes in `lib` and `bin` directories and runs `dart2js -o public/assets/script.js lib/standalone/index.dart`.

## License

MIT
