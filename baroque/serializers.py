from rest_framework import serializers

from .models import Categorie
from .models import Product
from .models import Order

class CategorieSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Categorie
        # fields = '__all__'
        fields = ('id','title','image')
class ProductSerializer(serializers.HyperlinkedModelSerializer):
    allimg= serializers.StringRelatedField(many=True)
    class Meta:
        model = Product
        fields = ('id','product_name','product_img','product_price','product_description','product_size','availability','category_id','allimg')
class OrderSerializer(serializers.HyperlinkedModelSerializer):
    class Meta:
        model = Order
        fields = ('id','fname','lname','email','phone',
                    'product','quantity','product_price','region','city','address','date')