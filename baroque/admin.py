from django.contrib import admin
from baroque.models import Product
from baroque.models import Categorie
from baroque.models import Product_image
from baroque.models import Order
'''Register your models here.'''
admin.site.register(Product_image)
@admin.register(Order)
class Order(admin.ModelAdmin):
    list_display = ('fname','lname','email','phone','address','region','city','date','product','quantity','product_price')
@admin.register(Categorie)
class Categorie(admin.ModelAdmin):
    list_display = ('title','image',)
@admin.register(Product)
class Product(admin.ModelAdmin):
    list_display = ('product_name','product_price','category','product_img')
