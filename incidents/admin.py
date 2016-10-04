from django.contrib import admin

from .models import Incident, SocialMediaIncident, CloseEndQs, CloseEndQsChoice

from django.contrib.auth.models import Group


#class IncidentAdmin(admin.ModelAdmin):
#    readonly_fields = ['name', 'latitude', 'longitude', 'disaster_type',
#                       'contact_no', 'address', 'synced_date', 'reported_date',
#                       'description']

    #def has_add_permission(self, request):
    #    return False

    #def has_delete_permission(self, request, obj=None):
    #    return False

    #def has_save_permission(self, request, obj=None):
    #    return False

class ChoiceInline(admin.StackedInline):
    model = CloseEndQsChoice
    #extra = 3


class CloseEndQsAdmin(admin.ModelAdmin):
    fieldsets = [
        (None, {'fields': ['question']}),
    ]
    inlines = [ChoiceInline]

#admin.site.register(Incident, IncidentAdmin)
admin.site.register(Incident)
admin.site.register(SocialMediaIncident)
admin.site.unregister(Group)
admin.site.register(CloseEndQs, CloseEndQsAdmin)

