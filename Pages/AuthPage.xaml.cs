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
    /// Логика взаимодействия для AuthPage.xaml
    /// </summary>
    public partial class AuthPage : Page
    {

        public AuthPage()
        {
            InitializeComponent();
        }

        private void btnSignIn_Click(object sender, RoutedEventArgs e)
        {

            StringBuilder errors = new StringBuilder();
            if (string.IsNullOrEmpty(txtLogin.Text))
                errors.AppendLine("Поле \"Логин\" должно быть заполнено!");
            if (string.IsNullOrEmpty(pbPassword.Password))
                errors.AppendLine("Поле \"Пароль\" должно быть заполнено!");

            if(errors.Length > 0)
            {
                MessageBox.Show(errors.ToString(), "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                pbPassword.Password = string.Empty;
            }
            else
            {
                Users _currentUser = DataBaseEntities.GetContext().Users.FirstOrDefault(x => x.Username == txtLogin.Text || x.Password == pbPassword.Password);

                if (_currentUser != null)
                {
                    Manager.AuthUser = _currentUser;

                    switch (_currentUser.RoleID)
                    {
                        case 1: // Admin
                            MessageBox.Show($"Вы вошли в систему как «Администратор»", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Information);
                            Manager.MainFrame.Navigate(new InstructorPage());
                            break;
                        case 2: // Insructor
                            MessageBox.Show($"Вы вошли в систему как «{DataBaseEntities.GetContext().Instructors.FirstOrDefault(x => x.UserID == _currentUser.UserID).FullName}»", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Information);
                            Manager.MainFrame.Navigate(new InstructorPage());
                            break;
                        case 3: // Student
                            MessageBox.Show($"Личный кабинет для студентов в разработке...", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Information);
                            Manager.MainFrame.GoBack();
                            Manager.AuthUser = null;
                            break;
                        default:
                            MessageBox.Show($"Вы вошли в систему под неизвестной ролью!", "Уведомление", MessageBoxButton.OK, MessageBoxImage.Information);
                            break;
                    }
                }
                else
                {
                    MessageBox.Show("Пользователь с такими данными не найден!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
                }
            }
        }
    }
}
