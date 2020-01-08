@view-cart
Feature: View Cart 

   Feature description: As a POC owner, I want to be able to view my current Cart items,
                        that way I can verify my order and proceed to checkout


    @MG-276_02
    Scenario: Clicking on Apply Discount Code link
        Given I am on the Shopping Cart page with an item in my cart
        When I click on Apply Discount Code
        Then I should see the Discount field be visible

        When I click on the link Apply Discount Code again
        Then I should see the Discount field be hidden

    @MG-276_03
    Scenario: Adding invalid discount code
        Given I am on the Shopping Cart page with an item in my cart
        When I inform an invalid cupom
        Then I should see an error message informing the code is invalid

    @MG-276_04
    Scenario: Adding valid discount code
        Given I am on the Shopping Cart page with an item in my cart
        When I inform a valid cupom
        Then I should see the discount I informed be applied

