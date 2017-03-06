/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tnaneen.servletproject;

import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.imageio.ImageIO;

/**
 *
 * @author ehabm
 */
public class DatabaseHandler {

    private final String URL = "jdbc:mysql://localhost/ecommerce";
    private final String userName = "root";
    private final String password = "";
    private Connection conn;
    private PreparedStatement pst;
    private ResultSet rs;

    private void openConnection() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(URL, userName, password);
        } catch (ClassNotFoundException ex) {
            ex.printStackTrace();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    private void closeConnection() {
        try {
            pst.close();
            //rs.close();
            conn.close();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }
    
    
    ///////=1=/////// Ramadan :: PRODUCTS Processing functionalities ////////////////////////
    
    
    ///// ---- insert new product 
    
    public boolean insertNewProduct( Product product ) {
        
            try {
                openConnection();
       
                pst = conn.prepareStatement("INSERT INTO ecommerce.product (id,name, price, available, category,description, image) VALUES (?,?,?,?,?,?,?)");
                pst.setInt(1, product.getId());
                pst.setString(2, product.getName());
                pst.setInt(3, product.getPrice());
                pst.setInt(4, product.getAvailable());
                pst.setString(5, product.getCategory());
                pst.setString(6, product.getDescription());
                pst.setString(7, product.getImage());
             
                int queryResult = pst.executeUpdate();
                
                if (queryResult != 0)
                {
                    System.out.println("New Product Added Successfully");
                    return true;
                }
              
            } catch (SQLException ex) {
                
                System.err.println("ERROR:: DatabaseHandler.insertNewProduct()" + ex.toString());
                
            } finally {
                closeConnection();
            }
            
            System.out.println("New Product is NOT added!");
            return false;
              
    }


     ///// ---- remove a product 
    public boolean removeProduct( Product product ) {
       
            try {
                openConnection();
       
                pst = conn.prepareStatement("DELETE from ecommerce.product WHERE id = ?");
                System.out.println("&&&&&&&&>>> " +  product.getId());
                pst.setInt(1, product.getId());
                
                int queryResult = pst.executeUpdate();
                
                if (queryResult != 0)
                {
                    System.out.println(" Product deleted  Successfully");
                    return true;
                }
              
            } catch (SQLException ex) {
                
                System.err.println("ERROR:: DatabaseHandler.deleteProduct()" + ex.toString());
                
            } finally {
                closeConnection();
            }
            
            System.out.println("New Product is NOT deleted!");
            return false;
              
    }

    
     ///// ---- update a product 
    public boolean updateProduct( Product product ) {
       
            try {
                openConnection();
       
                pst = conn.prepareStatement("UPDATE ecommerce.product SET name=? , price=? , available=? , category=? , description=? ,image=?  WHERE id = ?");
                pst.setString(1, product.getName());
                pst.setInt(2, product.getPrice());
                pst.setInt(3, product.getAvailable());
                pst.setString(4, product.getCategory());
                pst.setString(5, product.getDescription());
                pst.setInt(7, product.getId());
                pst.setString(6, product.getImage());
                
                int queryResult = pst.executeUpdate();
                
                if (queryResult != 0)
                {
                    System.out.println(" Product Updated  Successfully");
                    return true;
                }
              
            } catch (SQLException ex) {
                
                System.err.println("ERROR:: DatabaseHandler.updateProduct()" + ex.toString());
                
            } finally {
                closeConnection();
            }
            
            System.out.println("New Product is NOT updated!");
            return false;
              
    }
 
    
    
    ///// ---- get a certain product 
    public Product getProduct( int id ) {
       
            Product product = null;
        
            try {
                openConnection();
       
                pst = conn.prepareStatement("SELECT * FROM ecommerce.product WHERE id = ?");
                pst.setInt(1, id);
                
                rs = pst.executeQuery();
                
                while (rs.next()) 
                {    
                    product = new Product(id, rs.getString("name"),rs.getInt("price") , rs.getInt("available"), rs.getString("category"), rs.getString("description"), rs.getString("image"));
                }
              
            } catch (SQLException ex) {
                
                System.err.println("ERROR:: DatabaseHandler.getProduct()" + ex.toString());
                ex.printStackTrace();
                
            } finally {
                closeConnection();
            }
            
           
            return product;
              
    }
 
    
     ////////// Get All products
    public ArrayList<Product> getAllProducts (String category)
    {
        ArrayList<Product> products = new ArrayList();
        int sum =0;
        try {
            openConnection();
            
            pst = conn.prepareStatement("select * from ecommerce.product WHERE category = ?");
            pst.setString(1,category);
             
            rs = pst.executeQuery();
           System.out.println("====------------===" );
            while(rs.next())
             {
                 System.out.println("=//////////////======");
                 sum++;
                 //////////////// check which column contains my Email to get friends data
                  Product product = new Product(rs.getInt("id"), rs.getString("name"),rs.getInt("price") , rs.getInt("available"), rs.getString("category"), rs.getString("description"), rs.getString("image"));
                  products.add(product);
                  System.out.println("=======" + product.getId());
             }
             System.out.println("sum: "+sum);
        } catch (SQLException ex) {
            
            System.out.println("ERROR :: DatabaseHandler.getAllproducts()" + ex.toString());
            
        }
          
        return products;
    }
    
    
    
    /////////////////// end of PRODUCTS ///////////////////////////
    
  ///////=2=/////// Ramadan :: SHOPPING CARTS Processing functionalities ////////////////////////
    
    
    ///////// NOTE ::: I have added a new bean called CartItem 
    ///////////////////// to Simplify sending params to/from functions
    
       
    ///// ---- insert new cart item 
    public boolean insertNewCartItem( CartItem cartItem ) {
       
            try {
                openConnection();
       
                pst = conn.prepareStatement("INSERT INTO ecommerce.shoppingcart (userid,productid,quantity,productname,productprice,bought) VALUES (?, ?, ?, ?, ?, ?)");
                pst.setInt(1, cartItem.getUserId());
                pst.setInt(2, cartItem.getProductId());
                pst.setInt(3, cartItem.getQuantity());
                pst.setInt(6, cartItem.getBought());
                pst.setString(4, cartItem.getProductName());
                pst.setInt(5, cartItem.getProductPrice());
                //pst.setString(7, cartItem.getProductName());
               
             
                int queryResult = pst.executeUpdate();
                
                if (queryResult != 0)
                {
                    System.out.println("New cartItem Added Successfully");
                    return true;
                }
              
            } catch (SQLException ex) {
                
                System.err.println("ERROR:: DatabaseHandler.insertNewCartItem()" + ex.toString());
                
            } finally {
                closeConnection();
            }
            
            System.out.println("cartItem is NOT added!");
            return false;
              
    }


     
     ////////// Get All products
    ///////// bought = 1 for retrieving user history
    ///////// bought = 0 for retrieving stored shopping cart
    public ArrayList<CartItem> getAllCartItems (int userId, int bought)
    {
        ArrayList<CartItem> cartItems = new ArrayList();
        int sum =0;
        try {
            openConnection();
            
            pst = conn.prepareStatement("select * from ecommerce.shoppingcart WHERE userid=? and bought=?");
            pst.setInt(1,userId);
            pst.setInt(2,bought);
             
             
            rs = pst.executeQuery();
           
            while(rs.next())
             {
                 sum++;
                 //////////////// check which column contains my Email to get friends data
                  CartItem cartItem = new CartItem(rs.getInt("userid"), rs.getInt("productid"),rs.getInt("quantity") , rs.getInt("bought"),rs.getString("productName"),rs.getInt("productPrice"),rs.getString("productimage"));
                  cartItems.add(cartItem);
               
             }
             System.out.println("sum: "+sum);
        } catch (SQLException ex) {
            
            System.out.println("ERROR :: DatabaseHandler.getAllcartItems()" + ex.toString());
            
        }
          
        return cartItems;
    }
    
   
    
     ///// ---- remove a cartItem 
    public boolean removeCartItem( CartItem cartItem ) {
           try {
                openConnection();
       
                pst = conn.prepareStatement("DELETE from ecommerce.shoppingcart WHERE userid=? and productid = ? and bought=0");
                pst.setInt(1, cartItem.getUserId());
                pst.setInt(2, cartItem.getProductId());
                
                int queryResult = pst.executeUpdate();
                
                if (queryResult != 0)
                {
                    System.out.println(" CartItem  deleted  Successfully");
                    return true;
                }
              
            } catch (SQLException ex) {
                
                System.err.println("ERROR:: DatabaseHandler.removeCartItem()" + ex.toString());
                
            } finally {
                closeConnection();
            }
            
            System.out.println("CartItem is NOT deleted!");
            return false;
               
    }

    ////////////////////// End of -- CART -- processing ////////////////////////
    ///////////////////// start user processing////////////
    public boolean registerUser(User user) {
        try {
            openConnection();
            pst = conn.prepareStatement("INSERT INTO ecommerce.USER (EMAIL,PASSWORD,USERNAME,ADDRESS) VALUES(?,?,?,?)");
            pst.setString(1, user.getEmail());
            pst.setString(2, user.getPassword());
            pst.setString(3, user.getUserName());
            pst.setString(4, user.getAddress());
            //pst.setDate(5, (Date) user.getBirthday());
            System.out.println("7alawa");
            pst.executeUpdate();
            System.out.println("not t7alawa");
            return true;
        } catch (SQLException ex) {
            ex.printStackTrace();
            System.out.println("problem is here at catch");
            return false;
        } finally {
            closeConnection();
        }
    }

    public User getUser(String email, String pass) {
        try {
            openConnection();
            pst = conn.prepareStatement("SELECT * FROM ecommerce.USER WHERE EMAIL=? AND PASSWORD=?");
            pst.setString(1, email);
            pst.setString(2, pass);
            rs = pst.executeQuery();
            User user = null;
            if (rs.next()) {
                user = new User();
                user.setEmail(rs.getString("email"));
                user.setId(rs.getInt("id"));
                user.setAddress(rs.getString("address"));
                user.setPassword(rs.getString("password"));
                user.setUserName(rs.getString("username"));
                user.setBirthday(rs.getDate("birthday"));
                user.setCreditLimit(rs.getInt("creditLimit"));
                user.setIsAdmin(rs.getInt("isAdmin"));
            }
            return user;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        } finally {
            closeConnection();
        }

    }

    public ArrayList<User> getAllUsers() {
        try {
            ArrayList<User> users = new ArrayList<>();
            openConnection();
            pst = conn.prepareStatement("SELECT * FROM ecommerce.USER");
            rs = pst.executeQuery();
            User user = null;
            while (rs.next()) {
                user = new User();
                user.setEmail(rs.getString("email"));
                user.setId(rs.getInt("id"));
                user.setAddress(rs.getString("address"));
                user.setPassword(rs.getString("password"));
                user.setUserName(rs.getString("username"));
                user.setBirthday(rs.getDate("birthday"));
                user.setCreditLimit(rs.getInt("creditLimit"));
                user.setIsAdmin(rs.getInt("isAdmin"));
                users.add(user);
            }
            return users;
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        } finally {
            closeConnection();
        }

    }

    public void updateUser(User user) {
        try {
            openConnection();
            pst = conn.prepareStatement("UPDATE ecommerce.USER SET PASSWORD=?,ADDRESS=?,USERNAME=? WHERE EMAIL=?");
            pst.setString(1, user.getPassword());
            pst.setString(2, user.getAddress());
            pst.setString(3, user.getUserName());
            //pst.setDate(4, (Date) user.getBirthday());
            pst.setString(4, user.getEmail());
            pst.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection();
        }
    }

    public void addCredit(String email, int credit) {
        try {
            openConnection();
            System.out.println("db"+credit);
            pst = conn.prepareStatement("UPDATE ecommerce.USER SET CREDITLIMIT=? WHERE EMAIL=?");
            pst.setInt(1, credit);
            pst.setString(2, email);
            System.out.println(pst.executeUpdate());
        } catch (SQLException ex) {
            ex.printStackTrace();
        } finally {
            closeConnection();
        }
    }
    ///////////////////////////////// end of user processing///////////////////
    ////////////////////////////////// start of cash codes processing ///////////
    public void addCash(String code,int cash)
    {
        try {
            openConnection();
            pst= conn.prepareStatement("INSERT INTO ecommerce.CASHCODES VALUES(?,?)");
            pst.setString(1, code);
            pst.setInt(2, cash);
            pst.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        finally{
            closeConnection();
        }
    }
    
    public void removeCash(String code)
    {
        try {
            openConnection();
            pst=conn.prepareStatement("DELETE FROM ecommerce.CASHCODES WHERE CODE=?");
            pst.setString(1, code);
            pst.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        finally{
            closeConnection();
        }
    }
    
    public double getCash(String code)
    {
        try {
            openConnection();
            pst=conn.prepareStatement("SELECT * FROM ecommerce.CASHCODES WHERE CODE=?");
            pst.setString(1, code);
            rs=pst.executeQuery();
            if(rs.next())
            {
                return rs.getDouble("AMTOFMONEY");
            }
            else
            {
                return 0;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
            return 0;
        }
        
    }
    
    public ArrayList<CashCode> getAllCash(){
       try {
            ArrayList<CashCode> cashList = new ArrayList<>();
            openConnection();
            pst = conn.prepareStatement("SELECT * FROM CASHCODES");
            rs = pst.executeQuery();
            CashCode cash;
            while (rs.next()) {
                cash = new CashCode();
                cash.setCode(rs.getString("code"));
                cash.setCash(rs.getInt("amtOfMoney"));
                cashList.add(cash);
            }
            return cashList;
            
        } catch (SQLException ex) {
            ex.printStackTrace();
            return null;
        } finally {
            closeConnection();
        } 
    }
    
    ///////////////////////////// end of cash code processing ////////////////////
    //////////////////////////// updates in DB 6-3-2017
    
    public int getMaxId() {
        int id = -1;
        try {
            openConnection();
            pst = conn.prepareStatement("SELECT max(id) FROM ecommerce.product");
           
            rs = pst.executeQuery();
            User user = null;
            while (rs.next()) {
                id = rs.getInt(1);
            }
           
        } catch (SQLException ex) {
            ex.printStackTrace();
            
        } finally {
            closeConnection();
        }
       return  id;
    }
    
    ///////////////////////
}
