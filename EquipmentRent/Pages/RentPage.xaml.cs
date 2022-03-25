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

using EquipmentRent.DataModel;
using EquipmentRent.HelperClasses;
using EquipmentRent.Windows;

namespace EquipmentRent.Pages
{
	public partial class RentPage : Page
	{
		public RentPage()
		{
			InitializeComponent();
		}

		public void UpdateList()
			=> ClientList.ItemsSource = ContextWrapper.Context.Client.Where((e) => !e.IsDeleted).ToList();

		private void OnClickAdd(object sender, RoutedEventArgs e)
		{
		
		}

		private void OnRemoveClick(object sender, RoutedEventArgs e)
		{
		
		}

		private void OnKeyDown(object sender, KeyEventArgs e)
		{
	
		}
	}
}
