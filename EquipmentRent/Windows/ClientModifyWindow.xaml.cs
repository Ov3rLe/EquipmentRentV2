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
using EquipmentRent.HelperClasses;

namespace EquipmentRent.Windows
{
	public partial class ClientModifyWindow : Window
	{
		Client modifiedClient;

		public ClientModifyWindow(Client client)
		{
			modifiedClient = client;

			InitializeComponent();

			var genders = ContextWrapper.Context.Gender.ToList();
			var passportTypes = ContextWrapper.Context.PassportType.ToList();

			GenderBox.ItemsSource = genders;
			PassportTypeBox.ItemsSource = passportTypes;

			GenderBox.SelectedIndex = genders
				.FindIndex((e) => e.ID == client.GenderID);
			PassportTypeBox.SelectedIndex = passportTypes
				.FindIndex((e) => e.ID == client.Passport.PassportTypeID);

			NameBox.Text = client.FirstName;
			SurnameBox.Text = client.LastName;
			PatronymucBox.Text = client.Patronymic;

			BirthdayPicker.SelectedDate = client.BirthDate;

			PhoneBox.Text = client.PhoneNumber;
			EmailBox.Text = client.Email;

			PassportSeriesBox.Text = client.Passport.PassportSeries;
			PassportNumberBox.Text = client.Passport.PassportNumber;	
		}

		private void OnModifyClick(object sender, RoutedEventArgs e)
		{
			modifiedClient.FirstName = NameBox.Text;
			modifiedClient.LastName = SurnameBox.Text;
			modifiedClient.Patronymic = PatronymucBox.Text;
			modifiedClient.BirthDate = (DateTime)BirthdayPicker.SelectedDate;
			modifiedClient.PhoneNumber = PhoneBox.Text;
			modifiedClient.Email = EmailBox.Text;
			modifiedClient.GenderID = ((Gender)GenderBox.SelectedItem).ID;
			modifiedClient.Passport.PassportSeries = PassportSeriesBox.Text;
			modifiedClient.Passport.PassportNumber = PassportNumberBox.Text;
			modifiedClient.Passport.PassportTypeID = ((PassportType)PassportTypeBox.SelectedItem).ID;

			ContextWrapper.Context.SaveChanges();
			Close();
		}
	}
}
