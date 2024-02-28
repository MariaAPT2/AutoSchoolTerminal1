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
    /// Логика взаимодействия для LessonsChoicePages.xaml
    /// </summary>
    public partial class LessonsChoicePages : Page
    {
        public LessonsChoicePages()
        {
            InitializeComponent();
        }

        private void btnDrivingLessons_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new Pages.DrivingLessonsPage());
        }

        private void btnLessons_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new Pages.LessonsPage ());
        }
    }
}
