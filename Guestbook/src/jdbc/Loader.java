package jdbc;

import java.util.StringTokenizer;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

//@WebServlet("/Loader") 초기화작업만 해주기때문에 필요없음
public class Loader extends HttpServlet {

	public void init(ServletConfig config) throws ServletException {

		try {
			String drivers = config.getInitParameter("jdbcdriver");
			// 문자열 잘라서 반환함
			StringTokenizer tokenizer = new StringTokenizer(drivers, ",");

			while (tokenizer.hasMoreTokens()) {
				String driver = tokenizer.nextToken();

				// 데이터베이스 드라이버 로드
				Class.forName(driver);
				System.out.println(driver + "데이터베이스 드라이버 로드 성공~");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
}
