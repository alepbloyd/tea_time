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

<img width="1127" alt="create-user" src="https://user-images.githubusercontent.com/17027357/199339878-30adbea2-3f27-4f5c-aa24-02f0b6e9c4f2.png">

### Subscribe Customer

To subscribe an existing customer to an existing subscription, send a JSON `POST` request to `http://localhost:3000/api/v1/subscriptions/` in the format:

```json
{
    "customer_id": 1,
    "subscription_id": 1,
    "status": 1
}
```

![subscribe-customer](https://user-images.githubusercontent.com/17027357/199339899-6a7a630a-9cd8-4326-a31e-3150c4201e66.png)

### Toggle Subscription Status

To toggle a user's subscription status between active and inactive, send a JSON `PATCH` request to `http://localhost:3000/api/v1/subscriptions/` in the format:

```json
{
  "customer_id": 1,
  "subscription_id": 2
}
```

![activate-subscription](https://user-images.githubusercontent.com/17027357/199339939-e1df236c-f00a-4462-8023-736cf4fbfaf5.png)
![cancel-subscription](https://user-images.githubusercontent.com/17027357/199339952-09c9d9cc-c83d-43de-be7f-8fe32ae9d56a.png)


If the subscription status is *active* ("1"), it will switch to *inactive* ("0"). If the subscription status is *inactive*, it will switch to *active*.

### Get All Subscriptions for a Customer

To view all subscriptions for a customer, send a `GET` request in the format `http://localhost:3000/api/v1/subscriptions/:user_id`.

![all-subs](https://user-images.githubusercontent.com/17027357/199342136-d4f35e58-535f-43e6-a499-bb6a30f96a57.png)
