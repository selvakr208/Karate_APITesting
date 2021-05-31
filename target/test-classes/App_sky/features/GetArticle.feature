@debug1
Feature: Verify the get the Article details

Background: Make the url  domain call
Given url apiURL


@smoke @functional
Scenario Outline: Verify that method type for get article service is GET

Given path '<path>',<Article_ID>
When method GET
Then status 200

Examples:
|Article_ID | path     |
|2          | articles |
|3          | articles |

@functional
Scenario: Verify the status code for get Article service is 200
   
    Given path 'articles' , 2
    When method GET
    Then assert responseStatus == 200


@functional 
Scenario: Verify the response content type  and response type for get Article service 
   
    Given path 'articles' , 2
    When method GET
    Then status 200
    * def temp = responseHeaders['Content-Type'][0]
    * print temp
    And match responseHeaders['Content-Type'][0] contains 'application/json'
    * print responseType
    And assert responseType == 'json'


@regression @smoke @functional
Scenario Outline: Verify the expected values for the get article service is as per expected json file data

* def response_Article = read('classpath:App_sky/json/expectedReq_Res/GetArticleResponse.json')
Given path '<path>',<Article_ID>
When method GET
Then status 200
And assert response.id == response_Article.id
And match response == response_Article

Examples:
|Article_ID | path     |
|2          | articles |


@regression @smoke @functional
    Scenario Outline: Verify the response of get Article service is as per the expected schema

        * def imageFormat = { "url": "#string", "fileType": "#string" }
        * def isValidTime = read('classpath:helpers/timeValidator.js')
        Given path '<path>',<Article_ID>
        When method GET
        Then status 200
        And match response == "#object"
        And match response != '#array'
        And match response ==
            """
            {
                "id": "#string",
                "createdAt": "#? isValidTime(_)",
                "title": "#string",
                "sensitive": "#boolean",
                "topics": "#array",
                "image": "##object",
                "priority": "#number"
            }
            """
Examples:
|Article_ID | path     |
|2          | articles |


