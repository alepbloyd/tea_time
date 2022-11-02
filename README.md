# README

## Intro

This is a Rails API application, completed as an 8-hour-maximum takehome assessment for the Turing School of Software and Design's Module 4, and requirements for the assessment can be found here: [Take-Home Back End Prompt](https://mod4.turing.edu/projects/take_home/take_home_be)

## Database

![DB](https://user-images.githubusercontent.com/17027357/199605700-593c5f72-6a3b-4d3b-a1e3-0be83bcbfe5b.png)

## Setup

To begin, clone this repository to your local machine, and run:

`$ bundle`

to update and install gems/dependencies.

To create and seed a database with random customers, subscriptions, and joins between them, run:

```
$ rails db:create
$ rails db:migrate
$ rails db:seed
```


# API Endpoints

## Create a New Customer

To create a new customer, send a JSON `POST` request to `http://localhost:3000/api/v1/customers/` in the format:

```json
{
    "first_name": "Jimmy",
    "last_name": "Snakes",
    "email": "jimmy_snakes@email.net",
    "street_address": "123 Python St",
    "city": "Reno",
    "state_ab": "NV"
}
```

![create_customer](https://user-images.githubusercontent.com/17027357/199598896-92cb7749-43ca-4c81-9c04-b60e2616b89d.png)

## Subscribe Customer

To subscribe an existing customer to an existing subscription, send a JSON `POST` request to `http://localhost:3000/api/v1/customer_subscriptions/` in the format:

```json
{
    "customer_id": 1,
    "subscription_id": 1,
    "status": 1
}
```

![create_customer_subscription](https://user-images.githubusercontent.com/17027357/199598988-1e38b6ff-6904-40ac-847d-0dbde006a27d.png)

## Toggle Subscription Status

To toggle a user's subscription status between active and inactive, send a JSON `PATCH` request to `http://localhost:3000/api/v1/customer_subscriptions/status` in the format:

```json
{
  "customer_id": 1,
  "subscription_id": 2
}
```

![cancelled](https://user-images.githubusercontent.com/17027357/199599329-d44e0c39-2e3b-4b5c-967c-fcb817ee9c84.png)
![activated](https://user-images.githubusercontent.com/17027357/199599345-af57b2f1-7085-4b66-a3f4-996e5a951e24.png)

If the subscription status is *active* ("1"), it will switch to *inactive* ("0"). If the subscription status is *inactive*, it will switch to *active*.

## Get All Subscriptions for a Customer

To view all subscriptions for a customer, send a `GET` request in the format `http://localhost:3000/api/v1/customer_subscriptions/:user_id`.


![customer_subscriptions](https://user-images.githubusercontent.com/17027357/199599070-ad6fbd33-080a-4081-8583-f57f7967bce9.png)
