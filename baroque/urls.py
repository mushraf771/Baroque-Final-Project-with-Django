from django.urls import path ,include
from baroque import views
# from .views import Barque
# from django.conf.urls import patterns, include, url
urlpatterns = [
   #'''Home page'''
   #  url(r'^$', some_view, {'template' : 'index.html'}, name='index'),
   # path('home', views.Baroque,name='home'),
   path('', views.Barque.as_view(),name='home'),
   # '''Baroque Page 3 Product details'''
   # path('details/<int:pk>,<int:category_id>', views.DetailsView,name='product_details'),
   # path('details/<int:id>,<int:category_id>', views.DetailsView,name='product_details'),
   path('details/<int:pk>,<int:category_id>', views.DetailsView.as_view(),name='product_details'),
   #''' Baroque Page 2 Products'''
   path('product/<int:id>', views.product,name='show_product'),
   # path('shop/<int:id>', views.product,name='show_product'),
   # '''Orders page'''
   # path('order/', views.Orders,name='order'),
   path('order/', views.Orders.as_view(),name='order'),
   # '''Cart page''' 
   # path('cart/' ,views.CartGet,name='cart'),
   # path('cart/' ,views.CartPost,name='cart'),
   path('cart/' ,views.Cart.as_view(),name='cart'),
   #''' nav links urls'''
   
   path('myorder/' ,views.MyOrder.as_view(),name='myorder'),
   path('sale/' ,views.Sale.as_view(),name='sale'),
   path('stiched/' ,views.Stiched.as_view(),name='stiched'),
   path('unstiched/' ,views.Unstiched.as_view(),name='unstiched'),
   path('collection/' ,views.Collection.as_view(),name='collection'),
   path('duppata/' ,views.Duppata.as_view(),name='duppata'),
   path('shawls/' ,views.Shawls.as_view(),name='shawls'),
   path('bottoms/' ,views.Bottoms.as_view(),name='bottoms'),
   path('pret/' ,views.Pret.as_view(),name='pret'),
   path('rtw/' ,views.ReadyToWear.as_view(),name='rtw'),
# '''base template'''
   path('base/', views.base,name='base'),
    path('modify/<int:pk>,<int:category_id>', views.Modify.as_view(),name='modify'),
   
]