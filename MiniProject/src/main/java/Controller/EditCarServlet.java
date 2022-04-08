package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Car;

/**
 * Servlet implementation class EditCarServlet
 */
@WebServlet("/editCarServlet")
public class EditCarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCarServlet() {
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
		String make = request.getParameter("make");
		String model = request.getParameter("model");
		String year = request.getParameter("year");
		String engine = request.getParameter("engine");
		String color = request.getParameter("color");
		String transmission = request.getParameter("transmission");
		String fuelType = request.getParameter("fuelType");
		String drivetrain = request.getParameter("drivetrain");
		String type = request.getParameter("type");
		String action = request.getParameter("action");
		Integer id = Integer.parseInt(request.getParameter("id"));
		if(action.equals("Logout")) {
			getServletContext().getRequestDispatcher("/home.html").forward(request, response);
		}
		else if(action.equals("Home")) {
			request.setAttribute("id", id);
			getServletContext().getRequestDispatcher("/admin-home.jsp").forward(request, response);
		}
		CarHelper ch = new CarHelper();
		Integer carId = Integer.parseInt(request.getParameter("carId"));
		Car toEdit = ch.searchForCarById(carId);
		try {
			Integer mpg = Integer.parseInt(request.getParameter("mpg"));
			Double price = Double.parseDouble(request.getParameter("price"));
			Integer safteyRating = Integer.parseInt(request.getParameter("safteyRating"));
			toEdit.setMpg(mpg);
			toEdit.setPrice(price);
			toEdit.setSafetyRating(safteyRating);
		}catch(NumberFormatException e) {}
		if(make != "") {
			toEdit.setMake(make);
		}
		if(color != "") {
			toEdit.setColor(color);
		}
		if(model != "") {
			toEdit.setModel(model);
		}
		if(year != "") {
			toEdit.setYear(year);
		}
		if(engine != "") {
			toEdit.setEngine(engine);
		}
		if(transmission != "") {
			toEdit.setTransmission(transmission);
		}
		if(fuelType != "") {
			toEdit.setFuelType(fuelType);
		}
		if(drivetrain != "") {
			toEdit.setDrivetrain(drivetrain);
		}
		if(type != "") {
			toEdit.setType(type);
		}
		ch.updateCar(toEdit);
		request.setAttribute("id", id);
		getServletContext().getRequestDispatcher("/admin-home.jsp").forward(request, response);
	}
}
