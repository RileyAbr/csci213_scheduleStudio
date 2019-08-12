using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ScheduleStudioSite.Startup))]
namespace ScheduleStudioSite
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
