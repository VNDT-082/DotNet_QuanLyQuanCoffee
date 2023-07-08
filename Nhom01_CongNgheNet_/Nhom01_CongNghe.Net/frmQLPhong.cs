using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Nhom01_CongNghe.Net.DAO;
using Nhom01_CongNghe.Net.DTO;

namespace Nhom01_CongNghe.Net
{
    public partial class frmQLPhong : Form
    {
        dulieu dl = new dulieu();
        List<Phong> ds_Phong = new List<Phong>();
        List<Phong> ds_PhongSua = new List<Phong>();
        List<Phong> ds_PhongThem = new List<Phong>();
        List<Phong> ds_PhongXoa = new List<Phong>();

        List<LoaiPhong> ds_LoaiPhong = new List<LoaiPhong>();
        public frmQLPhong()
        {
            InitializeComponent();
        }
        private void LoadLoaiPhong()
        {
            DataTable tb_LoaiPhong = dl.LoadLoaiPhong_DT();
            if (tb_LoaiPhong.Rows.Count > 0 && tb_LoaiPhong != null)
            {
                foreach(DataRow dr in tb_LoaiPhong.Rows)
                {
                    LoaiPhong lp = new LoaiPhong();
                    lp.MaLoaiPhong = dr[0].ToString();
                    lp.TenLoaiPhong = dr[1].ToString();
                    lp.DonGia = dr[2].ToString();
                    ds_LoaiPhong.Add(lp);
                }
            }
        }
        private void Load_ListViewLoaiPhong()
        {
            if(ds_LoaiPhong.Count>0)
            {
                lv_LoaiPhong.Items.Clear();
                foreach(LoaiPhong lp in ds_LoaiPhong)
                {
                    ListViewItem item = new ListViewItem(lp.MaLoaiPhong);
                    item.SubItems.Add(lp.TenLoaiPhong);
                    item.SubItems.Add(lp.DonGia);
                    lv_LoaiPhong.Items.Add(item);

                }
            }
        }
        private void LoadListView()
        {
            DataTable dt_Phong = dl.LoadPhong();
            if(dt_Phong.Rows.Count>0 && dt_Phong!=null)
            {
                foreach(DataRow dr in dt_Phong.Rows)
                {
                    Phong p = new Phong();
                    p.MaPhong = int.Parse(dr[0].ToString());
                    p.TenPhong = dr[1].ToString();
                    p.TrangThai = int.Parse(dr[2].ToString());
                    p.MaLoaiPhong = int.Parse(dr[3].ToString());
                    ds_Phong.Add(p);
                }
            }
        }
        private void LoadCbbLoaiPhong()
        {
            DataSet ds_LoaiPhong = dl.LoadLoaiPhong();
            cbbLoaiPhong.DataSource = ds_LoaiPhong.Tables["LOAIPHONG"];
            cbbLoaiPhong.DisplayMember = "TENLOAIPHONG";
            cbbLoaiPhong.ValueMember = "MALOAIPHONG";
        }
        private void LoadListView_Phong()
        {
            if(ds_Phong.Count>0)
            {
                lv.Items.Clear();
                foreach(Phong p in ds_Phong)
                {
                    ListViewItem item = new ListViewItem(p.MaPhong.ToString());
                    item.SubItems.Add(p.TenPhong);
                    item.SubItems.Add(p.TrangThai.ToString());
                    item.SubItems.Add(p.MaLoaiPhong.ToString());
                    lv.Items.Add(item);
                }
            }
        }

        private void lv_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(lv.SelectedItems.Count==0)
            {
                return;
            }
            else
            {
                ListViewItem item = lv.SelectedItems[0];
                txtMaPhong.Text = item.SubItems[0].Text;
                txtTenPhong.Text = item.SubItems[1].Text;
                txtTrangThai.Text = item.SubItems[2].Text;
                cbbLoaiPhong.SelectedValue = item.SubItems[3].Text;
            }
        }

        private void frmQLPhong_Load(object sender, EventArgs e)
        {
            LoadListView();
            LoadCbbLoaiPhong();
            LoadListView_Phong();

            LoadLoaiPhong();
            Load_ListViewLoaiPhong();
        }

        private void lv_LoaiPhong_SelectedIndexChanged(object sender, EventArgs e)
        {
            if(lv_LoaiPhong.SelectedItems.Count == 0)
            {
                return;
            }
            else
            {
                ListViewItem item = lv_LoaiPhong.SelectedItems[0];
                txtMaLoaiPhong.Text = item.SubItems[0].Text;
                txtTenLoaiPhong.Text = item.SubItems[1].Text;
                txtDonGia.Text = item.SubItems[2].Text;
            }
        }
    }
}
