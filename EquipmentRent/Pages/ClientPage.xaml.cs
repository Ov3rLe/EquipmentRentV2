using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
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
	public partial class ClientPage : Page
	{
		public ClientPage()
		{
			InitializeComponent();
			UpdateList();
		}

		public void UpdateList()
			=> ClientList.ItemsSource = ContextWrapper.Context.Client
			.Where(e => !e.IsDeleted).ToList();

		private void OnClickAdd(object sender, RoutedEventArgs e)
		{
			var w = new ClientAddWindow();
			w.ShowDialog();
			UpdateList();
		}

		private void OnRemoveClick(object sender, RoutedEventArgs e)
        {
            RemoveItem();
        }

		private void OnKeyDown(object sender, KeyEventArgs e)
		{
			if (e.Key == Key.Back || e.Key == Key.Delete)
				RemoveItem();

			if (e.Key == Key.Enter)
				ModifyItem();
		}

		private void RemoveItem()
        {
			if (ClientList.SelectedItem == null)
			{
				MessageBox.Show(
					"Выберите запись для удаления.",
					"Внимание",
					MessageBoxButton.OK,
					MessageBoxImage.Exclamation);

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
				ContextWrapper.Context.Client.Remove(ClientList.SelectedItem as Client);
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
			
			MessageBox.Show("Запись успешно удалена.");
			UpdateList();
		}

		private void ModifyItem()
		{
			if (ClientList.SelectedItem == null)
			{
				MessageBox.Show(
					"Выберите запись для изменения.",
					"Внимание",
					MessageBoxButton.OK,
					MessageBoxImage.Exclamation);

				return;
			}

			var w = new ClientModifyWindow(ClientList.SelectedItem as Client);
			w.ShowDialog();
			UpdateList();
		}
	}
}
