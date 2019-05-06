# Serverless Rest APIs
This is a simple serverless application build over Jets framework of ruby. The application illustrate how we can create Serverless CRUD APIs using Jets framework.
## Requirements
* AWS CLI

## Setup

### Step 1 - Install AWS CLI
```sh
$ sudo apt install awscli
```

### Step 2 - Configure AWS CLI
```sh
$ aws configure
```
### Step 3 - Take clone of the repository

```ruby_on_rails
$ git clone https://gitlab.com/prateek-systango/serverless-rest-apis.git
$ cd serverless-rest-apis
$ bundle install
```

### Step 4 - Setup Database

```ruby_on_rails
$ jets db:create db:migrate db:seed
```
### Step 5 - Run Application

To start your the jets server locally, you need to run

```ruby_on_rails
$ jets s
```
Your Service must be running on http://localhost:8888

You can access the all the posts created using seed file on http://localhost:4000/posts

## Deployment
To deploy your application to AWS, you need to just run following single command

```ruby_on_rails
$ jets deploy
```

Once the application is deployed you will get the API endpoint using which you can access Live APIs.
