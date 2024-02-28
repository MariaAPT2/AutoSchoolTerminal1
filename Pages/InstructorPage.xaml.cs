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
    /// Логика взаимодействия для InstructorPage.xaml
    /// </summary>
    public partial class InstructorPage : Page
    {
        public InstructorPage()
        {
            InitializeComponent();
        }

        private void btnDrivingLessons_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new DrivingLessonsPage());
        }

        private void btnLessons_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new LessonsPage());
        }

        private void btnLogOut_Click(object sender, RoutedEventArgs e)
        {
            Manager.AuthUser = null;
            Manager.MainFrame.Navigate(new StartPage());
        }
    }
}
