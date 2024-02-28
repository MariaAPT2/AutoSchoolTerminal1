using AutoSchoolTerminal.Pages;
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

namespace AutoSchoolTerminal
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            Manager.MainFrame = MainFrame;
            Manager.MainFrame.Navigate(new StartPage());
        }

        private void imgInformation_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            if(Manager.MainFrame.Content is StartPage)
            {
                Manager.MainFrame.Navigate(new InfoPage());
            }
            else
            {
                Manager.MainFrame.GoBack();
            }
        }

        private void Image_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            Manager.MainFrame.Navigate(new StartPage());
        }

        private void MainFrame_ContentRendered(object sender, EventArgs e)
        {

            if (Manager.MainFrame.Content is StartPage)
            {
                imgInformation.Source = new BitmapImage(new Uri("pack://application:,,,/AutoSchoolTerminal;component/Resources/question.png"));
                imgInformation.ToolTip = "Информация об автошколе";
            }
            else if (Manager.MainFrame.Content is AuthPage && Manager.AuthUser != null)
            {
                Manager.MainFrame.GoBack();
            }
            else
            {
                imgInformation.Source = new BitmapImage(new Uri("pack://application:,,,/AutoSchoolTerminal;component/Resources/cross.png"));
                imgInformation.ToolTip = "Назад";
            }
        }
    }
}
