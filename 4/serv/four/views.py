from .models import *
import random


Groups(num_of_students=5, surname_of_the_elder='Aristotle').save()
print(Groups.objects.get(pk=1))
students = Students.objects.all()
print(f"All students in DB: {students}")

for i in range(10):
    gender = random.choice(("m", "f"))
    Students(
        surname=f"student{i}",
        gender=gender,
        group_code=Groups.objects.get(pk=1)
    ).save()

for stud in students:
    print(stud)

print("All female students:")
for female in students.filter(gender="f"):
    print(female)
