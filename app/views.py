from django.shortcuts import render
from django.views import View
from .models import Products

# Create your views here.
class ProductView(View):
    def get(self, request):
        products = Products.objects.all()
        return render(request, "product.html", context={"products": products})