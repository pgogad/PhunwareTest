package servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet(name = "PhunwareForecastServlet", urlPatterns =
{ "/forecast" })
public class PhunwareForecastServlet extends HttpServlet
{
	private static final long serialVersionUID = -6810411812370335003L;
	
	protected void doGet( HttpServletRequest req, HttpServletResponse resp ) throws ServletException, IOException
	{
		getForecastInfo( req, resp );
	}

	protected void doPost( HttpServletRequest req, HttpServletResponse resp ) throws ServletException, IOException
	{
		getForecastInfo( req, resp );
	}

	private void getForecastInfo( HttpServletRequest req, HttpServletResponse resp )
	{
	}

}
