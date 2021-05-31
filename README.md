# Karate_APITesting

Author: Selvakumar Elaiyaperumal
Email:  Selvakr208@gmail.com
Mobile: 044 7587806928
Tools: Karate, Maven 
Programming Language: Java, Javascript

This repository has Karate framework structure which can be re used to build Automation Framework for API testing.

Note: I have used VScode as my IDE for this framework. Based on your IDE, you need to setup few plugins which is not covered in below setup instructions.

Pre Requisite for Framework setup:
 1. Java 8  and Maven needs to installed and environment variable needs to be configured
 2. Cucumber (Gherkin) Full Support
 3. Karate Runner
 4. Open In Default Browser
 5. Java Extension Pack

How to execute the test cases: 
 In order to execute the test suite, we have to command prompt. Follow below steps to execute the test suite.
 Step 1: Download or clone the project folder from the Git repository.
 Step 2: Navigate to the the project root folder "Sky_Assignment" in the local computer.
 Step 2: Import the project to any of the IDE like VScode, Eclipse. (Recommended to use VScode)
 Step 3: Open the project root folder "Sky_Assignment" in IDE explorer
 Step 4: Navigate to "pom.xml" file and update the project. So that all the dependencies mentioned in the file will get downloaded and updated.
 Step 5: After successful update of the pom file, navigate to project roort folder (Sky_Assignment) command prompt/terminal in IDE (VScode). Use below command and tap ENTER
    mvn clean
    mvn test "-Dkarate.options = --tags @smoke"

Examples: 
mvn test "-Dkarate.options = --tags @debug1"
mvn test "-Dkarate.options = --tags @debug1"  "-Dkarate.env = qa"
mvn test "-Dkarate.options = --tags @smoke"
mvn test "-Dkarate.options = --tags @regression"
mvn test "-Dkarate.options = --tags @nonfunctional"

Tags used:
@smoke --> It will run only smoke test scenarios from all feature file
@regression --> It will run only Regression test scenarios from all feature file
@functional --> It will run only functional test scenarios from all feature file
@nonfunctional --> It will run only Non functional test scenarios from all feature file
@debug1 --> It will run all the scenario and scenario outline from all feature file


Report:
Used inbuilt KarateBDD cucumber report which is easy to manage with the lot of information are covered in the report.
Location for the report is --> /Sky_Assignment/target/karate-reports/karate-summary.html
Note: Attached sample report along with the project in the above mentioned folder


Project Folder structure:

Sky_Assignment
|
|App_sky
        |featurs
            |GetArticle.feature
            |GetArticleList.feature
            |getArticleListNFT.feature
            |getArticleNFT.feature
        |json
            |expectedReq_Res
                |ArticleListResponse.json
                |GetArticleResponse.json
        |App_skyTest.java
|helpers
    |DataGenerator.java
    |timeValidator.js
|karate-config.js
|target
|pom.xml
|README.md


Test scenarios covered:
Functional:
Below are the high level test scenarios that are covered in this automation

Positive Test scenarios

1. Schema validation (Contract validation)
2. Response type
3. Response status code
4. Response format
5. Content-Type
6. Response data each (As a data driven)
7. Response comparison using external file
8. Response data type
9. Request method

Negative Test scenarios for failed service
1. Response code like 400, 404
2. Response message like Invalid request, Endpoint disabled
3. Request method PUT, PATCH, DELETE, POST

