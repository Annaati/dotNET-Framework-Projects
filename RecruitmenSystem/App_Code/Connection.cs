using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

/// <summary>
/// Summary description for Connection
/// </summary>
public class Connection
{
    public static SqlConnection getdbConnection()
    {
        string str = ConfigurationManager.ConnectionStrings["dbConstr"].ConnectionString;
        SqlConnection conn = new SqlConnection(str);
        conn.Open();
        return conn;
    }
}