using MaterialDesignThemes.Wpf;
using System.Windows;
using System.Windows.Input;


namespace BMO_Project
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        PageGif StartGif = new PageGif();
        //PageBag Page_Bag = new PageBag(this);

        public MainWindow()
        {
            InitializeComponent();
            Loginer.UpdateLogin();
            fr_Content.Navigate(StartGif);
            bt_emp.Visibility = Visibility.Hidden;
        }

        private void but_login_Click(object sender, RoutedEventArgs e)
        {
            new Login() { Owner= this }.ShowDialog();
            Loginer.UpdateLogin();
            fr_Content.Navigate(StartGif);
        }

        private void but_market_Click(object sender, RoutedEventArgs e)
        {
            if (Loginer.UserId == 0)
            {
                new MessageWin("Без авторизации корзина недоступна") { Owner = this }.ShowDialog();
            }
            else
            {
                tb_search.Text = string.Empty;
                fr_Content.Navigate(new PageBag(this));
                ClearHistory();
            }

        }

        private void tb_search_KeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                Loginer.Search = tb_search.Text;
                fr_Content.Navigate(new PageStore(this));

                ClearHistory();
            }
        }

        public void ClearHistory()
        {
            while (fr_Content.CanGoBack)
            {
                fr_Content.RemoveBackEntry();
            }
        }
        private void but_logo(object sender, MouseButtonEventArgs e)
        {
            tb_search.Text= string.Empty;
            fr_Content.Navigate(StartGif);
            ClearHistory();
        }

        private void bt_emp_Click(object sender, RoutedEventArgs e)
        {
            new EmployeerWin().Show();
        }
    }
}
