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

using EquipmentRent.HelperClasses;
using EquipmentRent.DataModel;

namespace EquipmentRent.Windows
{
    public partial class ClientAddWindow : Window
    {
        public ClientAddWindow()
        {
            InitializeComponent();

			BirthdayPicker.SelectedDate = DateTime.Now;

			GenderBox.ItemsSource = 
				ContextWrapper.Context.Gender.ToList();
			
			PassportTypeBox.ItemsSource = 
				ContextWrapper.Context.PassportType.ToList();

			GenderBox.SelectedIndex = 0;
			PassportTypeBox.SelectedIndex = 0;
        }

		private void OnAddClick(object sender, RoutedEventArgs e)
		{
			var passport = new Passport
			{
				PassportSeries = PassportSeriesBox.Text,
				PassportNumber = PassportNumberBox.Text,
				PassportTypeID = ((PassportType)PassportTypeBox.SelectedItem).ID
			};

			ContextWrapper.Context.Passport.Add(passport);
			ContextWrapper.Context.SaveChanges();

			ContextWrapper.Context.Client.Add(new Client
				{
					FirstName = NameBox.Text,
					LastName = SurnameBox.Text,
					Patronymic = PatronymucBox.Text,
					BirthDate = (DateTime)BirthdayPicker.SelectedDate,
					PhoneNumber = PhoneBox.Text,
					Email = EmailBox.Text,
					GenderID = ((Gender)GenderBox.SelectedItem).ID,
					PassportID = passport.ID
				}
			);

			ContextWrapper.Context.SaveChanges();
			Close();
		}
	}
}
