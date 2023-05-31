# Workshop database design

# User
* A user can have multiple orders

 Information:
* First Name
* Last Name
* Address
* Phone


# Pizza
* A pizza can have multiple toppings
* A pizza can have one size
* A pizza can have one order

Information:
* Name
* Price ( For this pizza )
* Size*
* Order*

# Order
* An order can have only one user
* An order can have multiple pizzas

Information:
* Is Delivered
* Price ( For the delivery itself )
* User*

# Topping
* A topping can have multiple pizzas

* Information:
* Name
* Price ( For this topping )

# Size
* A pizza size can have multiple pizzas

Information:
* Name


