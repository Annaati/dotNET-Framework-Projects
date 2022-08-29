using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.IO;

public partial class admin_users : System.Web.UI.Page
{
    public static TextBox TxtId = new TextBox();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            FillGVUsers();
        }
    }

    protected void BtnEdit_Click(object sender, EventArgs e)
    {
        LinkButton linkdetail = sender as LinkButton;
        GridViewRow grow = (GridViewRow)linkdetail.NamingContainer;
        TxtId.Text = grow.Cells[0].Text;

        try
        {
            using (SqlConnection conn = Connection.getdbConnection())
        {
            SqlCommand cmd = new SqlCommand("SELECT * FROM users WHERE id = '" + TxtId.Text + "' ", conn);
            SqlDataReader sdr = cmd.ExecuteReader();

            while (sdr.Read())
            {
                //Id 0
                TxtFullName.Text = sdr[1].ToString();
                DDLGender.Text = sdr[2].ToString();
                TxtDOB.Text = sdr[3].ToString();
                TxtTellNum.Text = sdr[4].ToString();
                TxtEmail.Text = sdr[5].ToString();
                //Password 6
                //FUImg.FileBytes = sdr[7].ToString();
                //Reg Date 8
                //User Id 9
                DDLStatus.Text = sdr[10].ToString();
            }
        }
        }
        catch(Exception ex)
        {
            LblMsg.Text = ex.Message.ToString();
            LblMsg.ForeColor = System.Drawing.Color.Red;
        }
        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openuserModal();", true);
    }

    protected void BtnSave_Click(object sender, EventArgs e)
    {
        InsertUpdateUsers();
    }


    //User defined Functions


    //Populate/Fill GridView Users Users
    void FillGVUsers()
    {
        DataTable dt = new DataTable();
       try
       {
           using (SqlConnection con = Connection.getdbConnection())
           {
               SqlDataAdapter sda = new SqlDataAdapter("SELECT * FROM users", con);
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
           GVUsers.DataSource = ex.Message.ToString();
           GVUsers.DataBind();
           GVUsers.BackColor = System.Drawing.Color.Red;
       }

    }

    //Insert Or Update Users
    void InsertUpdateUsers()
    {
        string msg, filepath, filename;
        try
        {
            String date = DateTime.Now.ToString("yyyy-MM-dd");

            if (FUImg.HasFile)
            {
                filepath = "~/assets/ProfPics/user3.jpg";
                filename = Path.GetFileName(FUImg.PostedFile.FileName);
                FUImg.SaveAs(Server.MapPath("assets/ProfPics/" + filename));
                filepath = "~/assets/ProfPics/" + filename;


                using (SqlConnection conn = Connection.getdbConnection())
                {
                    ////txtid.Text = "0";
                    SqlCommand cmd = new SqlCommand("spUsers", conn);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@id", TxtId.Text);
                    cmd.Parameters.AddWithValue("@fullName", TxtFullName.Text);
                    cmd.Parameters.AddWithValue("@gender", DDLGender.SelectedItem.ToString());
                    cmd.Parameters.AddWithValue("@dob", TxtDOB.Text);
                    cmd.Parameters.AddWithValue("@tellNum ", TxtTellNum.Text);
                    cmd.Parameters.AddWithValue("@email", TxtEmail.Text);
                    cmd.Parameters.AddWithValue("@password", TxtPassword.Text);
                    cmd.Parameters.AddWithValue("@imgUrl", filepath);
                    cmd.Parameters.AddWithValue("@regDate", date);
                    cmd.Parameters.AddWithValue("@userId", "1");
                    cmd.Parameters.AddWithValue("@status", DDLStatus.SelectedItem.ToString());

                    cmd.Parameters.Add("@msg", SqlDbType.Char, 500);
                    cmd.Parameters["@msg"].Direction = ParameterDirection.Output;

                    cmd.ExecuteNonQuery();

                    msg = (string)cmd.Parameters["@msg"].Value;
                    LblMsg.Text = msg;
                    LblMsg.ForeColor = System.Drawing.Color.Green;

                    cmd.Parameters.Clear();
                    ClearTexts();
                    FillGVUsers();
                }
            }
            else
            {
                LblMsg.Text = "Select Profile Pic";
                LblMsg.ForeColor = System.Drawing.Color.Red;
            }
        }
        catch (Exception ex)
        {
            LblMsg.Text = ex.Message.ToString();
            LblMsg.ForeColor = System.Drawing.Color.Red;
        }
    }
    //Clear Text Controls
    void ClearTexts()
    {
        TxtId.Text = "";
        TxtFullName.Text = "";
        DDLGender.ClearSelection();
        TxtDOB.Text = "";
        TxtTellNum.Text = "";
        TxtEmail.Text = "";
        TxtPassword.Text = "";
        FUImg.Dispose();
        //Reg Date
        //User Id
        DDLStatus.ClearSelection();
    }

}