Feature: Testing product API with POST and DELETE requests

  Background:
    * url 'http://192.168.252.131:8082/'

  Scenario: post the product and delete the product by id
    Given     path "/products"
    And     request {"name":"The Light We Carry: Overcoming in Uncertain Times", "price": 332}
    When    method Post
    Then    status 201
    * print response
    * def newId = response.id
    * print newId
    Given path 'products', newId
    When    method Delete
    Then    status 200
    * print response
    And match response == 'Deleted'
