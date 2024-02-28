using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace BMO_Project
{
    /// <summary>
    /// Логика взаимодействия для PageLogin.xaml
    /// </summary>
    public partial class PageLogin : Page
    {
        public static Window window;
        private static BMOEntities BMOentities = new BMOEntities();
        public PageLogin(Window w)
        {
            window= w;
            InitializeComponent();
            
        }
        private void bt_in_Click(object sender, RoutedEventArgs e)
        {
            var loginer = BMOentities.Users.ToList().Where(a => a.Us_login == tb_login.Text & a.Us_password == pw_password.Password);
            if (loginer.Count() == 1)
            {
                Loginer.UserId = loginer.First().UserID;
                Loginer.Login = loginer.First().Us_login;
                Loginer.UpdateCount(BMOentities);
                //MessageBox.Show("Вы авторизовались");
                new MessageWin("Вы авторизовались") { Owner = window }.ShowDialog();
                window.Close();
                
            }
            else
            {
                Loginer.UpdateCount(BMOentities);
                new MessageWin("Неуспешная авторизация") { Owner = window }.ShowDialog();
                //MessageBox.Show("Неуспешная авторизация");
                Loginer.UpdateCount(BMOentities);
            }
        }
        private void but_new_Click(object sender, RoutedEventArgs e)
        {
            this.NavigationService.Navigate(new PageRegist(window));  
        }
    }
}
