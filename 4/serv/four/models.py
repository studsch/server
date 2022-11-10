from django.db import models


class Groups(models.Model):
    num_of_students = models.IntegerField(default=1)
    surname_of_the_elder = models.CharField(max_length=200)

    def __str__(self):
        return f"Number of students: {self.num_of_students}, " \
               f"surname of the elder: {self.surname_of_the_elder}"


class Students(models.Model):
    surname = models.CharField(max_length=200)
    gender = models.CharField(max_length=1)
    group_code = models.ForeignKey(
        Groups,
        on_delete=models.CASCADE,
    )

    def __str__(self):
        return f"Group code: {self.group_code}, " \
               f"surname: {self.surname}, " \
               f"gender: {self.gender}"


class Discipline(models.Model):
    discipline_name = models.CharField(max_length=200)

    def __str__(self):
        return f"Discipline name: {self.discipline_name}"


class Exams(models.Model):
    grade = models.IntegerField(default=2)
    discipline_code = models.ForeignKey(
        Discipline,
        on_delete=models.CASCADE,
    )
    group_code = models.ForeignKey(
        Groups,
        on_delete=models.CASCADE,
    )
    student_id = models.ForeignKey(
        Students,
        on_delete=models.CASCADE,
    )

    def __str__(self):
        return f"Discipline code: {self.discipline_code}, " \
               f"group code: {self.group_code}, " \
               f"student id: {self.student_id}, " \
               f"grade: {self.grade}"
