from .models import Categorie,Product,Order
from django import forms
from django.core import validators
class categoryForm(forms.ModelForm):
    class Meta():
        model=Categorie
        fields='__all__'
class OrderForm(forms.ModelForm):
    # email = forms.CharField(widget=forms.EmailInput, label='')
    class Meta:
        model = Order
        # fields = '__all__'
        fields = ['fname','lname','email','phone','region','city','address']
        # help_text ={'fname':'First Name'}
       
        labels = {'fname':'','lname':'','email':'','phone':'','region':'Region/Country','city':'City','address':'','date':'Order Date'}
        error_messages ={ 'fname':{'required':'plz enter name'}}
        widgets = {
           
            'fname': forms.TextInput(attrs={'class':'form-control ','placeholder': 'First Name','required':'True'}),
            'lname': forms.TextInput(attrs={'class': 'form-control ','placeholder': 'Last Name'}),
            'email': forms.EmailInput(attrs={'class': 'form-control','placeholder': 'Email'}),
            'phone': forms.NumberInput(attrs={'class': 'form-control','placeholder': 'Phone '}),
            'region': forms.Select(attrs={'class': 'form-control','placeholder': 'Select Country'}),
            'city': forms.TextInput(attrs={'class': 'form-control','placeholder': 'City'}),
            'address': forms.TextInput(attrs={'class': 'form-control','placeholder': 'Address'}),
            'product': forms.Select(attrs={'class': 'form-control'},),
            'quantity': forms.NumberInput(attrs={'class': 'form-control'}),
            'date': forms.DateTimeInput(attrs={'class': 'form-control'}),
        }