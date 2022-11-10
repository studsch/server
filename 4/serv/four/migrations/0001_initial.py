# Generated by Django 4.1.3 on 2022-11-10 11:37

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Discipline',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('discipline_name', models.CharField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='Groups',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('num_of_students', models.IntegerField(default=1)),
                ('surname_of_the_elder', models.CharField(max_length=200)),
            ],
        ),
        migrations.CreateModel(
            name='Students',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('surname', models.CharField(max_length=200)),
                ('gender', models.CharField(max_length=1)),
                ('group_code', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='four.groups')),
            ],
        ),
        migrations.CreateModel(
            name='Exams',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('grade', models.IntegerField(default=2)),
                ('discipline_code', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='four.discipline')),
                ('group_code', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='four.groups')),
                ('student_id', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='four.students')),
            ],
        ),
    ]