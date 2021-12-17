Feature: Open multiplus tabs in Brave browser

  Scenario Outline: Keep open tabs to interact with brave browser

    Given I am on the home page
    When I open <numberoftabs> tabs in a interval of <interval>
    # Then I should see a flash message saying <message>

    Examples:
      | numberoftabs | interval             | message                        |
      | 5            | 1                    | You logged into a secure area! |
    #   | foobar       | barfoo               | Your username is invalid!      |