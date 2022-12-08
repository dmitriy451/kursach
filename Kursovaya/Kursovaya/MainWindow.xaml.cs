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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Kursovaya
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            DataContext = преподаватель;
        }
        private Преподаватели преподаватель = new Преподаватели();
        private Учет_посещаемости2Entities учет_посещаемости2Entities = new Учет_посещаемости2Entities();
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Преподаватели найденный_преподаватель = учет_посещаемости2Entities.Преподаватели.FirstOrDefault(p => p.Логин == this.преподаватель.Логин && p.Пароль == this.преподаватель.Пароль);

            if (найденный_преподаватель != null)
            {
            Terminal.преподаватель = найденный_преподаватель;
                MessageBox.Show($"Здравствуйте {найденный_преподаватель.Имя} {найденный_преподаватель.Отчество}");
                this.Hide();
                MainTeacherWindow mainTeacherWindow = new MainTeacherWindow();
                mainTeacherWindow.Show();
            }
            else
            {
                MessageBox.Show($"Преподаватель не найден");
            }

        }
    }
}
