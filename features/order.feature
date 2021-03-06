Feature: Order
    In order to generate trades from orders placed
    Orders must match in the order book
        
    Scenario Outline: Cross Market Order with Limit Order
        Given there is a market order "<market order>"
        Given there is a limit order "<limit order>"
        And the market order is crossed with the limit order   
        Then I should see "2" new trade "<trade>"
        And the order status must be updated correctly
    Examples:
        |market order                                          |limit order                                                   |trade                                     |
        |price_type=Market;security_id=1;quantity=100;side=B   |price_type=Limit;security_id=1;quantity=100;price=30;side=S   |security_id=1;quantity=100;price=30      |
        |price_type=Market;security_id=1;quantity=20;side=B    |price_type=Limit;security_id=1;quantity=100;price=30;side=S   |security_id=1;quantity=20;price=30       |
        |price_type=Market;security_id=1;quantity=100;side=S   |price_type=Limit;security_id=1;quantity=20;price=30;side=B    |security_id=1;quantity=20;price=30        |


    Scenario Outline: Cross Limit Order with Market Order
        Given there is a market order "<market order>"
        Given there is a limit order "<limit order>"
        And the limit order is crossed with the market order   
        Then I should see "2" new trade "<trade>"
        And the order status must be updated correctly
    Examples:
        |market order                                               |limit order                                                     |trade                                     |
        |price_type=Market;security_id=1;quantity=100;side=B        |price_type=Limit;security_id=1;quantity=100;price=30;side=S     |security_id=1;quantity=100;price=30       |
        |price_type=Market;security_id=1;quantity=20;side=B         |price_type=Limit;security_id=1;quantity=100;price=30;side=S     |security_id=1;quantity=20;price=30       |
        |price_type=Market;security_id=1;quantity=100;side=S        |price_type=Limit;security_id=1;quantity=20;price=30;side=B      |security_id=1;quantity=20;price=30       |        
        


    Scenario Outline: Cross One Order with Another Order
        Given there are two orders "<order 1>" "<order 2>"
        And the orders are crossed   
        Then I should see "2" new trade "<trade>"
        And the order status must be updated correctly
    Examples:
        |order 1                                                       |order 2                                                       |trade                                     |
        |price_type=Limit;security_id=1;quantity=100;price=20;side=B   |price_type=Limit;security_id=1;quantity=100;price=20;side=S   |security_id=1;quantity=100;price=20      |
        |price_type=Limit;security_id=1;quantity=20;price=30;side=B    |price_type=Limit;security_id=1;quantity=100;price=20;side=S   |security_id=1;quantity=20;price=20       |
        |price_type=Limit;security_id=1;quantity=100;price=20;side=S   |price_type=Limit;security_id=1;quantity=20;price=30;side=B    |security_id=1;quantity=20;price=30        |
        |price_type=Limit;security_id=1;quantity=100;price=50;side=S   |price_type=Market;security_id=1;quantity=20;side=B            |security_id=1;quantity=20;price=50       |        
        |price_type=Market;security_id=1;quantity=100;side=S           |price_type=Limit;security_id=1;quantity=20;price=50;side=B    |security_id=1;quantity=20;price=50       |        

