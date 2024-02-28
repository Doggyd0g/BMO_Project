using System;
using System.Linq;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace BMO_Project
{
    /// <summary>
    /// Логика взаимодействия для PageStore.xaml
    /// </summary>
    public partial class PageStore : Page
    {
        private static BMOEntities BMOentities = new BMOEntities();
        public static Window window;
        public PageStore(Window w)
        {
            InitializeComponent();
            window = w;
            UpdateRows();
        }
        private void NumberValidationTextBox(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }
        private void UpdateRows()
        {
            int StartCost = 0, EndCost = 99999;
            bool IsSearch = true;
            string SearchText = Loginer.Search;
            if (tb_st_cost.Text != string.Empty)
            {
                StartCost = Convert.ToInt32(tb_st_cost.Text);
            }
            if (tb_end_cost.Text != string.Empty)
            {
                EndCost = Convert.ToInt32(tb_end_cost.Text);
            }

            if (SearchText != "")
            {
                IsSearch = false;
            }

            if (rb_allstock.IsChecked == true)
            {
                items_list.ItemsSource = BMOentities.Goods.ToList().Where(a => a.Cost < EndCost & a.Cost > StartCost & (a.Title == SearchText | IsSearch));
            }
            if (rb_instock.IsChecked == true)
            {
                items_list.ItemsSource = BMOentities.Goods.ToList().Where(a => a.Cost < EndCost & a.Cost > StartCost & a.Amount > 0 & (a.Title == SearchText | IsSearch));
            }
            if (rb_outstock.IsChecked == true)
            {
                items_list.ItemsSource = BMOentities.Goods.ToList().Where(a => a.Cost < EndCost & a.Cost > StartCost & a.Amount <= 0 & (a.Title == SearchText | IsSearch));
            }

        }
        private void bt_filt_Click(object sender, RoutedEventArgs e)
        {
            UpdateRows();
        }
        private void bt_add_Click(object sender, RoutedEventArgs e)
        {
            if (Loginer.UserId != 0)
            {
                int AddGood = Convert.ToInt32((sender as Button).Tag.ToString());
                BMOentities.OrderGoods.Add(new OrderGoods { Amount = 1, GoodsId = AddGood, UserId = Loginer.UserId });
                BMOentities.SaveChanges();
                Loginer.UpdateCount(BMOentities);
            }
            else
            {
                new MessageWin("Без авторизации добавление товаров недоступно!") { Owner = window}.ShowDialog();
                //MessageBox.Show("Без авторизации добавление товаров недоступно!");
            }
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            UpdateRows();
        }
    }
}

