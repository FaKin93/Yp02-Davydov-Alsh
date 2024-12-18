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

namespace Yp02_Davydov_Alsh.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddPage.xaml
    /// </summary>
    public partial class AddPage : Page
    {
        Partners _currentPartners = new Partners();
        public AddPage(Partners currentPartners, bool flag)
        {
            InitializeComponent();
            if (flag)
            {
                ButtonSave.Visibility = Visibility.Visible;
                ButtonRedact.Visibility = Visibility.Hidden;
            }
            else
            {
                ButtonSave.Visibility = Visibility.Hidden;
                ButtonRedact.Visibility = Visibility.Visible;
            }
            if (currentPartners != null)
            {
                _currentPartners = currentPartners;
            }
            DataContext = _currentPartners;
            var context = Entities.GetContext();
            TypeBox.ItemsSource = context.Partner_type.Distinct().ToList();
            TypeBox.SelectedIndex = 0;
        }

        private void ButtonSave_Click(object sender, RoutedEventArgs e)
        {
            //if (CheckFields())
            //{
            //    if (_currentPartners.ID_partner == 0)
            //    {
            //        Entities.GetContext().Partners.Add(_currentPartners);
            //        try
            //        {
            //            Entities.GetContext().SaveChanges();
            //            MessageBox.Show("Сохранение прошло успешно!");
            //            _currentPartners = new Partners();
            //            DataContext = _currentPartners;
            //        }
            //        catch (Exception ex)
            //        {
            //            MessageBox.Show($"Не получилось сохранить данные: {ex}");
            //        }
            //    }
            //    else
            //    {
            //        Partners finded = Entities.GetContext().Partners.FirstOrDefault(u => u.ID_partner == _currentPartners.ID_partner);

            //        if (finded != null)
            //        {
            //            finded = _currentPartners;
            //            try
            //            {
            //                Entities.GetContext().SaveChanges();
            //                MessageBox.Show("Сохранение прошло успешно!");
            //            }
            //            catch (Exception ex)
            //            {
            //                MessageBox.Show($"Не получилось сохранить данные: {ex}");
            //            }
            //        }
            //    }
            //}

            if (string.IsNullOrEmpty(TextBoxName.Text) || string.IsNullOrEmpty(TypeBox.Text) || string.IsNullOrEmpty(RatingBox.Text) || string.IsNullOrEmpty(TextBoxAdress.Text) || string.IsNullOrEmpty(TextBoxAdress.Text) || string.IsNullOrEmpty(TextBoxSecond.Text) || string.IsNullOrEmpty(TextBoxFirst.Text) || string.IsNullOrEmpty(TextBoxThird.Text) || string.IsNullOrEmpty(TextBoxPhone.Text) || string.IsNullOrEmpty(TextBoxEmail.Text))
            {
                MessageBox.Show("Заполните все вышеуказанные поля!");
                return;
            }
            using (var database = new Entities())
            {
                var name = database.Partners
                    .AsNoTracking()
                    .FirstOrDefault(u => u.Name == TextBoxName.Text);
                if (name != null)
                {
                    MessageBox.Show("Такой партнёр уже существует");
                    return;
                }
            }
            if (int.Parse(RatingBox.Text) < 0 || RatingBox.Text.Contains(".") || RatingBox.Text.Contains(","))
            {
                MessageBox.Show("Рэйтинг обязан быты целым положительным числом");
                return;
            } // выводим сообщение

            MessageBoxResult result = MessageBox.Show("Вы уверены что хотите Добавить/Сохранить эти данные?", "Подтвержение закрытия", MessageBoxButton.YesNo, MessageBoxImage.Warning);
            if (result == MessageBoxResult.Yes)
            {
                Entities db = new Entities();
                Partners PartnerObject = new Partners
                {
                    Name = TextBoxName.Text,
                    Type = _currentPartners.Type = TypeBox.SelectedIndex + 1,
                    Rating = int.Parse(RatingBox.Text),
                    Adress = TextBoxAdress.Text,
                    Director_name = TextBoxSecond.Text,
                    Director_middle_name = TextBoxFirst.Text,
                    Director_last_name = TextBoxThird.Text,
                    Phone = TextBoxPhone.Text,
                    Email = TextBoxEmail.Text,
                };
                db.Partners.Add(PartnerObject);
                db.SaveChanges();
                MessageBox.Show("Пользователь Добавлен");

            }
        }
        //public bool CheckFields()
        //{
        //    if (string.IsNullOrEmpty(TextBoxName.Text) || string.IsNullOrEmpty(TypeBox.Text) || string.IsNullOrEmpty(RatingBox.Text) || string.IsNullOrEmpty(TextBoxAdress.Text) || string.IsNullOrEmpty(TextBoxAdress.Text) || string.IsNullOrEmpty(TextBoxSecond.Text) || string.IsNullOrEmpty(TextBoxFirst.Text) || string.IsNullOrEmpty(TextBoxThird.Text) || string.IsNullOrEmpty(TextBoxPhone.Text) || string.IsNullOrEmpty(TextBoxEmail.Text))
        //    {
        //        MessageBox.Show("Заполните все вышеуказанные поля!");
        //        return false;
        //    }
        //    using (var database = new Entities())
        //    {
        //        var name = database.Partners
        //            .AsNoTracking()
        //            .FirstOrDefault(u => u.Name == TextBoxName.Text);
        //        if (name != null)
        //        {
        //            MessageBox.Show("Такой партнёр уже существует");
        //            return false;
        //        }
        //    }
        //    if (int.Parse(RatingBox.Text) < 0 || RatingBox.Text.Contains(".") || RatingBox.Text.Contains(","))
        //    {
        //        MessageBox.Show("Рэйтинг обязан быты целым положительным числом");
        //        return false;
        //    } // выводим сообщение
        //    return true;
        //}

        //private void TypeBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        //{
        //    if (TypeBox.SelectedItem == null) 
        //    {
        //        MessageBox.Show("Select item");
        //    }
        //    else
        //    {
        //        _currentPartners.Type = TypeBox.SelectedIndex + 1;
        //    }
        //}
    }
}
