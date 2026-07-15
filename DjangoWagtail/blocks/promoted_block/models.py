from wagtail import blocks


class PromotedBlock(blocks.StructBlock):
    quote = blocks.TextBlock(max_length=100, required=False)
    body = blocks.TextBlock(max_length=500, required=False)

    class Meta:
        icon = "quote"
        template = "promoted_block/promoted_block.html"
