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
    /// <summary>
    /// Логика взаимодействия для EquipmentModifyWindow.xaml
    /// </summary>
    public partial class EquipmentModifyWindow : Window
    {
		Equipment modifiedEquipment;

		public EquipmentModifyWindow(Equipment equipment)
		{
			modifiedEquipment = equipment;

			InitializeComponent();

			var category = ContextWrapper.Context.EquipmentType.ToList();
			var status = ContextWrapper.Context.EquipmentStatus.ToList();

			CategoryBox.ItemsSource = category;
			StatusBox.ItemsSource = status;

			CategoryBox.SelectedIndex = category
				.FindIndex((e) => e.ID == equipment.TypeID);
			StatusBox.SelectedIndex = status
				.FindIndex((e) => e.ID == equipment.StatusID);

			NameBox.Text = equipment.Name;
			CostBox.Text = equipment.Price.ToString();
		}

		private void OnModifyClick(object sender, RoutedEventArgs e)
		{
			modifiedEquipment.TypeID = ((EquipmentType)CategoryBox.SelectedItem).ID;
			modifiedEquipment.StatusID = ((EquipmentStatus)StatusBox.SelectedItem).ID;
			modifiedEquipment.Name = NameBox.Text;
			modifiedEquipment.Price = Convert.ToDecimal(CostBox.Text);

			ContextWrapper.Context.SaveChanges();
			Close();
		}
	}
}
