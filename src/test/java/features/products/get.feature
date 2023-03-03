Feature: Testing product API with Get requests

  Background:
    * url 'http://192.168.252.131:8082/'

  Scenario: get all products
    Given path 'products'
    When method get
    Then status 200

  Scenario: get the first product by id
    Given path 'products'
    When method get
    Then status 200

    * def first = response[0]

    Given path 'products', first.id
    When method get
    Then status 200

  Scenario: get the product by id
    * def id = '63fc88c6852be1486593e1d8'
    * def bookName = 'Finance Management'

    Given path 'products', id
    When method get
    Then status 200
    * print response.name
    And     match response.name == bookName
