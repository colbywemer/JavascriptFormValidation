package Controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Car;

/**
 * Servlet implementation class CreateListingServlet
 */
@WebServlet("/createListingServlet")
public class CreateListingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreateListingServlet() {
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
		Integer id = Integer.parseInt(request.getParameter("id"));
		String action = request.getParameter("action");
		request.setAttribute("id", id);
		if(action.equals("Logout")) {
			getServletContext().getRequestDispatcher("/home.html").forward(request, response);
		}
		else if(action.equals("Home")) {
			getServletContext().getRequestDispatcher("/admin-home.jsp").forward(request, response);
		}
		else {
			try {
				Integer mpg = Integer.parseInt(request.getParameter("mpg"));
				Double price = Double.parseDouble(request.getParameter("price"));
				Integer safteyRating = Integer.parseInt(request.getParameter("safteyRating"));
				if(!make.equals("") && !model.equals("") && !year.equals("") && !engine.equals("") && !color.equals("") && !transmission.equals("") && !fuelType.equals("") && !drivetrain.equals("") && !type.equals("")) {
					CarHelper ch = new CarHelper();
					Car toAdd = new Car(safteyRating, mpg, price, type, make, model, year, color, engine, transmission, fuelType, drivetrain, false);
					ch.insertCar(toAdd);
					getServletContext().getRequestDispatcher("/admin-home.jsp").forward(request, response);
				}
				else {
					request.setAttribute("make", make);
					request.setAttribute("model", model);
					request.setAttribute("year", year);
					request.setAttribute("mpg", mpg);
					request.setAttribute("engine", engine);
					request.setAttribute("color", color);
					request.setAttribute("price", price);
					request.setAttribute("safteyRating", safteyRating);
					request.setAttribute("transmission", transmission);
					request.setAttribute("fuelType", fuelType);
					request.setAttribute("drivetrain", drivetrain);
					request.setAttribute("type", type);
					request.setAttribute("message", "All fields must not be empty!");
					getServletContext().getRequestDispatcher("/create-listing.jsp").forward(request, response);
				}
			}catch(NumberFormatException e) {
				request.setAttribute("make", make);
				request.setAttribute("model", model);
				request.setAttribute("year", year);
				request.setAttribute("engine", engine);
				request.setAttribute("color", color);
				request.setAttribute("transmission", transmission);
				request.setAttribute("fuelType", fuelType);
				request.setAttribute("drivetrain", drivetrain);
				request.setAttribute("type", type);
				request.setAttribute("message", "All fields must not be empty!");
				getServletContext().getRequestDispatcher("/create-listing.jsp").forward(request, response);
			
			
			}
		}
		
		
		
	}

}
