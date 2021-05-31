@debug1
Feature: Verify the getArticle list service

    Background: Make the url  domain call
        # Given url "https://5f99522350d84900163b8737.mockapi.io/tech-test/"
        Given url apiURL

    @functional
    Scenario: Verify that the get articleList service is using GET method
        Given path 'articles'
        When method GET
        Then status 200


    @smoke @functional
    Scenario: Verify that the get ArticleList service response status code is 200
        Given path 'articles'
        When method GET
        Then assert responseStatus == 200

@functional 
Scenario: Verify the response content type  and response type for get ArticleList service 
   
    Given path 'articles'
    When method GET
    Then status 200
    * def temp = responseHeaders['Content-Type'][0]
    * print temp
    And match responseHeaders['Content-Type'][0] contains 'application/json'
    * print responseType
    And assert responseType == 'json'

    @regression @smoke @functional
    Scenario: Verify that the get ArticleList service returns data in expected schema

        * def imageFormat = { "url": "#string", "fileType": "#string" }
        * def isValidTime = read('classpath:helpers/timeValidator.js')
        Given path 'articles'
        When method GET
        Then status 200
        And match response == "#array"
        And match response == '#[5]'
        And match each response ==
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
    @functional
    Scenario Outline: Verify that the size of article List that is returned from the service

        * def imageFormat = { "url": "#string", "fileType": "#string" }
        * def isValidTime = read('classpath:helpers/timeValidator.js')

        Given path '<path>'
        When method GET
        Then status 200
        And match response == "#array"
        And match response == '#[<Expected_ArticleListSize>]'

        Examples:
            | Expected_ArticleListSize | path     |
            | 5                        | articles |


    @functional
    Scenario Outline: Verify that the schema for "Image" Key ArticleList service

        Given path '<path>'
        When method GET
        Then status 200
        And match response == "#array"
        And match response[<imageIndex>].image == <imageObjectSchema>

        Examples:
            | imageIndex | imageObjectSchema                           | path     |
            | 1          | { "url": "#string", "fileType": "#string" } | articles |
            | 0          | null                                        | articles |
            | 2          | { "url": "#string", "fileType": "#string" } | articles |
            | 4          | {}                                          | articles |
            | 3          | {}                                          | articles |

    @functional
    Scenario Outline: Verify that the value of "Topics" key in ArticleList service

        Given path '<path>'
        When method GET
        Then status 200
        And match response..topics == "#array"
        And match response[<Topics_Index>].topics =='#[<Expected_TopicsSize>]'
        And match response[<Topics_Index>].topics == [<Expected_TopicsValues>]

        Examples:
            | Topics_Index | Expected_TopicsSize | Expected_TopicsValues               | path     |
            | 1            | 0                   |                                     | articles |
            | 0            | 3                   | "business","politics", "technology" | articles |
            | 2            | 0                   |                                     | articles |
            | 4            | 0                   |                                     | articles |
            | 3            | 1                   | "USA"                               | articles |

    @functional
    Scenario Outline: Verify the "Title" in ArticleList service

        Given path '<path>'
        When method GET
        Then status 200
        And match each response..title == '#string'
        And match response[<Title_Index>].title == "<Expected_TitleValues>"

        Examples:
            | Title_Index | Expected_TitleValues                    | path     |
            | 1           | title 2                                 | articles |
            | 0           | title 1                                 | articles |
            | 2           | £31 million pounds shortfall in economy | articles |
            | 4           | title 5                                 | articles |
            | 3           | title 4                                 | articles |

    @functional
    Scenario Outline: Verify the "Id" in ArticleList service

        Given path '<path>'
        When method GET
        Then status 200
        And match each response..id == '#string'
        And match response[<Id_Index>].id == "<Expected_IdValues>"

        Examples:
            | Id_Index    | Expected_IdValues                  | path     |
            | 1           |  2                                 | articles |
            | 0           |  1                                 | articles |
            | 2           |  3                                 | articles |
            | 4           |  5                                 | articles |
            | 3           |  4656364867443                     | articles |

    @functional
    Scenario Outline: Verify the "Priority" and "sensitive" value in ArticleList service

        Given path '<path>'
        When method GET
        Then status 200
        And match each response..sensitive == '#boolean'
        And match each response..priority == '#number'
        And match response[<Index>].sensitive ==  <Expected_SensitiveValues>
        And match response[<Index>].priority ==  <Expected_PriorityValues>

        Examples:
            | Index    | Expected_SensitiveValues  | Expected_PriorityValues | path     |
            | 1        |  true                     |    45                   | articles |
            | 0        |  false                    |    89                   | articles |
            | 2        |  false                    |    25                   | articles |
            | 4        |  false                    |    56                   | articles |
            | 3        |  true                     |    0                    | articles |                   
    
    @regression @smoke @functional
    Scenario Outline: Verify the expected response in ArticleList service

        * def response_ArticleList = read('classpath:App_sky/json/expectedReq_Res/ArticleListResponse.json')
        Given path '<path>'
        When method GET
        Then status 200
        And match response == response_ArticleList
       # * print response
        
        # And match each response..sensitive == '#boolean'
        # And match each response..priority == '#number' 
        # And match response[<Index>].sensitive ==  response_ArticleList[<Index>].sensitive
        # And match response[<Index>].priority ==  response_ArticleList[<Index>].priority

        Examples:
            | path     |
            | articles |
            

  