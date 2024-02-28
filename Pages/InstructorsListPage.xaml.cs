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
    /// Логика взаимодействия для InstructorsListPage.xaml
    /// </summary>
    public partial class InstructorsListPage : Page
    {
        public InstructorsListPage()
        {
            InitializeComponent();
            lwInstructorsList.ItemsSource = Models.DataBaseEntities.GetContext().Instructors.ToList();
        }
    }
}
