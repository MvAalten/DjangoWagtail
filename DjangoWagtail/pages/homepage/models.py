from django.db import models
from wagtail.models import Page
from wagtail.admin.panels import FieldPanel
from wagtail.fields import StreamField
from DjangoWagtail.blocks.promoted_block.models import PromotedBlock


class HomePage(Page):
    body = models.TextField(blank=True, max_length=500)
    quote = models.TextField(blank=True, max_length=100)

    StreamField = StreamField(
        [
            ("promoted", PromotedBlock()),
        ],
        use_json_field=True,
        default=[],
    )

    content_panels = Page.content_panels + [
        FieldPanel("quote"),
        FieldPanel("body"),
        FieldPanel("StreamField"),
    ]
