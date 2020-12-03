package servlets;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;

public class ControllerServlet extends HttpServlet {



    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        double x = 0;
        double y = 0;
        double r = 0;

        RequestDispatcher invalidDataDispatcher = getServletContext().getRequestDispatcher("/invalidData.jsp");

        String xString = req.getParameter("xFinal");
        String yString = req.getParameter("yFinal");
        String rString = req.getParameter("r");



        if ((xString == null) || (yString == null) || (rString == null)) invalidDataDispatcher.forward(req,resp);

        try{
            x = Double.parseDouble(xString);
            y = Double.parseDouble(yString);
            r = Double.parseDouble(rString);
        } catch (Exception e) {invalidDataDispatcher.forward(req,resp);}

        Double[] rValues = new Double[] {1.0,1.5,2.0,2.5,3.0};

        if ((x<-2)||(x>2)||(!Arrays.asList(rValues).contains(r))||(y<=-5)||(y>=5)) invalidDataDispatcher.forward(req,resp);


        RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/AreaCheckServlet");

        requestDispatcher.forward(req,resp);




    }
}
