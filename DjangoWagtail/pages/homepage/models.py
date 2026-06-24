from django.db import models
from wagtail.models import Page
from wagtail.admin.panels import FieldPanel


# Create your models here:
class HomePage(Page):
    body = models.TextField(blank=True, max_length=500)

    content_panels = Page.content_panels + [
        FieldPanel("body"),
    ]
