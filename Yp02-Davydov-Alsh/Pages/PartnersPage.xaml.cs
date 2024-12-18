﻿using System;
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

namespace Yp02_Davydov_Alsh.Pages
{
    /// <summary>
    /// Логика взаимодействия для PartnersPage.xaml
    /// </summary>
    public partial class PartnersPage : Page
    {
        public PartnersPage()
        {
            InitializeComponent();
            var context = Entities.GetContext();
            var currentPartners = context.Partners.ToList();
            ListPartners.ItemsSource = currentPartners;
            UpdatePartners();

        }

        private void UpdatePartners()
        {
            //загружаем всех пользователей в список
            var currentUsers = Entities.GetContext().Partners.ToList();
        }
        private void Add_Click(object sender, RoutedEventArgs e)
        {
            NavigationService.Navigate(new AddPage(null, true));
        }
    }
}