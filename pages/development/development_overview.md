---
title: Development Overview
keywords: development guide api
tags: [development]
sidebar: overview_sidebar
permalink: development_overview.html
summary: "Overview for developers on how to integrate with the Service"
---

## Development Overview ##

### Requests ###
All requests use RESTful style in creating or reading Claims. As Claim resources also reference Patient, Immunization, Practitioner and Organization resources these are included as contained resources within the Claim resource.


### Response ###
Response to POST will be a FHIR OperationOutcome which, along with the HTTP statusCode will indicate success or failure, with detail as necessary.

Response to searches will be a FHIR Bundle containing the requested Claim resources, or an OperationOutcome in case of failure.

### Error Handling ###
The API uses standard HTTP response codes with further details included in an OperationOutcome resource.

### Security ###

#### User Authentication & Authorization ####
Client systems are required to implement Role-Based Access Control using the Spine Security Broker. The details of the user and organisation are included in an OAuth Bearer Token carried in HTTP headers.

#### Endpoint Authentication ####
No client authentication is required, and systems are not required to use a client certificate when connecting to the service. Clients must install the root and intermediary Certificate Authorities used by the service, and must validate the server certificate used by the service, ensuring that it matches the hostname of the service. Systems should be registered Spine endpoints in order to provide their ASID in the request header.
