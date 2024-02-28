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
    /// Логика взаимодействия для AddEditDrivingLessonsPage.xaml
    /// </summary>
    public partial class AddEditDrivingLessonsPage : Page
    {
        DrivingLessons _currentDrivingLesson = new DrivingLessons();

        public AddEditDrivingLessonsPage(DrivingLessons selectedDrivingLesson)
        {
            InitializeComponent();

            if (selectedDrivingLesson != null)
                _currentDrivingLesson = selectedDrivingLesson;
            DataContext = _currentDrivingLesson;

            cmbInsructors.ItemsSource = DataBaseEntities.GetContext().Instructors.ToList();
            cmbStudents.ItemsSource = DataBaseEntities.GetContext().Students.ToList();
            cmbDuration.ItemsSource = DataBaseEntities.GetContext().DurationList.ToList();
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            StringBuilder errors = new StringBuilder();
            if (cmbStudents.SelectedItem == null)
                errors.AppendLine("Выберите курсанта!");
            if (cmbInsructors.SelectedItem == null)
                errors.AppendLine("Выберите инструктора!");
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

            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString(), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                return;
            }

            if (_currentDrivingLesson.DrivingLessonID == 0)
            {
                try
                {
                    DataBaseEntities.GetContext().DrivingLessons.Add(_currentDrivingLesson);
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

        private void cmbDuration_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            switch (cmbDuration.SelectedIndex)
            {
                case 0:
                    txtPrice.Text = "300.00 руб";
                    _currentDrivingLesson.LessonCost = 300.00m;
                    break;
                case 1:
                    txtPrice.Text = "400.00 руб";
                    _currentDrivingLesson.LessonCost = 400.00m;
                    break;
                case 2:
                    txtPrice.Text = "500.00 руб";
                    _currentDrivingLesson.LessonCost = 500.00m;
                    break;
                case 3:
                    txtPrice.Text = "600.00 руб";
                    _currentDrivingLesson.LessonCost = 600.00m;
                    break;
                default:
                    break;
            }
        }
    }
}
