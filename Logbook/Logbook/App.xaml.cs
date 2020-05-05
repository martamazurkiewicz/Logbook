using System;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Logbook
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();
            bool signedIn = false;
            if (signedIn)
                MainPage = new MainPage();
            else
                MainPage = new MainPage();
        }

        protected override void OnStart()
        {
        }

        protected override void OnSleep()
        {
        }

        protected override void OnResume()
        {
        }
    }
}
