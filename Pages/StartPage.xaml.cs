using AutoSchoolTerminal.Models;
using AutoSchoolTerminal.Utils;
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

namespace AutoSchoolTerminal.Pages
{
    /// <summary>
    /// Логика взаимодействия для StartPage.xaml
    /// </summary>
    public partial class StartPage : Page
    {
        public StartPage()
        {
            InitializeComponent();
        }

        private void btnLK_Click(object sender, RoutedEventArgs e)
        {
            if(Manager.AuthUser != null)
            {
                Manager.MainFrame.Navigate(new InstructorPage());
            }
            else
            {
                Manager.MainFrame.Navigate(new AuthPage());
            }
        }

        private void btnInstructors_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new InstructorsListPage());
        }

        private void btnSchedule_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new LessonsChoicePages());
        }

        private void btnPayment_Click(object sender, RoutedEventArgs e)
        {
            MessageBox.Show("Терминал не подключен!", "Ошибка терминала", MessageBoxButton.OK, MessageBoxImage.Error);
        }
    }
}
