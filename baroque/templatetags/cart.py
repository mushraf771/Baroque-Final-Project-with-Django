from atexit import register
from django import template
register = template.Library()

@register.filter(name='is_in_cart')
def is_in_cart(prod,cart):
    print(prod.id)
    print(cart)
    keys = cart.keys()
    for id in keys:
        # print(id)
        # print(type(id),type(prod.id))
        if int(id) == prod.id :
            return True
            # return cart.get(id)
        else:
            return False
    # print(prod.id,cart)
 

@register.filter(name='cart_quantity')
def cart_quantity(product,cart):
    keys = cart.keys()
    # print('cart keys is :',keys)
    for id in keys:
        if int(id) == product.id:
            cart= cart.get(id)
            # print('cart is',cart)
            return cart
    return 0
@register.filter(name='price_total')
def price_total(product,cart):
    # print('product is',product,'cart is', cart)
    price_total= int(product.product_price) * cart_quantity(product,cart)
    # print(type(product.product_price), type(cart))
    # print(product.product_price)
    return price_total
@register.filter(name='total_cart_price')
def total_cart_price(products,cart):
    sum = 0 ;
    for p in products:
        sum += price_total(p,cart)
    return sum
@register.filter(name='currency')
def currency(number):
    return "PKR" + str(number)
@register.filter(name='multiply')
def multiply(number, num2):
    return number * num2