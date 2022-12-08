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
    /// Логика взаимодействия для Groups.xaml
    /// </summary>
    public partial class Groups : Window
    {
        public Groups()
        {
            InitializeComponent();
            Учет_посещаемости2Entities учет_Посещаемости2Entities = new Учет_посещаемости2Entities();
            CBoxGroups.ItemsSource = учет_Посещаемости2Entities.Группы.ToList();
        }

        private void CBoxGroups_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            if (CBoxGroups.SelectedItem != null)
            {
                DGridStudents.ItemsSource = (CBoxGroups.SelectedItem as Группы).Студенты;
            }
        }
    }
}
