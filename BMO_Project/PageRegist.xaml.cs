using System.Linq;
using System.Windows;
using System.Windows.Controls;

namespace BMO_Project
{
    /// <summary>
    /// Логика взаимодействия для PageRegist.xaml
    /// </summary>
    public partial class PageRegist : Page
    {
        private static BMOEntities BMOentities = new BMOEntities();

        public static Window window;
        public PageRegist(Window w)
        {
            window = w;
            InitializeComponent();
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if(tb_login.Text != string.Empty & tb_login.Text.Length > 4 & pw_password.Password != string.Empty & pw_password.Password.Length > 5 & pw_password.Password == pw_repeat_pass.Password)
            {   
                if (BMOentities.Users.ToList().Where(a => a.Us_login == tb_login.Text).Count() == 0)
                {
                    Users new_user= new Users{ Us_login = tb_login.Text, Us_password = pw_password.Password };
                    BMOentities.Users.Add(new_user);
                    BMOentities.SaveChanges();
                    Loginer.UserId = new_user.UserID;
                    Loginer.Login = new_user.Us_login;
                    new MessageWin("Регистрация прошла успешно. Вход в систему выполнен автоматически") { Owner = window }.ShowDialog();
                    //MessageBox.Show("Регистрация прошла успешно. Вход в систему выполнен автоматически");
                    window.Close();
                }
                else
                {
                    new MessageWin("Пользователь с таким логином уже существует") {Owner = window}.ShowDialog();
                    //MessageBox.Show("Пользователь с таким логином уже существует");
                }
            }
            else
            {
                new MessageWin("Неудачная регистрация, проверьте введнный логин и пароль") { Owner = window }.ShowDialog();
                //MessageBox.Show("Неудачная регистрация, проверьте введнный логин и пароль");
            }
        }
    }
}
