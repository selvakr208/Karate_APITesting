
@debug1
Feature: Verify the Non Functional test case for the get Article service

    Background: Make the url  domain call
        Given url apiURL

    @nonfunctional
    Scenario Outline: Verify that the get article service using PUT, DELETE, PATCH method
        Given path 'articles' , 2
        When method <Service_Method>
        * print responseStatus
        Then assert responseStatus != 200
        Then assert responseStatus != 400
        Then assert responseStatus == <expected_StatusCode>
        And match response == '<expected_ResponseMsg>'

    Examples:
    |Service_Method | expected_StatusCode| expected_ResponseMsg |
    |DELETE         | 404                | "Endpoint disabled"  |
    |PUT            | 404                | "Endpoint disabled"  |
    |PATCH          | 404                | "Endpoint disabled"  |


    @nonfunctional
    Scenario Outline: Verify that the get article service using POST method
        Given path 'articles' , 2
        When method <Service_Method>
        * print responseStatus
        Then assert responseStatus != 200
        Then assert responseStatus != 404
        Then assert responseStatus == <expected_StatusCode>
        And match response.msg == <expected_ResponseMsg>
        And match response == 
        """{
            "msg": "Invalid request"
        } """
    
    Examples:
    |Service_Method | expected_StatusCode| expected_ResponseMsg|
    |POST           | 400                | "Invalid request"   |
    
      