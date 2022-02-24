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
using System.Windows.Shapes;

using EquipmentRent.DataModel;

namespace EquipmentRent.Windows
{
	public partial class AuthorisationWindow : Window
	{
		public AuthorisationWindow()
		{
			InitializeComponent();
		}

		private void OnLogIn(object sender, RoutedEventArgs args)
		{		
			using (var context = new EquipmentRentEntities())
			{
				// Shouldn't do it like that
				var user = context.Employee.ToList()
					.Where(e => e.Login == LoginBox.Text);

				if (LoginBox.Text == string.Empty)
				{
					MessageBox.Show("Введите логин.");
					return;
				}
				
				else
				if (user.Count() == 0)
				{
					MessageBox.Show("Пользователя с таким логином не существует.");
					return;
				}

				else
				if (PasswordBox.Password == string.Empty)
				{
					MessageBox.Show("Введите пароль.");
					return;
				}

				else
				if (user.FirstOrDefault(
						e => e.Password == PasswordBox.Password) == null)
				{
					MessageBox.Show("Неверный пароль.");
					return;
				}

				var mainWindow = new MainWindow();
				mainWindow.Show();
			}

			Close();
		}
	}
}
