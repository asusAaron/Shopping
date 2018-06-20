package controller;

import model.Book;
import model.BookManage;
import model.User;
import model.UserManage;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/addBook")
public class AddServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        try {
            String bookId = request.getParameter("bookId");
            UserManage um = new UserManage();
            User user = (User)request.getSession().getAttribute("user");
            String userName = user.getName();
            boolean result = um.addBook(bookId,userName);
            request.setAttribute("addMessage", result ? "添加成功" : "商品已经存在于购物车中了哦");
            request.getRequestDispatcher("/book").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
    }
}

