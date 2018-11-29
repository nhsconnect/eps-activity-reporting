---
title: Searching Claims
keywords: development guide api
tags: [development]
sidebar: overview_sidebar
permalink: development_search_claims.html
summary: "Overview for developers on how to search claims"
---

## Requests ##

The following search parameters are supported:

* `billingPeriod` searches on period defined in the claim, which must be a 1 month period
* `organisation.identifier` searches on ODS code of the submitting organisation

### Period Comparators ###

The following comparators should be supported for billingPeriod.

| Prefix | Description |
|--------|-------------|
| eq |  the value for the parameter in the resource is equal to the provided value. This is implicit if not specified |
| ge |  the value for the parameter in the resource is greater or equal to the provided value |
| le |  the value for the parameter in the resource is less or equal to the provided value    |

These take the form of prefixes to the target value, so the search parameter for `billingPeriod=ge2018-11` would return Claims for billing periods after and including November 2018.

### ODS Matching ###

Searches based on identifiers must include the system used, in the form `[parameter]=[system]|[code]`. As ODS codes are used to identify organisation then the system is `https://fhir.nhs.uk/Id/ods-organization-code`. Hence to search for claims by ODS code *FLP42* the parameter `organisation.identifier=https://fhir.nhs.uk/Id/ods-organization-code|FKM23` would be used.

### Search Logic ###

If a parameter repeats then only results which meet both criteria must be included, hence this is a logical AND.

`/Claim?billingPeriod=ge2018-11&lbillingPeriod=le2018-12` would return all claims for November and December

`/Claim/?billingPeriod=ge2018-11` would return all claims after and including November

If, instead, the search is to find resources that fit either criterion then this is a single parameter with multiple values, separated by a ',' hence this is a logical OR.

`/Claim?organisation.identifier=https://fhir.nhs.uk/Id/ods-organization-code|FKM23,https://fhir.nhs.uk/Id/ods-organization-code|FLD27` would return claims for ODS code FLD27 and FKM23.

## Response ##
Requesting a Claim by ID returns just the Claim resource. Search results are returned as [Bundles](http://eps.digital.nhs.uk/fhir/StrutureDefinition/PharmacyConnect-DM-SearchsetBundle-1/) of Claim resources.

### Example Search Responses ###
*Successful Response:*
```json
{
  "resourceType": "Bundle",
  "meta": {
    "profile": [
      "http://eps.digital.nhs.uk/fhir/StrutureDefinition/PharmacyConnect-DM-SearchsetBundle-1/"
    ]
  },
  "type":"searchset",
  "total":2,
  "entry":[
    {
      "fullUrl":"http://example.nhs.uk/Claim/ab123",
      "resource":{
        "resourceType":"Claim"
        //...
      }
    },
    {
      "fullUrl":"http://example.nhs.uk/Claim/cd456",
      "resource":{
        "resourceType":"Claim"
        //...
      }
    }
  ]
}
```

*Unsuccessful Response:*
```json
{
  "resourceType": "OperationOutcome",
  "issue": [
    {
      "severity": "information",
      "code": "not-found",
      "details": {
        "coding":{
          "code":"7000",
          "description":"No Claim found matching the criteria",
          "system":"http://eps.digital.nhs.uk/fhir/ValueSet/PharmacyConnect-DM-ErrorOrWarningCode-1"
        }
      }
    }
  ]
}
```
