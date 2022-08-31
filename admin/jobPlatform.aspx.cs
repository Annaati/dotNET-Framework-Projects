using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_jobPlatform : System.Web.UI.Page
{
    TextBox TxtId = new TextBox();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillGVJobPlatform();
            TxtId.Text = "0";
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
                SqlCommand cmd = new SqlCommand("SELECT * FROM jobplatForm WHERE id = '" + TxtId.Text + "' ", conn);
                SqlDataReader sdr = cmd.ExecuteReader();

                while (sdr.Read())
                {
                    //Id 0
                    TxtJobPlatform.Text = sdr[2].ToString();
                    TxtDescr.Text = sdr[1].ToString();
                    //FUImg.FileBytes = sdr[7].ToString();
                    //Reg Date 8
                    //User Id 9
                    DDLStatus.Text = sdr[10].ToString();
                }
            }
        }
        catch (Exception ex)
        {
            LblMsg.Text = ex.Message.ToString();
            LblMsg.ForeColor = System.Drawing.Color.Red;
        }

        ScriptManager.RegisterStartupScript(this, this.GetType(), "Pop", "openuserModal();", true);
    }

    protected void BtnSave_Click(object sender, EventArgs e)
    {
        InsertUpdateJobPlatform();
    }

    //Custom Defined Functions


    //Populate/Fill GridView Job Platform
    void FillGVJobPlatform()
    {
        DataTable dt = new DataTable();
        try
        {
            using (SqlConnection con = Connection.getdbConnection())
            {
                SqlDataAdapter sqlda = new SqlDataAdapter("SELECT * FROM jobplatForm", con);
                sqlda.Fill(dt);
            }
            if (dt.Rows.Count > 0)
            {
                GVJJobPlatform.DataSource = dt;
                GVJJobPlatform.DataBind();
            }
        }
        catch (Exception ex)
        {
            GVJJobPlatform.DataSource = ex.Message.ToString();
            GVJJobPlatform.DataBind();
            GVJJobPlatform.BackColor = System.Drawing.Color.Red;
        }

    }

    //Insert Or Update Users
    void InsertUpdateJobPlatform()
    {
        string msg;
        try
        {
            String date = DateTime.Now.ToString("yyyy-MM-dd");



            using (SqlConnection conn = Connection.getdbConnection())
            {
                ////txtid.Text = "0";
                SqlCommand cmd = new SqlCommand("spJobPosition", conn);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@id", TxtId.Text);
                cmd.Parameters.AddWithValue("@pfName", TxtJobPlatform.Text);
                cmd.Parameters.AddWithValue("@pfDescr ", TxtDescr.Text);
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
                FillGVJobPlatform();
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
        TxtJobPlatform.Text = "";
        TxtDescr.Text = "";
        //Reg Date
        //User Id
        DDLStatus.ClearSelection();
    }


}