using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace Kursovaya
{
    /// <summary>
    /// Логика взаимодействия для MainTeacherWindow.xaml
    /// </summary>
    public partial class MainTeacherWindow : Window
    {
        int currentLessonNum;
        Расписание nextLesson;
        public MainTeacherWindow()
        {
            InitializeComponent();
            if (DateTime.Now.TimeOfDay>new TimeSpan(9,0,0)&&DateTime.Now.TimeOfDay< new TimeSpan(10,30,0))
            {
                currentLessonNum = 1;
            }
            else if ((DateTime.Now.TimeOfDay > new TimeSpan(10, 40, 0) && DateTime.Now.TimeOfDay < new TimeSpan(12, 10, 0)))
            {
                currentLessonNum = 2;
            }
            else if ((DateTime.Now.TimeOfDay > new TimeSpan(12, 35, 0) && DateTime.Now.TimeOfDay < new TimeSpan(14, 5, 0)))
            {
                currentLessonNum = 3;
            }
            else if ((DateTime.Now.TimeOfDay > new TimeSpan(0, 10, 0) && DateTime.Now.TimeOfDay < new TimeSpan(24, 40, 0)))
            {
                currentLessonNum = 4;
            }
            else
            {
                currentLessonNum = 0;
            }
            
            DateTime nowDate= DateTime.Now.Date;
            Terminal.текущий_урок = учет_Посещаемости2Entities.Расписание.FirstOrDefault(p => p.Дисциплины.Преподаватели.ID_Преподавателя == Terminal.преподаватель.ID_Преподавателя && p.Дата == nowDate && p.Порядковый_номер_пары == currentLessonNum);
            nextLesson = учет_Посещаемости2Entities.Расписание.FirstOrDefault(p => p.Дисциплины.Преподаватели.ID_Преподавателя == Terminal.преподаватель.ID_Преподавателя && p.Дата == nowDate && p.Порядковый_номер_пары == currentLessonNum+1);
            this.DataContext = Terminal.текущий_урок;
            nextLessonPanel.DataContext = nextLesson;
            LView_Students.ItemsSource = Terminal.текущий_урок.Группы.Студенты; 
        }
        Учет_посещаемости2Entities учет_Посещаемости2Entities = new Учет_посещаемости2Entities();
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Pages.TimeTable timeTable = new Pages.TimeTable();
            timeTable.ShowDialog();
        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            if (Terminal.текущий_урок != null)
            {
            InputBox.InputBox inputBox = new InputBox.InputBox("Запишите домашнее задание");
            }
        }

        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            if (LView_Students.SelectedItem != null)
            {
            InputBox.InputBox inputBox = new InputBox.InputBox("Оценка");
                string mark = inputBox.getString();
                учет_Посещаемости2Entities.Успеваемость.Add(new Успеваемость() {оценка = mark, ID_преподавателя = Terminal.преподаватель.ID_Преподавателя, ID_предмета = Terminal.текущий_урок.ID, ID_студента = (LView_Students.SelectedItem as Студенты).ID_Студента });
                учет_Посещаемости2Entities.SaveChanges();
            }
            else
            {
                MessageBox.Show("Сперва укажите студента.");
            }

        }

        private void Button_Click_3(object sender, RoutedEventArgs e)
        {
            учет_Посещаемости2Entities.Успеваемость.Add(new Успеваемость() { оценка = "П", ID_преподавателя = Terminal.преподаватель.ID_Преподавателя, ID_предмета = Terminal.текущий_урок.ID, ID_студента = (LView_Students.SelectedItem as Студенты).ID_Студента });
            учет_Посещаемости2Entities.SaveChanges();
        }

        private void Button_Click_4(object sender, RoutedEventArgs e)
        {
            учет_Посещаемости2Entities.Успеваемость.Add(new Успеваемость() { оценка = "Б", ID_преподавателя = Terminal.преподаватель.ID_Преподавателя, ID_предмета = Terminal.текущий_урок.ID, ID_студента = (LView_Students.SelectedItem as Студенты).ID_Студента });
            учет_Посещаемости2Entities.SaveChanges();
        }

        private void Button_Click_5(object sender, RoutedEventArgs e)
        {
            Pages.SchoolGuide schoolGuide = new Pages.SchoolGuide();
            schoolGuide.ShowDialog();
        }

        private void Button_Click_6(object sender, RoutedEventArgs e)
        {
            Pages.TeachersSubjects teachersSubjects = new Pages.TeachersSubjects();
            teachersSubjects.ShowDialog();
        }

        private void Button_Click_7(object sender, RoutedEventArgs e)
        {
            Pages.TimeTable timeTable = new Pages.TimeTable();
            timeTable.ShowDialog();
        }

        private void Button_Click_8(object sender, RoutedEventArgs e)
        {
            Pages.Groups groups = new Pages.Groups();
            groups.ShowDialog();
        }
    }
}
