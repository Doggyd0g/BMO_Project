using System;
using System.Linq;
using System.Windows;

namespace BMO_Project
{

    /// <summary>
    /// Логика взаимодействия для Login.xaml
    /// </summary>
    public partial class Login : Window
    {
        public Login()
        {
            InitializeComponent();

            if(Loginer.UserId == 0)
            {
                fr_login.Content = new PageLogin(this);
            }
            else
            {
                fr_login.Content = new PageAcount(this);
            }
        }
    }
}
