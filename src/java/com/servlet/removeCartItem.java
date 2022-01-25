/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;

import com.bean.Cart;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author user
 */
@WebServlet(name = "removeCartItem", urlPatterns = {"/removeCartItem"})
public class removeCartItem extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            String id = request.getParameter("id");
			if (!id.isEmpty()) {
				ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");
				if (cart_list != null) {
                                                    
					for (Cart c : cart_list) {
                                                    if (cart_list.size()==1){
                                                            HttpSession session = request.getSession();
                                                            session.removeAttribute("cart-list");
                                                            break;
                                                    }
						if (c.getItemID().equals(id)) {
                                                    cart_list.remove(cart_list.indexOf(c));
							break;
						}
					}
				}
				response.sendRedirect("Cart.jsp");

			} else {
				response.sendRedirect("viewproduct.jsp");
			}
        }
    }

}
