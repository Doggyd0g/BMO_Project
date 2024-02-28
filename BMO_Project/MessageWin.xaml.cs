using System.Windows;

namespace BMO_Project
{
    /// <summary>
    /// Логика взаимодействия для MessageWin.xaml
    /// </summary>
    public partial class MessageWin : Window
    {
        public MessageWin(string text)
        {
            
            InitializeComponent();
            tb_text.Text = text;
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
