Feature: Calendar pages
  Scenario: Calendar pages are accessible from preview server
    Given the Server is running at "calendar-multiblog-app"
    When I go to "/blog1/2011/01/01.html"
    Then I should see "/blog1/2011-01-01-new-article.html"
    Then I should not see "/blog1/2011-01-02-another-article.html"
    Then I should not see "/blog2/2011-01-01-new-article.html"
    Then I should see "Year1: '2011'"
    Then I should see "Month1: '1'"
    Then I should see "Day1: '1'"
    When I go to "/blog2/2011/01/01.html"
    Then I should see "/blog2/2011-01-01-new-article.html"
    Then I should not see "/blog2/2011-01-02-another-article.html"
    Then I should not see "/blog1/2011-01-01-new-article.html"
    Then I should see "Year2: '2011'"
    Then I should see "Month2: '1'"
    Then I should see "Day2: '1'"

    When I go to "/blog1/2011/01/02.html"
    Then I should not see "/blog1/2011-01-01-new-article.html"
    Then I should see "/blog1/2011-01-02-another-article.html"
    Then I should not see "/blog2/2011-01-02-another-article.html"
    Then I should see "Year1: '2011'"
    Then I should see "Month1: '1'"
    Then I should see "Day1: '2'"
    When I go to "/blog2/2011/01/02.html"
    Then I should not see "/blog2/2011-01-01-new-article.html"
    Then I should see "/blog2/2011-01-02-another-article.html"
    Then I should not see "/blog1/2011-01-02-another-article.html"
    Then I should see "Year2: '2011'"
    Then I should see "Month2: '1'"
    Then I should see "Day2: '2'"

    When I go to "/blog1/2011/01.html"
    Then I should see "/blog1/2011-01-01-new-article.html"
    Then I should see "/blog1/2011-01-02-another-article.html"
    Then I should not see "/blog2/2011-01-01-new-article.html"
    Then I should not see "/blog2/2011-01-02-another-article.html"
    Then I should see "Year1: '2011'"
    Then I should see "Month1: '1'"
    Then I should see "Day1: ''"
    When I go to "/blog2/2011/01.html"
    Then I should see "/blog2/2011-01-01-new-article.html"
    Then I should see "/blog2/2011-01-02-another-article.html"
    Then I should not see "/blog1/2011-01-01-new-article.html"
    Then I should not see "/blog1/2011-01-02-another-article.html"
    Then I should see "Year2: '2011'"
    Then I should see "Month2: '1'"
    Then I should see "Day2: ''"

    When I go to "/blog1/2011.html"
    Then I should see "/blog1/2011-01-01-new-article.html"
    Then I should see "/blog1/2011-01-02-another-article.html"
    Then I should not see "/blog2/2011-01-01-new-article.html"
    Then I should not see "/blog2/2011-01-02-another-article.html"
    Then I should see "Year1: '2011'"
    Then I should see "Month1: ''"
    Then I should see "Day1: ''"
    When I go to "/blog2/2011.html"
    Then I should see "/blog2/2011-01-01-new-article.html"
    Then I should see "/blog2/2011-01-02-another-article.html"
    Then I should not see "/blog1/2011-01-01-new-article.html"
    Then I should not see "/blog1/2011-01-02-another-article.html"
    Then I should see "Year2: '2011'"
    Then I should see "Month2: ''"
    Then I should see "Day2: ''"

    When I go to "/index.html"
    Then I should see "Year Path1: '/blog1/2011.html'"
    Then I should see "Month Path1: '/blog1/2011/01.html'"
    Then I should see "Day Path1: '/blog1/2011/01/01.html'"
    Then I should see "Year Path2: '/blog2/2011.html'"
    Then I should see "Month Path2: '/blog2/2011/01.html'"
    Then I should see "Day Path2: '/blog2/2011/01/01.html'"

  Scenario: Calendar pages also get built
    Given a successfully built app at "calendar-multiblog-app"
    When I cd to "build"
    Then the following files should exist:
    | blog1/2011.html       |
    | blog1/2011/01.html    |
    | blog1/2011/01/01.html |
    | blog1/2011/01/02.html |
    | blog2/2011.html       |
    | blog2/2011/01.html    |
    | blog2/2011/01/01.html |
    | blog2/2011/01/02.html |

    And the file "blog1/2011.html" should contain "/blog1/2011-01-01-new-article.html"
    And the file "blog1/2011.html" should contain "/blog1/2011-01-02-another-article.html"
    And the file "blog1/2011.html" should not contain "/blog2/2011-01-01-new-article.html"
    And the file "blog1/2011.html" should not contain "/blog2/2011-01-02-another-article.html"
    And the file "blog1/2011.html" should contain "Year1: '2011'"
    And the file "blog1/2011.html" should contain "Month1: ''"
    And the file "blog1/2011.html" should contain "Day1: ''"
    And the file "blog2/2011.html" should contain "/blog2/2011-01-01-new-article.html"
    And the file "blog2/2011.html" should contain "/blog2/2011-01-02-another-article.html"
    And the file "blog2/2011.html" should not contain "/blog1/2011-01-01-new-article.html"
    And the file "blog2/2011.html" should not contain "/blog1/2011-01-02-another-article.html"
    And the file "blog2/2011.html" should contain "Year2: '2011'"
    And the file "blog2/2011.html" should contain "Month2: ''"
    And the file "blog2/2011.html" should contain "Day2: ''"

    And the file "blog1/2011/01.html" should contain "/blog1/2011-01-01-new-article.html"
    And the file "blog1/2011/01.html" should contain "/blog1/2011-01-02-another-article.html"
    And the file "blog1/2011/01.html" should not contain "/blog2/2011-01-01-new-article.html"
    And the file "blog1/2011/01.html" should not contain "/blog2/2011-01-02-another-article.html"
    And the file "blog1/2011/01.html" should contain "Year1: '2011'"
    And the file "blog1/2011/01.html" should contain "Month1: '1'"
    And the file "blog1/2011/01.html" should contain "Day1: ''"
    And the file "blog2/2011/01.html" should contain "/blog2/2011-01-01-new-article.html"
    And the file "blog2/2011/01.html" should contain "/blog2/2011-01-02-another-article.html"
    And the file "blog2/2011/01.html" should not contain "/blog1/2011-01-01-new-article.html"
    And the file "blog2/2011/01.html" should not contain "/blog1/2011-01-02-another-article.html"
    And the file "blog2/2011/01.html" should contain "Year2: '2011'"
    And the file "blog2/2011/01.html" should contain "Month2: '1'"
    And the file "blog2/2011/01.html" should contain "Day2: ''"

    And the file "blog1/2011/01/01.html" should contain "/blog1/2011-01-01-new-article.html"
    And the file "blog1/2011/01/01.html" should not contain "/blog1/2011-01-02-another-article.html"
    And the file "blog1/2011/01/01.html" should not contain "/blog2/2011-01-01-new-article.html"
    And the file "blog1/2011/01/01.html" should contain "Year1: '2011'"
    And the file "blog1/2011/01/01.html" should contain "Month1: '1'"
    And the file "blog1/2011/01/01.html" should contain "Day1: '1'"
    And the file "blog2/2011/01/01.html" should contain "/blog2/2011-01-01-new-article.html"
    And the file "blog2/2011/01/01.html" should not contain "/blog2/2011-01-02-another-article.html"
    And the file "blog2/2011/01/01.html" should not contain "/blog1/2011-01-01-new-article.html"
    And the file "blog2/2011/01/01.html" should contain "Year2: '2011'"
    And the file "blog2/2011/01/01.html" should contain "Month2: '1'"
    And the file "blog2/2011/01/01.html" should contain "Day2: '1'"

    And the file "blog1/2011/01/02.html" should not contain "/blog1/2011-01-01-new-article.html"
    And the file "blog1/2011/01/02.html" should contain "/blog1/2011-01-02-another-article.html"
    And the file "blog1/2011/01/02.html" should not contain "/blog2/2011-01-01-new-article.html"
    And the file "blog1/2011/01/02.html" should contain "Year1: '2011'"
    And the file "blog1/2011/01/02.html" should contain "Month1: '1'"
    And the file "blog1/2011/01/02.html" should contain "Day1: '2'"
    And the file "blog2/2011/01/02.html" should not contain "/blog2/2011-01-01-new-article.html"
    And the file "blog2/2011/01/02.html" should contain "/blog2/2011-01-02-another-article.html"
    And the file "blog2/2011/01/02.html" should not contain "/blog1/2011-01-01-new-article.html"
    And the file "blog2/2011/01/02.html" should contain "Year2: '2011'"
    And the file "blog2/2011/01/02.html" should contain "Month2: '1'"
    And the file "blog2/2011/01/02.html" should contain "Day2: '2'"

    And the file "index.html" should contain "Year Path1: '/blog1/2011.html'"
    And the file "index.html" should contain "Month Path1: '/blog1/2011/01.html'"
    And the file "index.html" should contain "Day Path1: '/blog1/2011/01/01.html'"
    And the file "index.html" should contain "Year Path2: '/blog2/2011.html'"
    And the file "index.html" should contain "Month Path2: '/blog2/2011/01.html'"
    And the file "index.html" should contain "Day Path2: '/blog2/2011/01/01.html'"

