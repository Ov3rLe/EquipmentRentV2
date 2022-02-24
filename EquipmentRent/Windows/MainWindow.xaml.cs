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

using EquipmentRent.Windows;
using EquipmentRent.Pages;

namespace EquipmentRent
{
	public partial class MainWindow : Window
	{
		bool OptionChosen = false;
		string prevSelection = null;

		public MainWindow()
		{
			InitializeComponent();
            PageContainer.NavigationUIVisibility = NavigationUIVisibility.Hidden;
		}

		private void ChangePage(object sender, RoutedEventArgs e)
		{
			if (!OptionChosen)
			{
				HintLabel.Visibility = Visibility.Collapsed;
				OptionChosen = true;
			}

			string btnName = (sender as Button).Name;

			if ((sender as Button).Name == "ClientMngButton" && prevSelection != btnName)
				PageContainer.Navigate(new ClientPage());

			else
			if ((sender as Button).Name == "EquipmentMngButton" && prevSelection != btnName)
				PageContainer.Navigate(new EquipmentPage());

			else
			if ((sender as Button).Name == "RentMngButton" && prevSelection != btnName)
				PageContainer.Navigate(new RentPage());

			prevSelection = btnName;
		}
	}
}
