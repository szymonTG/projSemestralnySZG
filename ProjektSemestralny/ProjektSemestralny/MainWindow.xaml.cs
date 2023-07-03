using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Data;
using System.Collections.ObjectModel;

namespace Crud
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        crudDbEntities context = new crudDbEntities();
        CollectionViewSource productViewSource;
        //CollectionViewSource ordersViewSource;
        //CollectionViewSource productViewSource;
        //ProductTb NewProduct = new ProductTb();
        //ProductTb selectedProduct = new ProductTb();

        public MainWindow()
        {
            InitializeComponent();
            productViewSource = ((CollectionViewSource)(FindResource("productTbViewSource")));
            //orderProductViewSource = ((CollectionViewSource)(FindResource("orderProductTbViewSource")));
            //ordersViewSource = ((CollectionViewSource)(FindResource("ordersTbViewSource")));
            DataContext = this;

        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            context.ProductTb.Load();
            productViewSource.Source = context.ProductTb.Local;

        }
        private void DeleteProductHandler(object sender, System.EventArgs e)
        {
            //var productToDelete = (sender as FrameworkElement).Datacontextt as ProductTb;
            //context.ProductTb.Remove(productToDelete);
            //context.SaveChanges();

            //foreach(var prod in context.ProductTb)
            //{
            //   if(prod.ProductID == prod.ProductID)
            //    {
            //        add_productId.Items.Add($)
            //    }
            //}
        }
        private void UpdateProductHandler(object sender, System.EventArgs e)
        {
            //selectedProduct = (sender as FrameworkElement).Datacontextt as ProductTb;
            //productTbDataGrid.Datacontextt = selectedProduct;
            //ProductTb newProductTb = new ProductTb()
            //{
            //    Brand = add_productBrand.Text,
            //    Category = add_productCategory.Text,
            //    ProductID = int.Parse(add_productId.Text),
            //    ProductName = add_productName.Text,
            //    Price = decimal.Parse(add_productPrice.Text)
            //};
            //int len = context.CustomerTb.Local.Count();
            //int pos = len;
            //for(int i = 0; i<len; ++i)
            //{

            //}
        }
        private void AddProductHandler(object sender, System.EventArgs e)
        {
            //context.ProductTb.Add(NewProduct);
            //context.SaveChanges();
            //NewProduct = new ProductTb();
            //newProductGrid.Datacontextt = NewProduct;

        }
        private void CancelProductHandler(object sender, System.EventArgs e)
        {
            add_productId.Text = "";
            add_productName.Text = "";
            add_productBrand.Text = "";
            add_productCategory.Text = "";
            add_productPrice.Text = "";
        }
        //Add product to database 
        private void btnAddProduct_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                SqlConnection sqlCon1 = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB; Initial Catalog = crudDb; Integrated Security=true;");
                if (sqlCon1.State == ConnectionState.Closed)
                    sqlCon1.Open();
                string query = "INSERT INTO ProductTb(ProductID, ProductName, Brand, Category, Price) values('" + this.add_productId.Text + "','" + this.add_productName.Text + "','" + this.add_productBrand.Text + "','" + this.add_productCategory.Text + "','" + this.add_productPrice.Text + "');";
                SqlCommand sqlCmd1 = new SqlCommand(query, sqlCon1);
                SqlDataReader sqlDataReader1;
                sqlDataReader1 = sqlCmd1.ExecuteReader();
                MessageBox.Show("Product added to database");
                while (sqlDataReader1.Read())
                {
                }
                sqlCon1.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            productTbDataGrid.ItemsSource = null;
            context.ProductTb.Load();
            productTbDataGrid.ItemsSource = context.ProductTb.Local;
            //productTbDataGrid.UpdateLayout();
            //productTbDataGrid.Visibility = Visibility.Visible;
            //productViewSource.View.Refresh();
        }
        //Update product from Database
        private void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            SqlConnection sqlCon1 = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB; Initial Catalog=crudDb; Integrated Security=true;");
            try
            {
                if (sqlCon1.State == ConnectionState.Closed)
                    sqlCon1.Open();

                string query = "UPDATE ProductTb SET ProductID='" + this.add_productId.Text + "',ProductName='" + this.add_productName.Text + "',Brand='" + this.add_productBrand.Text + "',Category='" + this.add_productCategory.Text + "',Price='" + this.add_productPrice.Text + "' WHERE ProductID='" + this.add_productId.Text + "';";
                SqlCommand sqlCmd1 = new SqlCommand(query, sqlCon1);
                sqlCmd1.ExecuteNonQuery();

                MessageBox.Show("Product updated");

                sqlCon1.Close();

                // Odświeżanie danych w kontrolce productTbDataGrid
                LoadProductData(); // Twój kod do pobrania danych z bazy i przypisania ich do productTbDataGrid

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void LoadProductData()
        {
            SqlConnection sqlCon1 = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB; Initial Catalog=crudDb; Integrated Security=true;");
            try
            {
                if (sqlCon1.State == ConnectionState.Closed)
                    sqlCon1.Open();

                string query = "SELECT * FROM ProductTb";
                SqlCommand sqlCmd1 = new SqlCommand(query, sqlCon1);
                SqlDataAdapter dataAdapter = new SqlDataAdapter(sqlCmd1);
                DataTable dataTable = new DataTable();
                dataAdapter.Fill(dataTable);

                productTbDataGrid.ItemsSource = dataTable.DefaultView;

                sqlCon1.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        // Delete product from Database
        private void btnDeleteProduct_Click(object sender, RoutedEventArgs e)
        {
            if (productTbDataGrid.SelectedItem != null)
            {
                DataRowView selectedRow = (DataRowView)productTbDataGrid.SelectedItem;
                int productId = Convert.ToInt32(selectedRow["ProductID"]);

                SqlConnection sqlCon1 = new SqlConnection(@"Data Source=(localdb)\MSSQLLocalDB; Initial Catalog=crudDb; Integrated Security=true;");
                try
                {
                    if (sqlCon1.State == ConnectionState.Closed)
                        sqlCon1.Open();

                    string query = "DELETE FROM ProductTb WHERE ProductID = @ProductId";
                    SqlCommand sqlCmd1 = new SqlCommand(query, sqlCon1);
                    sqlCmd1.Parameters.AddWithValue("@ProductId", productId);
                    sqlCmd1.ExecuteNonQuery();

                    MessageBox.Show("Product deleted");

                    sqlCon1.Close();

                    // Odświeżanie danych w kontrolce productTbDataGrid
                    LoadProductData(); // Twój kod do pobrania danych z bazy i przypisania ich do productTbDataGrid
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
            else
            {
                MessageBox.Show("Select a product to delete");
            }
        }


        private void productTbDataGrid_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }
    }
}
