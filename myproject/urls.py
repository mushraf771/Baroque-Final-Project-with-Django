from django.contrib import admin
from django.urls import path,include
from django.conf import settings
from django.conf.urls.static import static
from baroque import views 
from baroque import urls

urlpatterns = [
    path('admin/', admin.site.urls,name='admin'),
    path('', include('baroque.urls')),   
]
if settings.DEBUG:
	urlpatterns += static(settings.MEDIA_URL,document_root=settings.MEDIA_ROOT)
 
# python manage.py migrate contenttypes
# python manage.py migrate
# python manage.py makemigrations <YOUR APP>
# python manage.py migrate --fake