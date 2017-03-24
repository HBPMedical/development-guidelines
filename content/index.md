---
title: Development guidelines
date: '2017-03-24T16:30:51+02:00'
type: index
weight: 0
draft: false
---

## Development guidelines for the Medical Informatics Platform

* Preface: link TRLs to well defined actions for developers, make best use of free tooling for open-source developers
* Component maturity self-check
* Team collaboration
    * Github, code sharing on common repo, keep institution owner of own work
    * Project management: Trello, Github, youTrack...
    * Documentation https://www.youtube.com/watch?v=bahmdinAmHY
        * Architecture overview
        * Cookbook
        * Step by step
            * for developers
            * for operations
            * for managers
    * Reputation:
         * license compliance: fossa.io
* Effective Github
   * TRL1: project creation, registration, description (README); link to opensource.guide
   * TRL2: specs in docs/specs.md; issue tracker - Github, Trello
   * TRL4: documentation including URL, using Github pages to host documentation site, or alternative Readthedocs; setup a project wiki
  * TRL5: versioning, use Git tags for clear cut releases, leverage Github downloads, Pypi, Maven central, Docker hub to distribute binary releases
  * TRL6: code quality assessment, use static code analysis, code style checks and code linting - Codacy...
  * TRL7: unit tests, continuous integration, use code coverage tools: Travis, CircleCI, Werker
  * TRL8: integration tests
  * TRL9: continuous deployment, web hooks
* Effective Python
* Effective Java
* Effective Scala
* Effective Matlab
    ever possible ???
* Effective Docker
   * use Docker to run your apps, which apps are available from Docker; navigate Docker hub, quay.io, SP8 catalog of Docker images - suggest inclusion of Docker references to PLA
   * docker-compose to test complex applications with ease
   * TRL5: build, release cycle; deploy a new release to Docker hub
   * TRL9: continuous deployment with now.sh and web hooks
   * graph of Docker images, to use to reduce footprint and upgrade all base images following security updates
   * JVM in Docker: https://developers.redhat.com/blog/2017/03/14/java-inside-docker/

* Production
Below are items to check for a production environment:

- [ ] Performance monitoring (e.g. NewRelic)
- [ ] Exception notification (e.g. Rollbar)
- [ ] Google Analytics
- [ ] Database backup
- [ ] Email configuration
- [ ] Verify production settings (i.e. manual test the critical happy path)

# Testing Style Guide
What and where to test:

* Acceptance tests `features` (Cucumber):
  * Separate feature file for each feature set
  * Domain API
  * UI
  * At least one scenario for error handling (both domain & UI)
* Model specs `spec/models/:
  * logic
  * validations
  * not the associations
* Controller specs `spec/controller`
  * no controller specs, unless there is something awkward to test.
* Request specs `spec/requests/`
  * CRUD'ing look up tables (i.e. not business operations)
  * following the notes on the "Web World" for how to structure tests
  * example: [EventType Request Spec](https://github.com/airslie/renalware/blob/master/spec/requests/events/event_types_spec.rb)

## Notes on writing good Acceptance Tests:

* Scenario title: "That time when...". i.e. `Scenario: A clinician updated a patient's registration`
* The Web World is only used by the `When` statements.  `Given` statements prepares the
scenario using direct-model access, not the UI. `Then` statements verifies the scenario using direct-model access, again, not the UI.
* View the feature [Changing the Waitlist Status](https://github.com/airslie/renalware/blob/master/features/renalware/transplants/changing_the_wait_list_status.feature) of a good example
