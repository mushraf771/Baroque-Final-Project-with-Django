from django.shortcuts import render
from ast import Pass
from django.http import HttpResponse 
from django.shortcuts import render,redirect
from django.contrib import messages
'''Models'''
from .models import Categorie
from .models import Product
from .models import Product_image
from .models import Order
''' forms'''
from .forms import categoryForm
from .forms import OrderForm
''' Create your views here
API views
'''
from django.views import View
from rest_framework import viewsets
from rest_framework.decorators import api_view
from rest_framework.response import Response
from .serializers import CategorieSerializer
from .serializers import ProductSerializer
from .serializers import OrderSerializer
# from .serializers import CartSerializer
'''
this app working for both  Api or function based
'''
''' Homepage '''
# @api_view(['GET'])
# def Baroque(request):
#    categorie=Categorie.objects.all()
#    serializer=CategorieSerializer(categorie,many=True) 
#    return Response(serializer.data)

# Baroque 2nd page products list of selected Categorie
# @api_view(['GET'])
# def product(request,id):
#    # cat=Product.objects.filter(id=id)
#    products=Product.objects.filter(category_id=id)
#    serializer=ProductSerializer(products,many=True)
#    return Response(serializer.data)

# Baroque 3 page selected product details
# @api_view(['GET'])
# def DetailsView(request,pk,category_id):
#    cart = request.session.get('cart')
#    if not cart:
#          request.session['cart'] = {}
#    prod = Product.objects.get(pk=pk)
#    may=Product.objects.filter(category_id=category_id).all().exclude(pk=pk)
#    allimg = Product_image.objects.filter(Product_images_id=pk) 
#    products=Product.objects.filter(category_id=pk)
   
#    serializer=ProductSerializer(prod)
#    return Response(serializer.data)
# def DetailsView(request,id,category_id):
#    cart = request.session.get('cart')
#    if not cart:
#          request.session['cart'] = {}
#    prod = Product.objects.get(pk=id)
#    may=Product.objects.filter(category_id=category_id).all().exclude(pk=id)
#    allimg = Product_image.objects.filter(Product_images_id=id) 
#    products=Product.objects.filter(category_id=id)
   
#    serializer=ProductSerializer(prod)
#    return Response(serializer.data)
# Baroque Manage Cart Page 
# @api_view(['GET'])
# def CartGet(request):
#       if request.method == 'GET':
#          cart= request.session.get('cart')
#          if cart:
#             ids= list(request.session.get('cart').keys())
#             products = Product.objects.filter(id__in=ids)
#             serializer=ProductSerializer(products,many=True)
#             return Response(serializer.data)
#          else:
#             return Response('Cart Empty')
#       else:
#          product= request.POST.get('product')
#          remove= request.POST.get('remove')
#          cart = request.session.get('cart')
#          delete= request.POST.get('delete')
#          if cart:
#             quantity = cart.get(product)
#             if quantity:
#                if remove:
#                   if quantity<=1:
#                      cart.pop(product)

#                   else:
#                      cart[product] = quantity - 1
#                else:
#                   cart[product] = quantity + 1
#             else:
#                cart[product]  = 1
#          else:
#             cart = {}
#             cart[product] = 1
#          request.session['cart']=cart
#          quantity = cart.get(product)
#          serializer = ProductSerializer(instance=quantity,data=request.data)
#          if serializer.is_valid():
#             serializer.save()
#          print('your data saved successfully',quantity)
#          # serializer=ProductSerializer(request.session.get('cart'))
#          return Response(serializer.data)
#       return Response(serializer.data)
# # @api_view(['GET','POST'])
# def Orders(request):
#    if request.method == 'POST': 
#       fm= OrderForm(request.POST)
#       orderform=OrderForm(label_suffix='')
#       cart= request.session.get('cart')
#       # products = Product.objects.filter(id__in=list(cart.keys())) 
#       if fm.is_valid():
#          fname= fm.cleaned_data['fname']
#          lname= fm.cleaned_data['lname']
#          email= fm.cleaned_data['email']
#          phone= fm.cleaned_data['phone']
#          address= fm.cleaned_data['address']
#          region= fm.cleaned_data['region']
#          city= fm.cleaned_data['city']
#          for product in products:
#             order =Order(fname=fname,lname=lname,email=email,
#             phone=phone,address=address,city=city,region=region,product=Product(product.id),product_price=product.product_price,
#             quantity=cart.get(str(product.id)))
#             serializer = OrderSerializer(instance=order,data=request.data)
#             # if serializer.is_valid():
#             #    serializer.save()
#             #    order.save()
#             messages.add_message(request, messages.SUCCESS, 'Your order has been received successfully')
#             request.session['cart'] ={}
#          # return redirect('/')
#             return Response(serializer.data)
#       else:
#          messages.add_message(request, messages.ERROR, 'Please Input correct details')
#          return Response('Good Appreciated')
#       # return render(request,'order.html',{'forms':orderform})
#    else:
#       orderform=OrderForm(label_suffix='')
#       cart= request.session.get('cart')
#       if cart:
#          products = Product.objects.filter(id__in=list(cart.keys()))
#          print (products)
#       else:
#          return Response('no items in cart')
#       print(cart)
#       serializer=OrderSerializer(products)
#       return Response(serializer.data)
#       # return render(request,'order.html',{'forms':orderform,'carts':products,'quan':cart})

''' Cart View'''
# class Cart(View):
#    def post(self,request):
#       product= request.POST.get('product')
#       remove= request.POST.get('remove')
#       cart = request.session.get('cart')
#       delete= request.POST.get('delete')
#       if cart:
#          quantity = cart.get(product)
#          if quantity:
            
#             if remove:
#                if quantity<=1:
#                   cart.pop(product)
#                else:
#                   cart[product] = quantity - 1
#             else:
#                 cart[product] = quantity + 1
#          else:
#             cart[product]  = 1
#       else:
#          cart = {}
#          cart[product] = 1
#       request.session['cart']=cart
#       return redirect('/cart')
#    def get(self, request):
#       cart= request.session.get('cart')
#       if cart:
#          ids= list(request.session.get('cart').keys())
#          products = Product.objects.filter(id__in=ids)
#          return render(request,'cart.html',{'products':products})
#       return render(request,'cart.html',) 
# class DetailsView(View):
#    def get(self,request,pk,category_id):
#       cart = request.session.get('cart')
#       if not cart:
#          request.session['cart'] = {}
#       prod = Product.objects.get(pk=pk)
      
#       # -> should return a list sorted by similarity
#       may=Product.objects.filter(category_id=category_id).all().exclude(pk=pk)
#       all = Product_image.objects.filter(Product_images_id=pk) 
#       return render(request,'barque3.html',{'prod': prod,'pros':all,'may':may })
  
''' 
Simple Django Based views 
comment if you want to work with Api Views
'''
''' Homepage class based view'''
class Barque(View):
   def get(self, request):
      images=Categorie.objects.all()
      return render(request,'home.html',{"images":images})
''' Baroque 2nd page products list of selected Categorie '''
""" function based view """
def product(request,id): 
   cat=Categorie.objects.filter(id=id)[0]
   products=Product.objects.filter(category_id=id)
   return render(request,'page2.html',{'products':products,'cat':cat}) 

''' Baroque 3 page selected product details '''
""" class based view """
class DetailsView(View):
   def get(self,request,pk,category_id):
      cart = request.session.get('cart')
      if not cart:
         request.session['cart'] = {}
      prod = Product.objects.get(pk=pk)
      # hint --> should return a list sorted by similarity 
      may=Product.objects.filter(category_id=category_id).all().exclude(pk=pk)
      all = Product_image.objects.filter(Product_images_id=pk) 
      cat = Categorie.objects.filter(pk=category_id)[0]
      # print(cat)
      pd = Product.objects.filter(pk=pk)[0]
      # print(pd)
      return render(request,'page3.html',{'prod': prod,'pros':all,'may':may,'cat':cat,'pd':pd })
  
''' Baroque Manage Cart Page '''
""" class based view """
class Cart(View):
   def post(self,request):
      product= request.POST.get('product')
      remove= request.POST.get('remove')
      cart = request.session.get('cart')
      delete= request.POST.get('delete')
      if cart:
         quantity = cart.get(product)
         if quantity:
            if remove:
               if quantity<=1:
                  cart.pop(product)
               else:
                  cart[product] = quantity - 1
            else:
                cart[product] = quantity + 1
         else:
            cart[product]  = 1
      else:
         cart = {}
         cart[product] = 1
      request.session['cart']=cart
      return redirect('/cart')
   def get(self, request):
      cart= request.session.get('cart')
      if cart:
         ids= list(request.session.get('cart').keys())
         products = Product.objects.filter(id__in=ids)
         return render(request,'cart.html',{'products':products})
      return render(request,'cart.html',)    

''' Baroque  Save orders page '''
""" class based view """
class Orders(View):
   def post(self, request):   
      fm= OrderForm(request.POST)
      orderform=OrderForm(label_suffix='')
      cart= request.session.get('cart')
      products = Product.objects.filter(id__in=list(cart.keys())) 
      if fm.is_valid():
         fname= fm.cleaned_data['fname']
         lname= fm.cleaned_data['lname']
         email= fm.cleaned_data['email']
         phone= fm.cleaned_data['phone']
         address= fm.cleaned_data['address']
         region= fm.cleaned_data['region']
         city= fm.cleaned_data['city']
         for product in products:
            order =Order(fname=fname,lname=lname,email=email,
            phone=phone,address=address,city=city,region=region,product=Product(product.id),product_price=product.product_price,
            quantity=cart.get(str(product.id)))
            order.save()
            messages.add_message(request, messages.SUCCESS, 'Your order has been received successfully')
            request.session['cart'] ={}
         return redirect('/')
      else:
         messages.add_message(request, messages.ERROR, 'Please Input correct details')
      return render(request,'order.html',{'forms':orderform})
   def get(self, request):
      orderform=OrderForm(label_suffix='')
      cart= request.session.get('cart')
      products = Product.objects.filter(id__in=list(cart.keys()))
      return render(request,'order.html',{'forms':orderform,'carts':products,'quan':cart})

''' Check Orders '''
"""class based view"""
class MyOrder(View):
   def get(self, request):
      orders= Order.objects.all()
      return render(request,'myorder.html',{'orders':orders})
''' Sale page '''
"""class based view"""
class Sale(View):
   def get(self, request,):
      images=Categorie.objects.all()
      return render(request,'sale.html',{"images":images})

'''Unstiched page'''
"""class based view"""
class Unstiched(View):
   def get(self, request,):
      images=Product.objects.filter(category_id=7).all()
      return render(request,'unstiched.html',{'images':images})

'''Stiched page'''
"""class based view"""
class Stiched(View):
   def get(self, request,):
      images=Product.objects.filter(category_id=8).all()
      return render(request,'stiched.html',{'images':images})

'''Shawls page'''
"""class based view"""
class Shawls(View):
   def get(self, request,):
      images=Product.objects.filter(category_id=4).all()
      return render(request,'shawls.html',{'images':images})

'''Collection page '''
"""class based view"""
class Collection(View):
   def get(self, request):
      images=Categorie.objects.all()
      return render(request,'collection.html',{"images":images})

'''Pret page'''
"""class based view"""
class Pret(View):
   def get(self, request):
      images=Product.objects.filter(category_id=3)
      return render(request,'pret.html',{"images":images})
   
'''Ready to wear page'''
"""class based view"""
class ReadyToWear(View):
   def get(self, request):
      images=Product.objects.filter(category_id=5)
      return render(request,'pret.html',{"images":images})
   
''' Bottoms page'''
"""class based view"""
class Bottoms(View):
   def get(self, request,):
      images=Product.objects.filter(category_id=9).all()
      return render(request,'bottoms.html',{'images':images})

''' Duppata page'''
"""class based view"""
class Duppata(View):
   def get(self, request,):
      images=Product.objects.filter(category_id=10).all()
      return render(request,'duppata.html',{'images':images})
""" function based views"""
''' Base template'''
def base(request):
   return render(request,'base.html')
class Modify(View):
   def get(self,request,pk,category_id):
      cart = request.session.get('cart')
      if not cart:
         request.session['cart'] = {}
      prod = Product.objects.get(pk=pk)
      # -> should return a list sorted by similarity
      may=Product.objects.filter(category_id=category_id).all().exclude(pk=pk)
      all = Product_image.objects.filter(Product_images_id=pk) 
      return render(request,'modify3.html',{'prod': prod,'pros':all,'may':may })