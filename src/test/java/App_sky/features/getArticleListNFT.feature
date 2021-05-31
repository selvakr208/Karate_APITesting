@debug1
Feature: Verify the Non Functional test case for the get list of Article service

    Background: Make the url  domain call
        Given url apiURL

    @nonfunctional
    Scenario: Verify that the get articleList service using POST method
        Given path 'articles'
        When method POST
        * print responseStatus
        Then assert responseStatus != 200
        Then assert responseStatus != 400
        Then assert responseStatus == 404
        And match response == '"Endpoint disabled"'


    @nonfunctional
    Scenario Outline: Verify that the get articleList service using DELETE, PUT, PATCH method
        Given path 'articles'
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
    |DELETE         | 400                | "Invalid request"   |
    |PUT            | 400                | "Invalid request"   |
    |PATCH          | 400                | "Invalid request"   |
      