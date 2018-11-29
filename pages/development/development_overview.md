---
title: Development Overview
keywords: development guide api
tags: [development]
sidebar: overview_sidebar
permalink: development_overview.html
summary: "Overview for developers on how to integrate with the Service"
---

## API Design Approach ##

All requests use RESTful style in creating or reading Claim resources. FHIR has been used to model resources but the API does not claim conformance to the FHIR standard or existing NHS profiles. Claim resources necessarily include information on patients, immunizations, practitioners and organizations and these are included as their respective FHIR resources. As these are not managed as separate entities outside of a Claim these are only included as contained resources within the Claim resource.

### FHIR Resources used as a base ###

The API uses profiled versions of FHIR and CareConnect resources.

| FHIR Resource                | Activity Reporting Profile                                         |
| ---------------------------- | ------------------------------------------------------------------ |
| [Bundle](https://www.hl7.org/fhir/bundle.html)| [PharmacyConnect-DM-SearchsetBundle-1](https://simplifier.net/pharmacyactivityreporting/pharmacyconnect-dm-searchsetbundle-1)
| [Claim](https://www.hl7.org/fhir/claim.html)  | [PharmacyConnect-DM-FluVaccinationClaim-1](https://simplifier.net/pharmacyactivityreporting/pharmacyconnect-dm-fluvaccinationclaim-1)
| [Immunization](https://www.hl7.org/fhir/immunization.html)| [PharmacyConnect-DM-Immunization-1](https://simplifier.net/pharmacyactivityreporting/pharamacyconnect-dm-immunization-1)
| [Patient](https://www.hl7.org/fhir/patient.html) | [PharmacyConnect-DM-Patient-1](https://simplifier.net/pharmacyactivityreporting/pharmacyconnect-dm-patient-1)
| [Practitioner](https://www.hl7.org/fhir/practitioner.html) | [PharmacyConnect-DM-Practitioner-1](https://simplifier.net/pharmacyactivityreporting/pharmacyconnect-dmc-practitioner-1)
| [Organization](https://www.hl7.org/fhir/organization.html) | [PharmacyConnect-DM-Organization-1](https://simplifier.net/pharmacyactivityreporting/pharmacyconnect-dm-organization-1)
| [OperationOutcome](https://www.hl7.org/fhir/operationoutcome.html)| [PharmacyConnect-DM-OperationOutcome-1](https://simplifier.net/pharmacyactivityreporting/pharmacyconnect-dm-operationoutcome-1)

### Resource Serialization ###

The FHIR framework supports both XML and json serializations interchangeably. This release of the API supports only JSON.

### Error Handling ###
The API uses standard HTTP response codes with further details included in an OperationOutcome resource.

### Security ###

#### User Authentication & Authorization ####
Client systems are required to implement Role-Based Access Control using the Spine Security Broker. The details of the user and organisation are included in an OAuth Bearer Token carried in HTTP headers. The API is not expected to carry out any validation of user identity.

#### Client Endpoint Authentication ####
No client authentication is required, and systems are not required to use a client certificate when connecting to the service. Clients must install the root and intermediary Certificate Authorities used by the service, and must validate the server certificate used by the service, ensuring that it matches the hostname of the service.
