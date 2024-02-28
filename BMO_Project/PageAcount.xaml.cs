using System.Windows;
using System.Windows.Controls;

namespace BMO_Project
{
    /// <summary>
    /// Логика взаимодействия для PageAcount.xaml
    /// </summary>
    public partial class PageAcount : Page
    {
        public static Window window;
        public PageAcount(Window w)
        {
            InitializeComponent();
            window= w;
            tb_login.Text = Loginer.Login;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            Loginer.Login = "Вход";
            Loginer.UserId = 0;
            Loginer.Count = 0;
            window.Close();
        }
    }
}
