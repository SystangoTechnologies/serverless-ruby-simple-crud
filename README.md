# Serverless Rest APIs
This is a simple serverless application build over Jets framework of the ruby. The application illustrates how we can create Serverless CRUD APIs using Jets framework.
## Requirements
* RVM
* Ruby(2.5.1)
* AWS CLI

## Setup

### Step 1 - Install RVM
* Follow the steps given here: https://rvm.io/rvm/install, to install RVM in your machines

### Step 2 - Install Ruby
To install ruby(2.5.1) in your machine, run following command
```sh
$ rvm install ruby-2.5.1
```
### Step 3 - Install & Configure AWS
```sh
$ sudo apt install awscli
$ aws configure
```

### Step 4 - Take clone of the repository

```ruby_on_rails
$ git clone https://gitlab.com/prateek-systango/serverless-rest-apis.git
$ cd serverless-rest-apis
$ bundle install
```

### Step 5 - Setup Database

```ruby_on_rails
$ jets db:create db:migrate db:seed
```
### Step 6 - Run Application

To start your the jets server locally, you need to run

```ruby_on_rails
$ jets s
```
Your Service must be running on http://localhost:8888

You can access the all the posts created using seed file on http://localhost:4000/posts

## Deployment
 Before we deploy, we need to create a database that AWS Lambda will have access to. 
 We’ll also have to create and migrate the RDS database.
```ruby_on_rails
$ vim .env.development.remote # configure a remote RDS DB
$ JETS_ENV_REMOTE=1 jets db:create db:migrate
```
Once that is completed, let’s deploy our application to AWS Lambda.

```ruby_on_rails
$ jets deploy
```

Once the application is deployed you will get the API endpoint using which you can access  APIs.

## Security

Once API gateway is created, you must setup Usage plan along with their API Keys form API gateway console. For this, you can follow the [official doc](https://docs.aws.amazon.com/apigateway/latest/developerguide/api-gateway-setup-api-key-with-console.html) for the same given by AWS.

If you want a custom authorization instead of this, just comment out the **before_filter:authorize** line in application.rb to make custom authorization work.