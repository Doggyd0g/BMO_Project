using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace BMO_Project
{
    /// <summary>
    /// Логика взаимодействия для PageCard.xaml
    /// </summary>
    public partial class PageCard : Page
    {
        private string Cost = "";
        public static Payment window;
        public PageCard(string s, Payment w)
        {
            InitializeComponent();
            Cost = s;
            window = w;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.Navigate(new PayVerif(Cost, window));
        }

        private void NumValidNumber(object sender, TextCompositionEventArgs e)
        {

            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void NumValidDate(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }

        private void NumValidСVC(object sender, TextCompositionEventArgs e)
        {
            Regex regex = new Regex("[^0-9]+");
            e.Handled = regex.IsMatch(e.Text);
        }
    }
}
