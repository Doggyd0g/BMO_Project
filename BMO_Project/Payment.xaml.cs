using System.IO.IsolatedStorage;
using System.Windows;

namespace BMO_Project
{
    /// <summary>
    /// Логика взаимодействия для Payment.xaml
    /// </summary>
    public partial class Payment : Window
    {
        public static bool IsSucess = false;
        public Payment(string s)
        {
            InitializeComponent();
            fr_pay_page.Navigate(new PageCard(s, this));
        }

        private void Window_Closing(object sender, System.ComponentModel.CancelEventArgs e)
        {

            DialogResult = IsSucess;
        }
    }
}
