---
title: Error Handling
keywords: development deliverables
tags: [development]
sidebar: overview_sidebar
permalink: errors.html
summary: "Description of how service errors are represented"
---


## Error Handling ##

In most cases an error response will result in the user opting to follow the normal paper process, so errors MUST not block user action or be reported in an intrusive way.

### HTTP Status ###
The API uses standard HTTP response codes to indicate success.

| Status Code   | Outcome                           |
|:-------------:|-----------------------------------|
| 200           | Claim has been accepted           |
| 400           | Bad request                       |
| 401           | Unauthorised                      |
| 404           | Claim has not been found          |
| 500           | Unexpected error occurred         |
| 501           | Not implemented
| 503           | Service unavailable               |

### Error Detail ###
Errors are reported as an OperationOutcome resource. A complete errorbase will be provided in a later release.
