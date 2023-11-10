namespace FoodApp
{
    public class AppConfig    {
        public App App { get; set; } 
        public Azure Azure { get; set; } 
        public Logging Logging { get; set; } 
    }

     public class App    {
        public string Title { get; set; }
        public bool AuthEnabled { get; set; } 
        public bool UseSQLite {get;set;}
        public ConnectionStrings ConnectionStrings { get; set; }       
    }
   
    public class Azure    {
        public string KeyVault { get; set; } 
        public string TenantId { get; set; } 
        public string ClientId { get; set; } 
        public string Instance {get;set;}
        public string cacheLocation { get; set; } 
    }    

    public class ConnectionStrings    {
        public string SQLiteDBConnection { get; set; } 
        public string SQLServerConnection { get; set; } 
    }
    
    public class LogLevel    {
        public string Default { get; set; } 
        public string Microsoft { get; set; }     
    }

    public class Logging    {
        public LogLevel LogLevel { get; set; } 
    }
}