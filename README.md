# CoolStore Online Store App

## Overview
CoolStore is an online store web application sample built using devfile applications(Spring Boot, Quarkus, Vert.x, 
Node.js and AngularJS) adopting the microservices architecture.

* **Web**: A Node.js/Angular front-end
* **API Gateway**: aggregates API calls to back-end services and provides a condenses REST API for front-end
* **Catalog**: a REST API for the product catalog and product information
* **Inventory**: a REST API for product's inventory status

```
                    +-------------+
                    |             |
                    |     Web     |
                    |             |
                    |   Node.js   |
                    |  AngularJS  |
                    +------+------+
                          |
                          v
                    +------+------+
                    |             |
                    | API Gateway |
                    |             |
                    |   Vert.x    |
                    |             |
                    +------+------+
                          |
                +---------+---------+
                v                   v
          +------+------+     +------+------+
          |             |     |             |
          |   Catalog   |     |  Inventory  |
          |             |     |             |
          | Spring Boot |     |   Quarkus   |
          |             |     |             |
          +-------------+     +-------------+
```


## Agenda

* Introduction to Cloud-Native Development
* Getting your Developer Workspace with Eclipse Che7
* Building Services with Quarkus
* Building Services with Spring Boot
* Building Reactive Services with Vert.x
* Monitoring Application Health
* Service Resilience and Fault Tolerance
* Externalize Application Configuration
* Building Cloud-Native Pipelines with Tekton
* Connecting and monitoring microservice applications with Service Mesh
* Setting up A/B Testing with Service Mesh

## Deploy the Workshop on Che
