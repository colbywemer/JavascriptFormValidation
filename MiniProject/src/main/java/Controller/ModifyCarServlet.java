package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Car;

/**
 * Servlet implementation class ModifyCarServlet
 */
@WebServlet("/modifyCarServlet")
public class ModifyCarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModifyCarServlet() {
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
		Integer id = Integer.parseInt(request.getParameter("id"));
		CarHelper ch = new CarHelper();
		if(action.equals("Logout")) {
			getServletContext().getRequestDispatcher("/home.html").forward(request, response);
		}
		else if(action.equals("Home")) {
			request.setAttribute("id", id);
			getServletContext().getRequestDispatcher("/admin-home.jsp").forward(request, response);
		}
		else if(action.equals("edit")) {
			Integer carId = Integer.parseInt(request.getParameter("carId"));
			request.setAttribute("id", id);
			request.setAttribute("car", ch.searchForCarById(carId));
			getServletContext().getRequestDispatcher("/edit-car.jsp").forward(request, response);
		}
		else if(action.equals("delete")) {
			Integer carId = Integer.parseInt(request.getParameter("carId"));
			Car toDelete = ch.searchForCarById(carId);
			if(toDelete.getOrdered() == false) {
				ch.deleteCar(toDelete);
			}
				request.setAttribute("id", id);
				request.setAttribute("allCars", ch.showAllCars());
				getServletContext().getRequestDispatcher("/modify-listings.jsp").forward(request, response);
		}
	}

}
