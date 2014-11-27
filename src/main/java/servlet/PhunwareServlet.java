package servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLConnection;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "PhunwareWeatherServlet", urlPatterns =
{ "/hello" })
public class PhunwareServlet extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@SuppressWarnings("null")
	protected void doGet( HttpServletRequest req, HttpServletResponse resp ) throws ServletException, IOException
	{
		ServletOutputStream out = resp.getOutputStream( );
		URL url = new URL( "http://api.openweathermap.org/data/2.5/weather?id=2172797" );
		HttpURLConnection conn = (HttpURLConnection) url.openConnection( );
		conn.setRequestMethod( "GET" );
		conn.setRequestProperty( "Accept", "application/json" );
		if ( conn.getResponseCode( ) != 200 )
		{
			throw new RuntimeException( "Failed : HTTP error code : " + conn.getResponseCode( ) );
		}
		BufferedReader br = new BufferedReader(new InputStreamReader((conn.getInputStream())));
		String output;
		System.out.println("Output from Server .... \n");
		while ((output = br.readLine()) != null) 
		{
			System.out.println(output);
		}
 
		conn.disconnect();
		//out.write( "hello heroku".getBytes( ) );
		out.write( output.getBytes( ) );
		out.flush( );
		out.close( );
	}
}
