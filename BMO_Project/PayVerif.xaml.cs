using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace BMO_Project
{
    /// <summary>
    /// Логика взаимодействия для PayVerif.xaml
    /// </summary>
    public partial class PayVerif : Page
    {
        private static BMOEntities BMOentities = new BMOEntities();

        public static Window window;
        public PayVerif(string s, Window w)
        {
            InitializeComponent();
            window= w;
            tb_cost.Text = s;
        }
        private void NumberValidationTextBox(object sender, TextCompositionEventArgs e)
        {

            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void TextBox_TextChanged(object sender, TextChangedEventArgs e)
        {
            if((sender as TextBox).Text.Length >= 4)
            {
                new MessageWin("Заказ оформлен!") {Owner = window}.ShowDialog();
                Loginer.DelOrder(BMOentities);
                window.Close();
            }
        }
    }
}
