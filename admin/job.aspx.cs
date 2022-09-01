using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class admin_job : System.Web.UI.Page
{
    public static TextBox TxtId = new TextBox();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            FillGVJobs();
            FillDDLJobCat();
            FillDDLJobPosition();
            FillDDLJobPlatform();
            FillDDLJobAppProcess();
            FillDDLJobOrgName();
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
                SqlCommand cmd = new SqlCommand("spJobLists'" + TxtId.Text + "' ", conn);
                SqlDataReader sdr = cmd.ExecuteReader();

                while (sdr.Read())
                {
                    //Id 0
                    DDLcatName.Text = sdr[10].ToString();
                    DDLjpName.Text = sdr[10].ToString();
                    DDLJPlatform.Text = sdr[10].ToString();
                    DDLorgName.Text = sdr[10].ToString();
                    DDLAppprocess.Text = sdr[10].ToString();
                    TxtjDescr.Text = sdr[10].ToString();
                    TxtpubdDate.Text = sdr[10].ToString();
                    TxtDeadLine.Text = sdr[10].ToString();
                    TxtNumPositions.Text = sdr[10].ToString();
                    TxtStartDate.Text = sdr[10].ToString();
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
        InsertUpdateJobs();
    }


    //Custom Fucntions

    //Fill GridView Jobs
    void FillGVJobs()
    {
        DataTable dt = new DataTable();
        try
        {
            using (SqlConnection con = Connection.getdbConnection())
            {
                SqlDataAdapter sqlda = new SqlDataAdapter("SELECT * FROM jobs", con);
                sqlda.Fill(dt);
            }
            if (dt.Rows.Count > 0)
            {
                GVJobs.DataSource = dt;
                GVJobs.DataBind();
            }
        }
        catch (Exception ex)
        {
            GVJobs.DataSource = ex.Message.ToString();
            GVJobs.DataBind();
            GVJobs.BackColor = System.Drawing.Color.Red;
        }
    }

    //Fill Dropdown List Job Category
    void FillDDLJobCat()
    {
        try
        {
            using (SqlConnection con = Connection.getdbConnection())
            {
                string qry = "select id,catName from jobCategory";
                SqlDataAdapter da = new SqlDataAdapter(qry, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                DDLcatName.DataValueField = "id";
                DDLcatName.DataTextField = "catName";
                DDLcatName.DataSource = ds;
                DDLcatName.DataBind();
                DDLcatName.Items.Insert(0, new ListItem("Select Job Cat..."));
            }
        }
        catch (Exception ex)
        {
            DDLcatName.DataTextField = ex.ToString();
            DDLcatName.ForeColor = System.Drawing.Color.Red;
        }
    }

    //Fill Dropdown List Job Position
    void FillDDLJobPosition()
    {
        try
        {
            using (SqlConnection con = Connection.getdbConnection())
            {
                string qry = "select id,jpName from jobPosition";
                SqlDataAdapter da = new SqlDataAdapter(qry, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                DDLjpName.DataValueField = "CID";
                DDLjpName.DataTextField = "jpName";
                DDLjpName.DataSource = ds;
                DDLjpName.DataBind();
                DDLjpName.Items.Insert(0, new ListItem("Select Position Name..."));
            }
        }
        catch (Exception ex)
        {

            DDLjpName.DataTextField = ex.ToString();
            DDLjpName.ForeColor = System.Drawing.Color.Red;
        }
    }

    //Fill Dropdown List Job Platform
    void FillDDLJobPlatform()
    {
        try
        {
            using (SqlConnection con = Connection.getdbConnection())
            {
                string qry = "select id,pfName from jobplatForm";
                SqlDataAdapter da = new SqlDataAdapter(qry, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                DDLJPlatform.DataValueField = "id";
                DDLJPlatform.DataTextField = "pfName";
                DDLJPlatform.DataSource = ds;
                DDLJPlatform.DataBind();
                DDLJPlatform.Items.Insert(0, new ListItem("Select Job Platform..."));
            }
        }
        catch (Exception ex)
        {
            DDLJPlatform.DataTextField = ex.ToString();
            DDLJPlatform.ForeColor = System.Drawing.Color.Red;
        }
    }

    //Fill Dropdown List Organization Name
    void FillDDLJobOrgName()
    {
        try
        {
            using (SqlConnection con = Connection.getdbConnection())
            {
                string qry = "SELECT id,orgName FROM organizations";
                SqlDataAdapter da = new SqlDataAdapter(qry, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                DDLAppprocess.DataValueField = "id";
                DDLAppprocess.DataTextField = "orgName";
                DDLAppprocess.DataSource = ds;
                DDLAppprocess.DataBind();
                DDLAppprocess.Items.Insert(0, new ListItem("SELECT Job org. Name..."));
            }
        }
        catch (Exception ex)
        {
            DDLAppprocess.DataTextField = ex.ToString();
            DDLAppprocess.ForeColor = System.Drawing.Color.Red;
        }
    }

    //Fill Dropdown List Application Process
    void FillDDLJobAppProcess()
    {
        try
        {
            using (SqlConnection con = Connection.getdbConnection())
            {
                string qry = "select id,procName from process";
                SqlDataAdapter da = new SqlDataAdapter(qry, con);
                DataSet ds = new DataSet();
                da.Fill(ds);
                DDLorgName.DataValueField = "id";
                DDLorgName.DataTextField = "procName";
                DDLorgName.DataSource = ds;
                DDLorgName.DataBind();
                DDLorgName.Items.Insert(0, new ListItem("Select Job Job Application process..."));
            }
        }
        catch (Exception ex)
        {
            DDLorgName.DataTextField = ex.ToString();
            DDLorgName.ForeColor = System.Drawing.Color.Red;
        }
    }


    //Insert OR Update Jobs
    void InsertUpdateJobs()
    {
        String msg;
        try
        {
                using (SqlConnection conn = Connection.getdbConnection())
                {
                    ////txtid.Text = "0";
                    SqlCommand cmd = new SqlCommand("spJobs", conn);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@id", TxtId.Text);
                    cmd.Parameters.AddWithValue("@jCatId", DDLcatName.SelectedValue);
                    cmd.Parameters.AddWithValue("@jPosId", DDLjpName.SelectedValue);
                    cmd.Parameters.AddWithValue("@jPid", DDLJPlatform.SelectedValue);
                    cmd.Parameters.AddWithValue("@orgId", DDLorgName.SelectedValue);
                    cmd.Parameters.AddWithValue("@procId", DDLAppprocess.SelectedValue);

                    cmd.Parameters.AddWithValue("@dob", TxtjDescr.Text);
                    cmd.Parameters.AddWithValue("@tellNum ", TxtpubdDate.Text);
                    cmd.Parameters.AddWithValue("@email", TxtDeadLine.Text);
                    cmd.Parameters.AddWithValue("@password", TxtNumPositions.Text);
                    cmd.Parameters.AddWithValue("@imgUrl", TxtStartDate.Text);
                    cmd.Parameters.AddWithValue("@status", DDLStatus.SelectedItem.ToString());

                    cmd.Parameters.Add("@msg", SqlDbType.Char, 500);
                    cmd.Parameters["@msg"].Direction = ParameterDirection.Output;

                    cmd.ExecuteNonQuery();

                    msg = (string)cmd.Parameters["@msg"].Value;
                    LblMsg.Text = msg;
                    LblMsg.ForeColor = System.Drawing.Color.Green;

                    cmd.Parameters.Clear();
                    ClearTexts();
                    FillGVJobs();
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
        DDLcatName.ClearSelection();
        DDLjpName.ClearSelection();
        DDLJPlatform.ClearSelection();
        DDLorgName.ClearSelection();
        DDLAppprocess.ClearSelection();
        TxtjDescr.Text = "";
        TxtpubdDate.Text = "";
        TxtDeadLine.Text = "";
        TxtNumPositions.Text = "";
        TxtStartDate.Text = "";
        DDLStatus.ClearSelection();
    }


}