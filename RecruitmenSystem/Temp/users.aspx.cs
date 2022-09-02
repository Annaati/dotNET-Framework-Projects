using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class admin_users : System.Web.UI.Page
{
    public static TextBox TxtId = new TextBox();

    string dbconn = ConfigurationManager.ConnectionStrings["dbConstr"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            FillGVUsers();
        }
        
    }



    protected void BtnEdit_Click(object sender, EventArgs e)
    {

    }

   


    //User Define Functions

    //Fill GridView Users
    void FillGVUsers()
    {
        DataTable dt = new DataTable();

        SqlConnection conn = new SqlConnection(dbconn);
        if (conn.State == ConnectionState.Closed)
        {
            conn.Open();
        }

        try
        {
            SqlDataAdapter sqlda = new SqlDataAdapter("Select * from users", conn);
            sqlda.Fill(dt);


            if (dt.Rows.Count > 0)
            {
                GVUsers.DataSource = dt;
                GVUsers.DataBind();
            }
        }
        catch (Exception ex)
        {
            LblMsg.Text = "";
            LblMsg.Text = ex.Message.ToString();
            //Response.Write("<script>alert(' Error : " + ex.Message + "');</script>");
        }
    }

    void ClearTexts()
    {
        TxtId.Text = "0";
        TxtFullName.Text = "";
        DDLGender.ClearSelection();
        TxtDOB.Dispose();
        TxtTellNum.Text = "";
        TxtEmail.Text = "";
        TxtPassword.Text = "";
        DDLStatus.ClearSelection();
    }


    protected void BtnSave_Click(object sender, EventArgs e)
    {
        LblMsg.Text = "";
        try
        {
            SqlConnection conn = new SqlConnection(dbconn);

            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }

            //string message = "";

            //string filepath = "~/assets/images/profile/";
            //string filename = Path.GetFileName(FUImg.PostedFile.FileName);
            //FUImg.SaveAs(Server.MapPath("profile/" + filename));
            //filepath = "~/assets/images/profile/" + filename;

            DateTime date = DateTime.Now;
            date.ToString("DD/MM/yyyy");

            SqlCommand cmd = new SqlCommand("INSERT INTO users(@id, fullName,gender,dob,tellNum,email,password," +
                "regDate,userId,status) VALUES(@id, @fullName,@gender,@dob,@tellNum,@email,@password, " +
                ",@regDate,@userId,@Status)", conn);

            cmd.Parameters.AddWithValue("@id", TxtId.Text);
            cmd.Parameters.AddWithValue("@fullName", TxtFullName.Text);
            cmd.Parameters.AddWithValue("@gender", DDLGender.SelectedItem.ToString());
            cmd.Parameters.AddWithValue("@dob", TxtDOB.Text);
            cmd.Parameters.AddWithValue("@tellNum", TxtTellNum.Text);
            cmd.Parameters.AddWithValue("@email", TxtEmail.Text);
            cmd.Parameters.AddWithValue("@password", TxtPassword.Text);
            //cmd.Parameters.AddWithValue("@imgUrl", filepath);
            cmd.Parameters.AddWithValue("@regDate", date);
            cmd.Parameters.AddWithValue("@userId", 1);
            cmd.Parameters.AddWithValue("@Status", DDLStatus.SelectedItem.ToString());

            int res = cmd.ExecuteNonQuery();
            if (res != 0)
            {
                LblMsg.Text = "Success";
                FillGVUsers();
                ClearTexts();
                cmd.Parameters.Clear();
                conn.Close();
            }
            else
            {
                LblMsg.Text = "Failure";
            }
        }
        catch (Exception ex)
        {
            LblMsg.Text = ex.Message.ToString();
        }
    }
}