package guest.service;

import java.sql.Connection;
import java.sql.SQLException;

import guest.dao.MessageDao;
import guest.model.Message;
import jdbc.ConnectionProvider;
import jdbc.JdbcUtil;

public class WriteMessageService {

	// 싱글톤처리
	private static WriteMessageService service = new WriteMessageService();

	public static WriteMessageService getInstance() {
		return service;
	}

	// 기본생성자
	private WriteMessageService() {
	}

	public void write(Message message) throws ServiceException {
		Connection conn = null;
		try {
			
			conn = ConnectionProvider.getConnection();
			MessageDao messageDao = MessageDao.getInstance();
			messageDao.insert(conn, message);
			
		} catch (SQLException e) {
			
			throw new ServiceException("메시지 등록 실패: " + e.getMessage(), e);
			
		} finally {
			
			JdbcUtil.close(conn);
			
		}
	}
}
