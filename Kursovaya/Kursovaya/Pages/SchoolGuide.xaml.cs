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

namespace Kursovaya.Pages
{
    /// <summary>
    /// Логика взаимодействия для SchoolGuide.xaml
    /// </summary>
    public partial class SchoolGuide : Window
    {
        public SchoolGuide()
        {
            InitializeComponent();
            this.DataContext = учет_Посещаемости2Entities.Преподаватели.FirstOrDefault(p => p.ID_Преподавателя == Terminal.преподаватель.ID_Преподавателя);
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (LviewStudents.SelectedItem !=null)
            {
                EditStudents editStudents = new EditStudents(LviewStudents.SelectedItem as Студенты);
                editStudents.ShowDialog();
                this.DataContext = null;
                this.DataContext = учет_Посещаемости2Entities.Преподаватели.FirstOrDefault(p => p.ID_Преподавателя == Terminal.преподаватель.ID_Преподавателя);
            }
        }
        private void CBoxGroups_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (CBoxGroups.SelectedItem != null)
            {
                LviewStudents.ItemsSource = (CBoxGroups.SelectedItem as Группы).Студенты;
            }
        }
        private void Button_Click_1(object sender, RoutedEventArgs e)
        {
            EditStudents editStudents = new EditStudents();
            editStudents.ShowDialog();
            this.DataContext = null;
            this.DataContext = учет_Посещаемости2Entities.Преподаватели.FirstOrDefault(p => p.ID_Преподавателя == Terminal.преподаватель.ID_Преподавателя);
        }

        Учет_посещаемости2Entities учет_Посещаемости2Entities = new Учет_посещаемости2Entities();
        private void Button_Click_2(object sender, RoutedEventArgs e)
        {
            if (LviewStudents.SelectedItem != null)
            {
                учет_Посещаемости2Entities.Студенты.Remove(LviewStudents.SelectedItem as Студенты);

                учет_Посещаемости2Entities.SaveChanges();
            }
            this.DataContext = null;
            this.DataContext = учет_Посещаемости2Entities.Преподаватели.FirstOrDefault(p => p.ID_Преподавателя == Terminal.преподаватель.ID_Преподавателя);
        }
    }
}
