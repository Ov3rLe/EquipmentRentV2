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

namespace EquipmentRent.Pages
{ 
	public partial class EquipmentPage : Page
	{
		public EquipmentPage()
		{
			InitializeComponent();
			UpdateList();
		}

		public void UpdateList()
			=> ClientList.ItemsSource = ContextWrapper.Context.Equipment.Where((e) => !e.IsDeleted).ToList();

		private void OnAdd(object sender, RoutedEventArgs e)
		{

		}

		private void OnRemove(object sender, RoutedEventArgs e)
		{
			var selected = ClientList.SelectedItem;

			if (selected == null)
			{
				MessageBox.Show("Выберите запись для удаления.");
				return;
			}

			else
			{
				var result = MessageBox.Show(
					"Вы действительно хотите удалить эту запись?",
					"Подтверждение",
					MessageBoxButton.YesNo,
					MessageBoxImage.Question);

				if (result == MessageBoxResult.Cancel || result == MessageBoxResult.No)
					return;
			}

			try
			{
				ContextWrapper.Context.Equipment.Remove(selected as Equipment);
				ContextWrapper.Context.SaveChanges();
			}

			catch (Exception ex)
			{
				MessageBox.Show(
					"Что-то пошло не так.\nНе удалось удалить запись.",
					"Ошибка",
					MessageBoxButton.OK,
					MessageBoxImage.Error);

				return;
			}

			UpdateList();
			MessageBox.Show("Запись успешно удалена.");
		}
	}
}
