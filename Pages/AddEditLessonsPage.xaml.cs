using AutoSchoolTerminal.Models;
using AutoSchoolTerminal.Utils;
using System;
using System.Collections.Generic;
using System.Globalization;
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
    /// Логика взаимодействия для AddEditLessonsPage.xaml
    /// </summary>
    public partial class AddEditLessonsPage : Page
    {
        Lessons _currentLesson = new Lessons();

        public AddEditLessonsPage(Lessons selectedLesson)
        {
            InitializeComponent();

            if (selectedLesson != null)
                _currentLesson = selectedLesson;
            DataContext = _currentLesson;

            cmCourses.ItemsSource = DataBaseEntities.GetContext().Courses.ToList();
            cmbInsructors.ItemsSource = DataBaseEntities.GetContext().Instructors.ToList();
            cmbDuration.ItemsSource = DataBaseEntities.GetContext().DurationList.ToList();
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            if (dpDate.SelectedDate == null)
                errors.AppendLine("Укажите дату!");
            if (string.IsNullOrWhiteSpace(txtBTime.Text))
            {
                errors.AppendLine("Укажите время!");
            }
            else
            {
                string timeInput = txtBTime.Text.Trim();

                if (!DateTime.TryParseExact(timeInput, "HH:mm", CultureInfo.InvariantCulture, DateTimeStyles.None, out _))
                {
                    errors.AppendLine("Неверный формат времени. Введите время в формате 'чч:мм'.");
                }
                else
                {
                    if (DateTime.ParseExact(timeInput, "HH:mm", CultureInfo.InvariantCulture).TimeOfDay < TimeSpan.FromHours(8) ||
                        DateTime.ParseExact(timeInput, "HH:mm", CultureInfo.InvariantCulture).TimeOfDay >= TimeSpan.FromHours(18))
                    {
                        errors.AppendLine("Время должно быть в диапазоне от 8:00 до 18:00.");
                    }
                }
            }
            if (cmbDuration.SelectedItem == null)
                errors.AppendLine("Укажите продолжительность!");
            if (cmCourses.SelectedItem == null)
                errors.AppendLine("Выберите группу!");
            if (cmbInsructors.SelectedItem == null)
                errors.AppendLine("Выберите инструктора!");

            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString(), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }

            if (_currentLesson.LessonID == 0)
            {
                try
                {
                    DataBaseEntities.GetContext().Lessons.Add(_currentLesson);
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                }
            }

            try
            {
                DataBaseEntities.GetContext().SaveChanges();
                MessageBox.Show("Информация сохранена!", "Информация", MessageBoxButton.OK, MessageBoxImage.Information); 
                Manager.MainFrame.GoBack();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
        }

        private void DatePicker_Loaded(object sender, RoutedEventArgs e)
        {
            DatePicker datePicker = sender as DatePicker;

            if (datePicker != null && (datePicker.SelectedDate == null || datePicker.SelectedDate == DateTime.MinValue))
            {
                datePicker.SelectedDate = DateTime.Today;
            }
        }

    }
}
