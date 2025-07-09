package listners;

import java.util.ArrayList;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import models.Country;

@WebListener
public class ApplicationStartListner implements ServletContextListener {
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ArrayList<Country> countries = Country.getAllCountries();
        sce.getServletContext().setAttribute("countries", countries);
    }

    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        
    }
    
}
