using System;
using System.Linq;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace BMO_Project
{
    /// <summary>
    /// Логика взаимодействия для PageBag.xaml
    /// </summary>
    public partial class PageBag : Page
    {
        private static BMOEntities BMOentities = new BMOEntities();
        public static Window window;
        
        public PageBag(Window w)
        {
            window = w;
            InitializeComponent();
        }
        private void NumberValidationTextBox(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);   
        }

        private void Page_Loaded(object sender = null, RoutedEventArgs e = null)
        {
            var temp = BMOentities.OrderGoods.ToList().Where(a => a.UserId == Loginer.UserId);
            order_list.ItemsSource = temp;
            tb_count.Text = temp.Count().ToString();
            double sum = 0;
            foreach(var i in temp)
            {
                sum += i.Goods.Cost * i.Amount;
            }
            tb_allcount.Text = Math.Round(sum, 2).ToString() + " $";
        }

        private void bt_delall_Click(object sender = null, RoutedEventArgs e = null)
        {
            Page_Loaded();
            Loginer.UpdateCount(BMOentities);
        }

        private void bt_orreg_Click(object sender, RoutedEventArgs e)
        {
            if (tb_count.Text != "0")
            {
                new Payment(tb_allcount.Text).ShowDialog();
                bt_delall_Click();
            }
            else
            {
                new MessageWin("Корзина пуста, Милорд") { Owner = window}.ShowDialog();
            }


        }

        private void bt_del_Click(object sender, RoutedEventArgs e)
        {
            int delRow = Convert.ToInt32((sender as Button).Tag.ToString());
            BMOentities.OrderGoods.Remove(BMOentities.OrderGoods.Where(a => a.OrderGoodsId == delRow).First());
            BMOentities.SaveChanges();
            Page_Loaded();
            Loginer.UpdateCount(BMOentities);
        }
    }
}
