---
title: Creating a Claim
keywords: development guide api
tags: [development]
sidebar: overview_sidebar
permalink: development_create_claim.html
summary: "Overview for developers on how to create an activity reporting claim"
---

## Claim Resource ##
All requests use RESTful style in creating or reading [Claims](https://simplifier.net/pharmacyactivityreporting/pharmacyconnect-dm-fluvaccinationclaim-1). As Claim resources also reference [Patient](https://simplifier.net/pharmacyactivityreporting/pharmacyconnect-dm-patient-1), [Immunization](https://simplifier.net/pharmacyactivityreporting/pharamacyconnect-dm-immunization-1), [Practitioner](https://simplifier.net/pharmacyactivityreporting/pharmacyconnect-dmc-practitioner-1) and [Organization](https://simplifier.net/pharmacyactivityreporting/pharmacyconnect-dm-organization-1) resources these are included as contained resources within the Claim resource.

## Request ##
Claims are created through a POST request. As logical IDs for Claims are allocated by the Service, the POST is to the `/Claim` resource and should not include an ID for the Claim in the body. Any ID provided for the Claim will be ignored by the service which will manage and set its own.

[*Example Claim resource*](https://simplifier.net/pharmacyactivityreporting/claim-example)
```json
POST /Claim HTTP/1.1
Accept: text/fhir+json
Content-Length: 1234
Content-Type: text/fhir+json

{
  "resourceType": "Claim",
  "meta": {
    "profile": [
      "http://eps.digital.nhs.uk/fhir/StructureDefinition/PharmacyConnect-DM-FluVaccinationClaim-1"
    ]
  },
  "contained": [
    {
      "resourceType": "Practitioner",
      "meta": {
        "profile": [
          "http://eps.digital.nhs.uk/fhir/StructureDefinition/PharmacyConnect-DM-Practitioner-1"
        ]
      },
      "id": "practitioner1",
      "identifier": [{
        "system": "https://fhir.nhs.uk/Id/sds-user-id",
        "value": "504309731017"
      }],
      "name": {
        "use": "official",
        "family": "Jones",
        "given": ["Steven"],
        "prefix": ["Mr"]
      },
      "telecom": [{
        "system": "phone",
        "value": "01938850443",
        "use": "work"
      }]
    },
    {
      "resourceType": "Organization",
      "meta": {
        "profile": [
          "http://eps.digital.nhs.uk/fhir/StructureDefinition/PharmacyConnect-DM-Organization-1"
        ]
      },
      "id": "organization1",
      "identifier": [{
        "system": "https://fhir.nhs.uk/Id/ods-organization-code",
        "value": "FLN24"
      }],
      "name": "Cleethorpes Pharmacy",
      "telecom": [{
        "system": "phone",
        "value": "01938850440",
        "use": "work"
      }],
      "address": {
        "line": [
          "123 High Street",
          "Cleethorpes",
          "East Yorkshire"
        ],
        "postalCode": "CL3 1AB"
      }
    },
    {
      "resourceType": "Patient",
      "meta": {
        "profile": [
          "http://eps.digital.nhs.uk/fhir/StructureDefinition/PharmacyConnect-DM-Patient-1"
        ]
      },
      "id": "patient1",
      "identifier": [{
        "extension": [{
          "url": "https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-NHSNumberVerificationStatus-1",
          "valueCodeableConcept": {
            "coding": [{
              "system": "https://fhir.hl7.org.uk/STU3/CodeSystem/CareConnect-NHSNumberVerificationStatus-1",
              "code": "01",
              "display": "Number present and verified"
            }]
          }
        }],
        "system": "https://fhir.nhs.uk/Id/nhs-number",
        "value": "9912003888"
      }],
      "name": [{
        "use": "official",
        "family": "DAWKINS"
      }],
      "gender": "male",
      "birthDate": "2013-10-12",
      "address": [{
        "use": "home",
        "line": [
          "4 Sandmoor Drive"
        ],
        "city": "DURHAM",
        "postalCode": "DH1 2TF"
      }]
    },
    {
      "resourceType": "Immunization",
      "meta": {
        "profile": [
          "http://eps.digital.nhs.uk/fhir/StructureDefinition/PharmacyConnect-DM-Immunization-1"
        ]
      },
      "id": "immunization1",
      "status": "completed",
      "notGiven": "false",
      "vaccineCode": {
        "coding": {
          "system": "http://snomed.info/sct",
          "code": "22704311000001109",
          "display": "Fluarix Tetra vaccine suspension for injection 0.5ml pre-filled syringes (GlaxoSmithKline UK Ltd)"
        }
      },
      "patient": {
        "reference": "#patient1"
      },
      "primarySource": "true",
      "doseQuantity": {
        "value": 0.5,
        "unit": "ml",
        "system": "http://unitsofmeasure.org"
      },
      "explanation": {
        "reason": [{
            "coding": {
              "system": "http://snomed.info/sct",
              "code": "195967001",
              "display": "Asthma (disorder)"
            }
          },
          {
            "coding": {
              "system": "http://snomed.info/sct",
              "code": "77386006",
              "display": "Pregnant (finding)"
            }
          }
        ]
      },
      "extension": [{
        "url": "https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-VaccinationProcedure-1",
        "valueCoding": {
          "system": "http://snomed.info/sct",
          "code": "955691000000108",
          "display": "Seasonal influenza vaccination given by pharmacist (situation)"
        }
      }]
    },
    {
      "resourceType": "Patient",
      "meta": {
        "profile": [
          "http://eps.digital.nhs.uk/fhir/StructureDefinition/PharmacyConnect-DM-Patient-1"
        ]
      },
      "id": "patient2",
      "identifier": [{
        "extension": [{
          "url": "https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-NHSNumberVerificationStatus-1",
          "valueCodeableConcept": {
            "coding": [{
              "system": "https://fhir.hl7.org.uk/STU3/CodeSystem/CareConnect-NHSNumberVerificationStatus-1",
              "code": "01",
              "display": "Number present and verified"
            }]
          }
        }],
        "system": "https://fhir.nhs.uk/Id/nhs-number",
        "value": "9912003888"
      }],
      "name": [{
        "use": "official",
        "family": "Smith"
      }],
      "gender": "male",
      "birthDate": "1983-10-12",
      "address": [{
        "use": "home",
        "line": [
          "17 Sedgewick Crescent"
        ],
        "city": "DURHAM",
        "postalCode": "DH1 2RH"
      }]
    },
    {
      "resourceType": "Immunization",
      "meta": {
        "profile": [
          "http://eps.digital.nhs.uk/fhir/StructureDefinition/PharmacyConnect-DM-Immunization-1"
        ]
      },
      "id": "immunization2",
      "status": "completed",
      "notGiven": "false",
      "vaccineCode": {
        "coding": {
          "system": "http://snomed.info/sct",
          "code": "3255011000001100",
          "display": "Influvac Sub-unit vaccine suspension for injection 0.5ml pre-filled syringes (Mylan)"
        }
      },
      "patient": {
        "reference": "#patient2"
      },
      "primarySource": "true",
      "doseQuantity": {
        "value": 0.5,
        "unit": "ml",
        "system": "http://unitsofmeasure.org"
      },
      "explanation": {
        "reason": [{
          "coding": {
            "system": "http://snomed.info/sct",
            "code": "73211009",
            "display": "Diabetes mellitus (disorder)"
          }
        }]
      },
      "extension": [{
        "url": "https://fhir.hl7.org.uk/STU3/StructureDefinition/Extension-CareConnect-VaccinationProcedure-1",
        "valueCoding": {
          "system": "http://snomed.info/sct",
          "code": "955691000000108",
          "display": "Seasonal influenza vaccination given by pharmacist (situation)"
        }
      }]
    }
  ],
  "extension": [{
      "url": "http://eps.digital.nhs.uk/fhir/StructureDefinition/Extension-PharmacyConnect-DM-ImmunizationClaim-1",
      "valueReference": {
        "reference": "#immunization1"
      }
    },
    {
      "url": "http://eps.digital.nhs.uk/fhir/StructureDefinition/Extension-PharmacyConnect-DM-ImmunizationClaim-1",
      "valueReference": {
        "reference": "#immunization2"
      }
    }
  ],
  "billablePeriod": {
    "start": "2018-11-01",
    "end": "2018-11-30"
  },

  "enterer": {
    "reference": "#practitioner1"
  },
  "organization": {
    "reference": "#organization1"
  },
  "item": [{
    "sequence": 1,
    "service": {
      "coding": [{
        "system": "http://snomed.info/sct",
        "code": "22704311000001109",
        "display": "Fluarix Tetra vaccine suspension for injection 0.5ml pre-filled syringes (GlaxoSmithKline UK Ltd)"
      }]
    },
    "quantity": {
      "value": 1,
      "unit": "dose",
      "system": "http://snomed.info/sct",
      "code": "3317411000001100"
    }
  }, {
    "sequence": 2,
    "service": {
      "coding": [{
        "system": "http://snomed.info/sct",
        "code": "3255011000001100",
        "display": "Influvac Sub-unit vaccine suspension for injection 0.5ml pre-filled syringes (Mylan)"
      }]
    },
    "quantity": {
      "value": 1,
      "unit": "dose",
      "system": "http://snomed.info/sct",
      "code": "3317411000001100"
    }
  }]
}

```

## Claim Validation ##

The following validation rules must be applied by the service.

### Syntax ###

* Request must be valid json
* Request must be valid against the `http://eps.digital.nhs.uk/fhir/StructureDefinition/PharmacyConnect-DM-FluVaccinationClaim-1` profile

### Patient Eligibility ###

* The Eligibility Criteria Claim Summary Count must equal the total amount of Eligibility Criterion recorded within the Patient Detail

### Immunisation ###

* The Immunisation Claim Summary Doses must equal the total amount of Immunisation Summary Doses recorded within the Patient Detail
*	The total Doses count in the Immunisation Claim Summary must not be less than the total count within the Eligibility Criteria Claim Summary
*	The total Doses in the Immunisation Claim Summary must equal the total amount of Patient Details recorded
*	The Vaccine Procedure within the Immunisation Claim Summary and the Immunisation Summary within the Patient Detail must have value 822851000000102 - SNOMED CT concept for ‘Seasonal Influenza Vaccination (Procedure)

### Patient Demographics ###
*	All fields within the Patient Demographics class are optional – fields can be left blank
Advance Service Claim
* The month stated in the Signature Date field cannot be before the month reported in the Period field.
*	The month of submission (signature date) must not be later than 6 months from the reporting period
* The month of submission (signature date) must not be after a configurable date (defined by NHS England)

### Mandatory Fields ###

* The following fields must be present and not empty:
    - The Service Code field must contain information
    - The Organisation Name field must contain information
    - The Organisation Code field must contain information
    - The Vaccine Procedure field must contain information
    - The Vaccine Product field must contain information
    - The Doses field must contain information
    - The Eligibility Category field must contain information
    - The Eligibility Count field must contain information
    - Author ID field must contain information
    - Period field must contain information
    - Author Name field must contain information
    - Signature Date field must contain information
    - Accredited System field must contain information
    - Contact Detail field must contain information


## Response ##

When the Claim is successfully created and validated the server returns a _201 Created_ HTTP status code, and SHALL also return a Location header which contains the full URL to the newly created Claim, including the new logical ID of the created resource:

*Claim accepted*
```
HTTP/1.1 201 Created
Date: Thu, 29 Nov 2018 15:10:51 GMT
Content-Type: text/json+fhir
Location: [base]/Claim/[id]


```

When the resource syntax or data is incorrect or invalid, and cannot be used to create a new resource, the server returns a _400 Bad Request_ HTTP status code. When the server rejects the content of the resource because of business rules, the server returns a _422 Unprocessable Entity_ error HTTP status code. In either case, the server includes a response body containing an [OperationOutcome](https://simplifier.net/pharmacyactivityreporting/pharmacyconnect-dm-operationoutcome-1) with detailed error code and message describing the reason for the error.

*Unsuccessful Claim*
```json
HTTP/1.1 422 Unprocessable Entity
Date: Thu, 29 Nov 2018 15:10:51 GMT
Content-Type: text/json+fhir

{
  "resourceType": "OperationOutcome",
  "id": "validationfail",
  "issue": [
    {
      "severity": "error",
      "code": "required",
      "details": {
        "coding":{
          "code":"0002",
          "description":"The organisation name is missing",
          "system":"TODO"
        }
      },
      "location": [
        "/f:Claim/f:contained[2]/name"
      ]
    }
  ]
}
```

*Invalid Request*
```json
HTTP/1.1 400 Bad request
Date: Thu, 29 Nov 2018 15:10:51 GMT
Content-Type: text/json+fhir

{
  "resourceType": "OperationOutcome",
  "id": "validationfail",
  "issue": [
    {
      "severity": "error",
      "code": "required",
      "details": {
        "coding":{
          "code":"8000",
          "description":"Unable to parse request",
          "system":"TODO"
        }
      }
    }
  ]
}
```
