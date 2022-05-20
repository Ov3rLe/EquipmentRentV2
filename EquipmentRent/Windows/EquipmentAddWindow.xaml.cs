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
    /// <summary>
    /// Логика взаимодействия для EquipmentAddWindow.xaml
    /// </summary>
    public partial class EquipmentAddWindow : Window
    {
        public EquipmentAddWindow()
        {
            InitializeComponent();

            CategoryBox.ItemsSource =
                ContextWrapper.Context.EquipmentType.ToList();

            StatusBox.ItemsSource =
                ContextWrapper.Context.EquipmentStatus.ToList();

			CategoryBox.SelectedIndex = 0;
			StatusBox.SelectedIndex = 0;
        }

		private void OnAddClick(object sender, RoutedEventArgs e)
		{

			ContextWrapper.Context.Equipment.Add(new Equipment
			{
                TypeID = ((EquipmentType)CategoryBox.SelectedItem).ID,
                StatusID = ((EquipmentStatus)StatusBox.SelectedItem).ID,
                Name = NameBox.Text,
                Price = Convert.ToDecimal(CostBox.Text)
            }
            );

			ContextWrapper.Context.SaveChanges();
			Close();
		}
	}
}
