# README

## Intro

This is a Rails API application, completed as an 8-hour-maximum takehome assessment for the Turing School of Software and Design's Module 4, and requirements for the assessment can be found here: [Take-Home Back End Prompt](https://mod4.turing.edu/projects/take_home/take_home_be)

## Setup

To begin, clone this repository to your local machine, and run:

`$ bundle`

to update and install gems/dependencies.

## API Endpoints

### Create a New Customer

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

### Toggle Subscription Status

To toggle a user's subscription status between active and inactive, send a JSON `PATCH` request to `http://localhost:3000/api/v1/subscriptions/` in the format:

```json
{
  "customer_id": 1,
  "subscription_id": 2
}
```

If the subscription status is *active* ("1"), it will switch to *inactive* ("0"). If the subscription status is *inactive*, it will switch to *active*.