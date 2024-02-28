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
    /// Логика взаимодействия для DrivingLessonsPage.xaml
    /// </summary>
    public partial class DrivingLessonsPage : Page
    {
        public DrivingLessonsPage()
        {
            InitializeComponent();
        }

        private void Page_IsVisibleChanged(object sender, DependencyPropertyChangedEventArgs e)
        {
            if (Visibility == Visibility.Visible)
            {
                DataBaseEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(x => x.Reload());
                dgDrivingLessons.ItemsSource = DataBaseEntities.GetContext().DrivingLessons.ToList();
            }

            if(Manager.AuthUser == null)
                grButtons.Visibility = Visibility.Collapsed;
                
            if (Manager.AuthUser != null && Manager.AuthUser.RoleID <= 2)
                grButtons.Visibility = Visibility.Visible;
        }

        private void btnAdd_Click(object sender, RoutedEventArgs e)
        {
            Manager.MainFrame.Navigate(new AddEditDrivingLessonsPage(null));
        }

        private void btnDel_Click(object sender, RoutedEventArgs e)
        {
            var rowForRemoving = dgDrivingLessons.SelectedItems.Cast<DrivingLessons>().ToList();

            if (rowForRemoving.Count == 0)
            {
                MessageBox.Show("Выберите уроки для удаления!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                if (MessageBox.Show($"Вы точно хотите удалить следующие {rowForRemoving.Count()} элементов?", "Информация", MessageBoxButton.YesNo, MessageBoxImage.Information) == MessageBoxResult.Yes)
                {
                    try
                    {
                        DataBaseEntities.GetContext().DrivingLessons.RemoveRange(rowForRemoving);
                        DataBaseEntities.GetContext().SaveChanges();
                        MessageBox.Show("Данные удалены!", "Информация", MessageBoxButton.OK, MessageBoxImage.Information);
                        DataBaseEntities.GetContext().ChangeTracker.Entries().ToList().ForEach(x => x.Reload());
                        dgDrivingLessons.ItemsSource = DataBaseEntities.GetContext().DrivingLessons.ToList();
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                    }
                }
            }
        }

        private void btnEdit_Click(object sender, RoutedEventArgs e)
        {
            var rowForRemoving = dgDrivingLessons.SelectedItems.Cast<DrivingLessons>().ToList();

            if (rowForRemoving.Count == 0)
            {
                MessageBox.Show("Выберите урок для редактирования!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else if (rowForRemoving.Count > 1)
            {
                MessageBox.Show("Вы не можете выбрать более одного урока для редактирования!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                Manager.MainFrame.Navigate(new AddEditDrivingLessonsPage((DrivingLessons)dgDrivingLessons.SelectedItem));
                dgDrivingLessons.SelectedItems.Clear();
            }
        }
    }
}
