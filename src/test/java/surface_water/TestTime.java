package surface_water;

import java.math.BigDecimal;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class TestTime {

	public static void main(String[] args) {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd"); 
		SimpleDateFormat format2 = new SimpleDateFormat("dd"); 
		String date="2018-4-17";
		
		try {
			System.out.println(format.parse(date));
			Date dt=format.parse(date);
			System.out.println("========date=========="+format2.format(dt));
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		String str1="2.30";

    	BigDecimal bd=new BigDecimal(str1);

    	System.out.println(bd);

	}

}
