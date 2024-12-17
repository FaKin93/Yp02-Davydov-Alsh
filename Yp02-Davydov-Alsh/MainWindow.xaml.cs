using System;
using System.Collections.Generic;
using System.Data;
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
using System.Windows.Threading;

namespace Yp02_Davydov_Alsh
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        Partners currentPartners = new Partners();
        public MainWindow()
        {
            InitializeComponent();
            var context = Entities.GetContext();
            var currentPartners = context.Partners.ToList();
            ListPartners.ItemsSource = currentPartners;
            UpdatePartners();

        }
        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {
            MessageBoxResult result = MessageBox.Show("Вы уверены что хотите закрыть приложение?", "Подтвержение закрытия", MessageBoxButton.YesNo, MessageBoxImage.Question);
            if (result == MessageBoxResult.No)
                e.Cancel = true;
        }
        private void UpdatePartners()
        {
            //загружаем всех пользователей в список
            var currentUsers = Entities.GetContext().Partners.ToList();
        }

        private void back_Click(object sender, RoutedEventArgs e)
        {

        }

        private void ListPartners_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
    }
}
