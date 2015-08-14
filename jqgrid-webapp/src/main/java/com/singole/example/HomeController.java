package com.singole.example;

import java.util.ArrayList;
import java.util.logging.Logger;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.singole.example.dataobj.Employee;

/**
 * Class HomeController to provide the System Properties
 * 
 * 
 * Test URL : http://localhost:7001/jqgridexample/views/web/getemployees
 * 
 * @author singole
 */
@Controller
public class HomeController {

	private static final String CLASS_NAME = HomeController.class.getName();
	private static final Logger LOGGER = Logger.getLogger(CLASS_NAME);
	
	/**
	 * Default Constructor.
	 */
	public HomeController() {
		super();
	}
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public ModelAndView getIndex(ModelAndView model, HttpServletRequest req) {		
		return new ModelAndView("index");	
	}
	
	@RequestMapping(value = "/web/getemployees", method = RequestMethod.GET)
	public @ResponseBody
	ArrayList<Employee> getEmployees(HttpServletRequest request) {

		final ArrayList<Employee> employees = getMockEmployees();
				
		return employees;
	}

	private  ArrayList<Employee> getMockEmployees(){
		
		ArrayList<Employee> employees = new ArrayList<Employee>();
		
		employees.add(new Employee(100, "John", "Oliver", "123 Hollywood Blvd, LA", "4572312222"));		
		employees.add(new Employee(101, "Barack", "Obama", "001 White House, DC", "1010100101"));
		employees.add(new Employee(102, "Tom", "Cruise", "333 Sunset Blvd, LA", "8272828222"));
		employees.add(new Employee(103, "Ed", "Sheeran", "6377 Kings Drive, London", "9298292222"));
		
		return employees;
	}
}