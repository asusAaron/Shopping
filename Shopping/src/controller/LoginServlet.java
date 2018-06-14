package controller;

import model.User;
import model.UserManage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class loginservlet
 */
@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();

		User user = new User();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		user.setName(username);
		user.setPassword(password);
		System.out.println(username);
		System.out.println(password);
		
		UserManage login = new UserManage();
		if (login.userLogin(user)) {
			session.setAttribute("user", user);
			response.sendRedirect(request.getContextPath()+"/homepage.jsp");
		} else {
			request.getSession().setAttribute("message", "�˺Ż��������");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		}

		out.flush();
		out.close();
	}

}
