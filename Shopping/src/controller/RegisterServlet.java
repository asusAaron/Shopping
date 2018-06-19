package controller;

import model.User;
import model.UserManage;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class registerservlet
 */
@WebServlet("/registerservlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		String name=request.getParameter("username");
		String password=request.getParameter("password");
		
		User user=new User();
		user.setName(name);
		user.setPassword(password);
		UserManage manage=new UserManage();
		if(manage.addUser(user)==1){
			request.getSession().setAttribute("message", "注册成功");
			response.sendRedirect("/view/login.jsp");

		}else{
			request.setAttribute("message", "注册失败");
			request.getRequestDispatcher("/view/register.jsp").forward(request, response);
		}
	}

}
