package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Car;
import Model.Order;

/**
 * Servlet implementation class DeleteOrderServlet
 */
@WebServlet("/deleteOrderServlet")
public class DeleteOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		if(action.equals("Logout")) {
			getServletContext().getRequestDispatcher("/home.html").forward(request, response);
		}
		else if(action.equals("Home")) {
			Integer id = Integer.parseInt(request.getParameter("id"));
			request.setAttribute("id", id);
			getServletContext().getRequestDispatcher("/admin-home.jsp").forward(request, response);
		}
		else {
			Integer id = Integer.parseInt(request.getParameter("id"));
			request.setAttribute("id", id);
			OrderHelper oh = new OrderHelper();
			Integer orderId = Integer.parseInt(request.getParameter("orderId"));
			Order toDelete = oh.searchForOrderById(orderId);
			oh.deleteOrder(toDelete);
			CarHelper ch = new CarHelper();
			Car update = ch.searchForCarById(toDelete.getCar().getCarId());
			update.setOrdered(false);
			ch.updateCar(update);
			request.setAttribute("allOrders", oh.getOrders());
			getServletContext().getRequestDispatcher("/view-orders.jsp").forward(request, response);
		}
		
		
	}

}
