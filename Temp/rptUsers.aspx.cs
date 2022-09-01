using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class rptUsers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillGVUsers();
        }

    }

        //Customly Defined Functions/Methods

         //Fill GridView Hall Details
    void FillGVUsers()
    {
        DataTable dt = new DataTable();
        try
        {
            using (SqlConnection conn = dbConn.getdbConnection())
            {
                SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM users", conn);
                sda.Fill(dt);
            }
            if (dt.Rows.Count > 0)
            {
                GVUsers.DataSource = dt;
                GVUsers.DataBind();
            }
        }
        catch (Exception ex)
        {
            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert", "swal('Something Went Wrong!', '" + ex.Message + "', 'error')", true);
        }

    }


}