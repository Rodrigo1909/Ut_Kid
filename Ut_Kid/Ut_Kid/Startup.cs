using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Ut_Kid.Startup))]
namespace Ut_Kid
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
