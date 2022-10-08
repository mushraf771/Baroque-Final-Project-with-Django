from django.db import models
from datetime import datetime
from django.forms import forms
from django.core import validators
from django.core.exceptions import ValidationError
''' Create your models here.'''
"""Model Categories"""
class Categorie(models.Model):
    title=models.CharField(max_length=20)
    image=models.ImageField(upload_to="uploads/category/%y")
    def __str__(self):
         return self.title
"""Model Products Choices """    
SIZES=[('Extra Large','Extra Large'),
       ('Large','Large'),
      ('Medium','Medium'),
      ('Small','Small'),
      ]
Availability =[('In Stock','In Stock'),
               ('Out Of Stock','Out Of Stock'),]
""" Model Product"""
class Product(models.Model):
    product_name=models.CharField(max_length=20,)
    product_img=models.ImageField(upload_to="uploads/products/%y")
    product_price=models.CharField(max_length=50)
    product_description=models.CharField(max_length=200)
    product_size=models.CharField(choices=SIZES , max_length=20)
    availability=models.CharField(choices=Availability, max_length=20)
    category=models.ForeignKey(Categorie, on_delete=models.CASCADE)
    def __str__(self):
        return self.product_name
""" Model Product_images with relation one to many"""
class Product_image(models.Model):
    images=models.ImageField(upload_to="uploads/products/details/%y")
    Product_images=models.ForeignKey(Product, on_delete=models.CASCADE,related_name='allimg')
    # def __str__(self):
    #     return self.Product_images,self.images
    
""" Model Orders choices"""
REGION=[('Pakistan','Pakistan'),
       ('USA','United States'),
      ('Canada','Canada'),
      ('UAE','UAE'),
      ]
""" Model Order"""
class Order(models.Model):
    fname = models.CharField(max_length=50)
    lname = models.CharField(max_length=50)
    email = models.CharField(max_length=50)
    phone = models.CharField(max_length=50)
    product = models.ForeignKey(Product, on_delete=models.CASCADE,default=None)
    quantity=models.IntegerField(default=1)
    product_price= models.CharField(max_length=20,default=0)
    region=models.CharField(choices=REGION, max_length=10)
    city=models.CharField(max_length=50)
    address = models.CharField(max_length=200)
    date = models.DateTimeField(default=datetime.now())
    # def __str__(self):
    #     return self.fname
    # def clean(self, *args, **kwargs):
    #     if self.fname == '':
    #         raise ValidationError('Enter your name')
    #     super(Order, self).clean(*args, **kwargs)
    
""" Model Placed orders"""
class PlacedOreders(models.Model):
    product_name= models.ForeignKey(Product, on_delete =models.CASCADE)
    
    
    
