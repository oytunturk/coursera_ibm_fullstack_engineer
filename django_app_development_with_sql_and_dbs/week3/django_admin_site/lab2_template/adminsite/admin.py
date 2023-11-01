from django.contrib import admin
from .models import Course, Instructor, Lesson

# Register your models here.
class LessonInline(admin.StackedInline):
    model = Lesson 
    extra = 5

class CourseAdmin(admin.ModelAdmin):
    fields = ['pub_date', 'name', 'description']
    inlines = [LessonInline]
    
#admin.site.register(Course) #includes all fields
admin.site.register(Course, CourseAdmin) #includes fields you pick in the class above

class InstructorAdmin(admin.ModelAdmin):
    fields = ['user', 'full_time']

#admin.site.register(Instructor) #incluides all fields
admin.site.register(Instructor, InstructorAdmin) #includes fields you pick in the class above
