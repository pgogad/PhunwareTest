package servlet;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "PhunwareWeatherServlet", urlPatterns =
{ "/weather" })
public class PhunwareWeatherServlet extends HttpServlet
{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doGet( HttpServletRequest req, HttpServletResponse resp ) throws ServletException, IOException
	{
		getWeatherInfo( req, resp );
	}

	protected void doPost( HttpServletRequest req, HttpServletResponse resp ) throws ServletException, IOException
	{
		getWeatherInfo( req, resp );
	}

	private void getWeatherInfo( HttpServletRequest req, HttpServletResponse resp ) throws IOException, MalformedURLException, ProtocolException
	{
		ServletOutputStream out = resp.getOutputStream( );

		String city = req.getParameter( "city" );
		URL url = new URL( "http://api.openweathermap.org/data/2.5/weather?q=" + city + "&units=metric");

		HttpURLConnection conn = (HttpURLConnection) url.openConnection( );
		conn.setRequestMethod( "GET" );
		conn.setRequestProperty( "Accept", "application/json" );
		if ( conn.getResponseCode( ) != 200 )
		{
			throw new RuntimeException( "Failed : HTTP error code : " + conn.getResponseCode( ) );
		}
		BufferedReader br = new BufferedReader( new InputStreamReader( (conn.getInputStream( )) ) );
		StringBuffer buff = new StringBuffer( );
		String output;
		while( (output = br.readLine( )) != null )
		{
			buff.append( output );
			System.out.println( output );
		}

		out.write( buff.toString( ).getBytes( ) );
		out.flush( );
		out.close( );
		conn.disconnect( );
	}
}
