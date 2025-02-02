@regression
  Feature: Login Feature
    In Order to perform successful login
    As a User
    I have to enter correct username and password

  @author_Smita @smoke
  Scenario: User should navigate to login page successfully
    Given I am on homepage
    When  I click on login link
    Then  I should navigate to login page successfully

    @author_Smita @regression
  Scenario Outline: Verify the error message with invalid credentials
    Given I am on homepage
    When  I click on login link
    And I enter email "<email>"
    And I enter password "<password>"
    And I click on login button
    Then I should see the error message "<errorMessage>"
    Examples:
      | email             | password | errorMessage                                                                                |
      | abcd123@gmail.com | xyz123   | Login was unsuccessful. Please correct the errors and try again.\nNo customer account found |
      | xyz123@gmail.com   | abc123   | Login was unsuccessful. Please correct the errors and try again.\nNo customer account found |
      | adfafasd@gmail.com | xyz123   | Login was unsuccessful. Please correct the errors and try again.\nNo customer account found |

    @author_Smita @smoke @sanity
  Scenario: User should log in successfully with valid credentials
    Given I am on homepage
    When  I click on login link
    And   I enter email "prime123@gmail.com"
    And   I enter password "prime123"
    And   I click on login button
    Then  I should login successfully

    @author_Smita @regression
    Scenario: User should logout successfully
      Given I am on homepage
      When  I click on login button
      And I enter email "prime123@gmail.com"
      And   I enter password "prime123"
      And I click on login button
      And I click on logout button
      Then User should logout successfully
      And User can see the login link displayed