using System.Linq;
using System.Windows;

namespace BMO_Project
{
    public class Loginer
    {
        public static int UserId { get; set; } = 0;
        public static string Login { get; set; } = "Вход";
        public static int Count { get; set; } = 0;
        public static string Search { get; set; } = "";

        public static void UpdateLogin()
        {

            foreach (Window window in Application.Current.Windows)
            {
                if (window.GetType() == typeof(MainWindow))
                {
                    (window as MainWindow).tb_count.Text = Count.ToString();
                    (window as MainWindow).tb_login.Text = Login;
                    if (UserId != 0) {
                        (window as MainWindow).bt_emp.Visibility = Visibility.Visible;
                    }
                    else
                    {
                        (window as MainWindow).bt_emp.Visibility = Visibility.Hidden;
                    }
                }
            }
        }

        public static void UpdateCount(BMOEntities BMOentities)
        {
            if (UserId == 0)
            {
                Count = 0;
            }
            else
            {
                var temp = BMOentities.OrderGoods.ToList().Where(c => c.UserId == UserId).Count();
                Count = temp;
            }
            UpdateLogin();
        }
        public static void DelOrder(BMOEntities BMOentities)
        {
            var temp = BMOentities.OrderGoods.Where(a => a.UserId == Loginer.UserId);
            if (temp != null)
            {
                BMOentities.OrderGoods.RemoveRange(temp);
                BMOentities.SaveChanges();
            }
        }
    }
}
