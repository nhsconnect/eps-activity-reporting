---
title: Creating a Claim
keywords: development guide api
tags: [development]
sidebar: overview_sidebar
permalink: development_view_claim.html
summary: "Overview for developers on how to view an activity reporting claim"
---

### Claim Resource ###
All requests use RESTful style in creating or reading Claims and accordingly Claims can be accessed by the ID allocated by the service.

### Request ###
Claims are viewed by sending a GET request for the Claim URL returned by the service on creation, for example `/Claim/a123`.

*View claim*
```json
GET /Claim/ab123 HTTP/1.1
Host: eps.digital.nhs.uk
User-Agent: curl/7.54.0
Accept: text/json+fhir
Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJub25lIn0.eyJzdWIiOiI1MDQzMDk3MzEwMTciLCJhdWQiOiJodHRwczovL3N0Zy5uaHNkYXBpLmFzc3VyZWQubmhzYnNhLm5ocy51ay9ydGVjLWFwaS1nYXRld2F5L3YxLjAuMC9zZWFyY2giLCJyZXF1ZXN0aW5nX2RldmljZSI6IjIwMDAwMDAwMDk0NiIsInJlcXVlc3RpbmdfcHJhY3RpdGlvbmVyIjoiNTA0MzA5NzMxMDE3IiwicmVxdWVzdGluZ19vcmdhbml6YXRpb24iOiJBMUIyQyIsImlzcyI6IjIwMDAwMDAwMDk0NiIsImV4cCI6MTU0Mjk5NTk5MSwiaWF0IjoxNTQyOTk1NjkxLCJyZWFzb25fZm9yX3JlcXVlc3QiOiJkaXJlY3RjYXJlIiwicmVxdWVzdGVkX3Njb3BlIjoiL3J0ZWMtYXBpLWdhdGV3YXkvdjEuMC4wL3NlYXJjaCJ9.
```

### Response ###

For a successful response the server returns a _200 OK_ HTTP status code and the Claim resource, including ID. If the Claim cannot be found the server returns a _404 Not Found_ HTTP status code, and an OperatioOutcome indicating the same.

```json
HTTP/1.1 200 OK
Date: Thu, 29 Nov 2018 15:10:51 GMT
Content-Type: text/json+fhir

{
  "resourceType": "Claim",
  "id":"ab123",
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
