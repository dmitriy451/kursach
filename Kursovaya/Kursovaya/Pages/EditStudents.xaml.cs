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
    /// Логика взаимодействия для EditStudents.xaml
    /// </summary>
    public partial class EditStudents : Window
    {
        public EditStudents(Студенты студенты = null)
        {
            InitializeComponent();
            _студент = студенты;
            if (_студент==null)
            {
                add = true;
                _студент = new Студенты();
            }
            this.DataContext = _студент;
            CBoxGroups.ItemsSource = учет_Посещаемости2Entities.Группы.ToList();
        }
        bool add = false;
        Студенты _студент;
            Учет_посещаемости2Entities учет_Посещаемости2Entities = new Учет_посещаемости2Entities();
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (add)
            {
                учет_Посещаемости2Entities.Студенты.Add(_студент);
            }
            учет_Посещаемости2Entities.SaveChanges();
            DialogResult = true;
        }
    }
}
