   M S B A M L   `   `   `  ����?  ;Crud, Version=1.0.0.0, Culture=neutral, PublicKeyToken=nullclr-namespace:CrudCrud  5   	       Crud.MainWindow   5   	   R NWindowsBase, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35W SPresentationCore, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35D 9http://schemas.microsoft.com/winfx/2006/xaml/presentation    5   	   R NSystem.Xaml, Version=4.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5   	   @d2http://schemas.microsoft.com/expression/blend/2008     5   	   Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5   	   $localclr-namespace:Crud     5   	   -   5          � Title$  ProductsWindow��5   	   $	��280��6    $	��800��6-    � Icon$ icon.ico��6P    � 	Resources 5	         orderProductTbViewSource  ordersTbViewSource  productTbViewSource  DeleteProduct �� Text  UpdateProduct  
AddProduct  CancelProduct  	NavButton �� 
TargetType �� BasedOn �� Property �� Value 	 Label %	 !productTbOrderProductTbViewSource �� Source	 �� Source��%  &	        &	      &	 &     &	 9     &	 Y     &	 y     &	 �     &	 �     &	 �    &		 w    7  �� 5
   
   6   �� 5   
   6   �� 5   
   6   �� 5   
   $ Delete��60   �� 5   
   $ Update��60   �� 5   
   $	 Add��6-   �� 5   
   $ Cancel��60   �� 5   
   " ��6"    6?   Z� .�5      ��  � ��$ 24(�6)   �� 5       � ��$ Segoe UI Symbol)�6+   �� 5       � ��$ 2,2,2,0q�6'   �� 5       � ��$ 40��6&   �� 5       � ��$
 auto��6'   5      �� 5   
   " ��6    6:   Z� .�5      ��  � ��$
 Left=�64   �� 5       � ��$ Center=�62   �� 5       � ��$ 3q�6'   �� 5       � ��$ 23��6'   5      �� 5   
    6I   �� *OrderProductTb+8	   5      
 J� CommandBindings
 5       )  #System.Windows.Input.CommandBinding  5!   
   -   5           Command# [ 5!      6B     5"   
   -   5        # [ 5"      6B     5#   
   -   5        # [ 5#      6?     5$   
   -   5        # [ 5$      6B   .��5&      � .+�5'   
   �  � DataContext# [ 6    � RowDefinitions 5(   
   �� 5)      $
��auto �6   �� 5*      $
��auto �6   �� 5+      $��* �6   .+�5D   
   � -   5         �Name$ newProductGrid��5D      .+�5E   
   �� $��PRODUCT ID:��6   $��Center=�6&   $
��Left=�6J   $��	22,32,0,0q�6e   $��0��6x   $	��Top=�6�   $	��110��6�   #��[ 6�    J� Effect 5F      3  -System.Windows.Media.Effects.DropShadowEffect  5G      5I      �� 5J      $��PRODUCT NAME:��6   $��Center=�60   $
��Left=�6T   $��	22,63,0,0q�6o   $��1��6�   $	��Top=�6�   $	��110��6�    5K        5L      5N      �� 5O      $��BRAND:��6   $��Center=�6)   $
��Left=�6M   $��	22,94,0,0q�6h   $��2��6{   $	��Top=�6�   $	��110��6�   4  .System.Windows.Automation.AutomationProperties   IsOffscreenBehavior$ FromClip=�6�    J� RenderTransformOrigin$ 0.5,0.5&�6�    5P        5Q      5S      �� 5T      $��	CATEGORY:��6   $��Center=�6,   $
��Left=�6P   $��
22,125,0,0q�6k   $��3��6   $	��Top=�6�   $	��110��6�    5U        5V      5X      �� 5Y      $��PRICE:��6   $��Center=�6)   $
��Left=�6M   $��
22,156,0,0q�6h   $��4��6|   $	��Top=�6�   $	��110��6�    5Z        5[      5]      �� 5^      -   5         ��Name$ add_productId��5^      $
��Left=�61   $��23��6L   $��
183,35,0,0q�6X   $��0��6l    �� TextWrapping$
 Wrap=�6y   $�� ��6�   $	��Top=�6�   $	��120��6�   �� 5_   
   -   5        $ add_productName��5_      $
��Left=�6+   $��23��6F   $��
183,66,0,0q�6R   $��1��6f   $
 Wrap=�6s   $�� ��6�   $	��Top=�6�   $	��120��6�   �� 5`   
   -	   5        $ add_productBrand��5`      $
��Left=�6,   $��23��6G   $��
183,98,0,0q�6S   $��2��6g   $
 Wrap=�6t   $�� ��6�   $	��Top=�6�   $	��120��6�   �� 5a   
   -
   5        $ add_productCategory��5a      $
��Left=�6/   $��23��6J   $��183,128,0,0q�6V   $��3��6k   $
 Wrap=�6x   $�� ��6�   $	��Top=�6�   $	��120��6�   �� 5b   
   -   5        $ add_productPrice��5b      $
��Left=�6,   $��23��6G   $��183,159,0,0q�6S   $��4��6h   $
 Wrap=�6u   $�� ��6�   $	��Top=�6�   $	��120��6�   �� 5c   
   $��Add product��6   $
��Left=�6(   $	��179��6C   $��	21,10,0,0q�6P   $	��Top=�6c   $	��322��6{   �� 5d   
    �� Orientation$ 
Horizontal=�6   $��21,194,434,0q�6.   $��36��6D   $	��Top=�6P   
������ # [ 6�   $��2��6�   .+�5e      �� -   5         ��Name$ btnAddProduct��5e      $	��Add��6,   #��[ 6:   $��11(�6`   $��80��6n   #��[ 6y   6�   �� 5f      -   5        $ 	btnUpdate��5f      $��Update��6(   #��[ 69   $��11(�6b   $��80��6p   #��[ 6{   6�   �� 5g      -   5        $ 	btnCancel��5g      $��Cancel��6(   #��[ 69   $��11(�6b   $��80��6p   #��[ 6{   �� 5h      -   5        $ btnDeleteProduct��5h      $��Delete��6/   #��[ 6@   $��11(�6i   $��80��6w   #��[ 6�   6�   5i      5j      &   System.Windows.Controls.DataGrid  5k   
   -   5          Name$ productTbDataGrid��5k         AutoGenerateColumns .     EnableRowVirtualization . $��364,32,28,0q�6�      RowDetailsVisibilityMode$ VisibleWhenSelected=�6�   ��6i   �� #	 [    Columns 5l      0  *System.Windows.Controls.DataGridTextColumn  5m      -   5        productIDColumn��,  &System.Windows.Controls.DataGridColumn   Header$ 
Product ID��5m   `      Width5  /System.Windows.Controls.DataGridLengthConverter$ SizeToHeader 6t   1  +System.Windows.Controls.DataGridBoundColumn   Binding 6B   �� *	ProductID+6t     5n      -   5        productNameColumn��$ Product Name��5n   d   $	 150 6z    6D   �� *ProductName+6z     5v      -   5        brandColumn��$ Brand��5v   X   $ 60 6g    6>   �� *Brand+6g     5w      -   5        categoryColumn��$ Category��5w   ^   $ 70 6p    6A   �� *
Category+6p     5x      -   5        priceColumn��$ Price��5x   X   $ SizeToHeader 6g    6>   �� *Price+6g   5z      5{      5|      5}      