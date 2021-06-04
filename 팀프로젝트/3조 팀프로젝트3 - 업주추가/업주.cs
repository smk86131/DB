using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.OracleClient;

namespace _3조_팀프로젝트3
{
    public partial class 업주 : Form
    {
        OracleConnection oracleConnection;
        public 업주()
        {
            InitializeComponent();
#pragma warning disable CS0618 // Type or member is obsolete
            oracleConnection = new OracleConnection("Data Source=192.168.0.31;User ID=TEAM3;Password=1234;Unicode=True");
#pragma warning restore CS0618 // Type or member is obsolete
        }

        private void 업주_Load(object sender, EventArgs e)
        {
            // TODO: 이 코드는 데이터를 'dataSet1.업주' 테이블에 로드합니다. 필요 시 이 코드를 이동하거나 제거할 수 있습니다.
            this.업주TableAdapter.Fill(this.dataSet1.업주);

        }
        private void open_conn()
        {
            if (oracleConnection.State == ConnectionState.Closed) oracleConnection.Open();
        }
        private void grid()
        {
            OracleDataAdapter da;
            DataSet ds;
            ds = new DataSet();
            string query;

            query = "Select * from 업주";
            da = new OracleDataAdapter(query, oracleConnection);
            da.Fill(ds, "업주");

            dataGridView1.DataSource = ds;
            dataGridView1.DataMember = "업주";
        }
        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (dataGridView1.Rows[e.RowIndex].Cells["업주번호"].Value.ToString() == "")
            {
                MessageBox.Show("first", "second", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else
            {
                textBox1.Text = dataGridView1.Rows[e.RowIndex].Cells["업주번호"].Value.ToString();
                textBox2.Text = dataGridView1.Rows[e.RowIndex].Cells["업주이름"].Value.ToString();
                textBox3.Text = dataGridView1.Rows[e.RowIndex].Cells["사업자번호"].Value.ToString();
                textBox4.Text = dataGridView1.Rows[e.RowIndex].Cells["업주주민등록번호"].Value.ToString();
                textBox5.Text = dataGridView1.Rows[e.RowIndex].Cells["핸드폰번호"].Value.ToString();
                textBox6.Text = dataGridView1.Rows[e.RowIndex].Cells["업주이메일"].Value.ToString();
            }
        }
        private void Form1_Load(object sender, EventArgs e)
        {
            grid();
        }


        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            OracleCommand cmd;
            string query = "";
            int row;

            DataSet ds = new DataSet();
            OracleDataAdapter da = new OracleDataAdapter("select * from 업주 where 업주번호 = '" + textBox1.Text + "'", oracleConnection);
            row = da.Fill(ds, "업주");

            if (textBox1.Text == "" || textBox2.Text == "" || textBox3.Text == "" || textBox4.Text == "" || textBox5.Text == "" || textBox6.Text == "")
            {
                MessageBox.Show("asdfasd", "asdfds", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                textBox1.Focus();
            }
            else
            {
                if (row == 0)
                {
                    if (MessageBox.Show("입력하시겠습니까 ? ", "입력", MessageBoxButtons.YesNo, MessageBoxIcon.Information) == DialogResult.Yes)
                    {
                        query = "insert into 업주(업주번호, 업주이름, 사업자번호, 업주주민등록번호, 핸드폰번호, 업주이메일) values('" + textBox1.Text + "','" + textBox2.Text + "','" + textBox3.Text + "','" + textBox4.Text + "','" + textBox5.Text + "','" + textBox6.Text + "')";
                        MessageBox.Show("입력되었습니다");
                    }

                }
                else
                {
                    query = "update 업주 set 업주이름 = '" + textBox2.Text + "',사업자번호 = '" + textBox3.Text + "',업주주민등록번호 = '" + textBox4.Text + "',핸드폰번호 = '" + textBox5.Text + "',업주이메일 = '" + textBox6.Text + "' where 업주번호 = '" + textBox1.Text + "'";
                    MessageBox.Show("updated");
                }
                cmd = new OracleCommand();
                open_conn();
                try
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = query;
                    cmd.Connection = oracleConnection;
                    row = cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                    textBox1.Focus();
                }
                grid();
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            OracleCommand cmd;
            string de = "delete from 업주 where 업주번호 = '" + textBox1.Text + "'";
            if (textBox1.Text == "") MessageBox.Show("delete!");
            if (MessageBox.Show("삭제하시겠습니까 ? ", "삭제", MessageBoxButtons.YesNo, MessageBoxIcon.Warning) == DialogResult.Yes)
            {
                open_conn();
                cmd = new OracleCommand();
                try
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.CommandText = de;
                    cmd.Connection = oracleConnection;
                    cmd.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                    textBox1.Focus();
                }
            }
            grid();
        }
    }
}
