using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LabWork9
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            LabelLoadTime.Text = DateTime.Now.ToLongTimeString();
        }

        protected void UpdatePanel1_Load(object sender, EventArgs e)
        {
            Label1.Text = DateTime.Now.ToLongTimeString();
        }
        protected void UpdatePanel2_Load(object sender, EventArgs e)
        {
            Label2.Text = $"{DateTime.Now.ToLongTimeString()}: {TextBox1.Text}";
        }
        protected void UpdatePanel3_Load(object sender, EventArgs e)
        {
            var selected = new List<string>();
            foreach (ListItem i in CheckBoxList1.Items)
                if (i.Selected)
                    selected.Add(i.Value);
            Label3.Text = $"{DateTime.Now.ToLongTimeString()}: {string.Join(", ", selected)}";
        }
        protected void UpdatePanel4_Load(object sender, EventArgs e)
        {
            Label4.Text = $"{DateTime.Now.ToLongTimeString()}: {RadioButtonList1.SelectedValue}";
        }
        protected void UpdatePanel5_Load(object sender, EventArgs e)
        {
            Label5.Text = DateTime.Now.ToLongTimeString();
        }
        protected void UpdatePanel6_Load(object sender, EventArgs e)
        {
            Label6.Text = DateTime.Now.ToLongTimeString();
        }
        protected void UpdatePanel7_Load(object sender, EventArgs e)
        {
            Label7.Text = DateTime.Now.ToLongTimeString();
        }
        protected void UpdatePanel8_Load(object sender, EventArgs e)
        {
            Label8.Text = DateTime.Now.ToLongTimeString();
        }

        protected void ButtonError_Click(object sender, EventArgs e)
        {
            throw new ApplicationException("Test AsyncPostBack Error");
        }

        protected void ButtonSleep_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(5000);
        }
    }
}