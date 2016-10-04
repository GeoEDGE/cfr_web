from django.forms.widgets import Select


class NullBooleanSelect(Select):
    """
    A Select Widget intended to be used with NullBooleanField.
    """
    def __init__(self, choices=None, attrs=None):
        if not choices:
            choices = (('1', empty_label or ugettext_lazy('Unknown')),
                       ('2', ugettext_lazy('Yes')),
                       ('3', ugettext_lazy('No')))
        super(NullBooleanSelect, self).__init__(attrs, choices)