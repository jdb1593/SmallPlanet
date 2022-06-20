package userPack;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import common.ConMgr;
import common.UtilMgr;

public class UserDAO {
private ConMgr pool;
	
	public UserDAO() {
		try {
			pool = ConMgr.getInstance();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//이메일 중복체크
	public boolean emailCheck(String _email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "select email from users where email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, _email);
			
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	//회원가입
	public boolean insertUser(UserVO _vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "insert users(email,name,password,birthday) values(?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, _vo.getEmail());
			pstmt.setString(2, _vo.getName());
			pstmt.setString(3, _vo.getPassword());
			pstmt.setString(4, _vo.getBirthday());
			
			if(pstmt.executeUpdate()==1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	//로그인
	public boolean login(String _email,String _password) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		boolean flag = false;
		
		try {
			con = pool.getConnection();
			sql = "select name from users where email = ? and password = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, _email);
			pstmt.setString(2, _password);
			
			rs = pstmt.executeQuery();
			flag = rs.next();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return flag;
	}
	
	//유저 정보 가져오기
	public UserVO getUser(String _email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String userName = null;
		UserVO vo = new UserVO();
		
		try {
			con = pool.getConnection();
			sql = "select * from users where email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, _email);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setEmail(rs.getString("email"));
				vo.setName(rs.getString("name"));
				vo.setPassword(rs.getString("password"));
				vo.setBirthday(rs.getString("birthday"));
				vo.setRegDate(rs.getString("regDate"));
				vo.setAuthority(rs.getString("authority"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vo;
	}
	
	//정보변경
	public boolean updateUser(UserVO _vo) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		String updatePw = "";
		Boolean pwNull = false;
		
		try {
			pwNull = _vo.getPassword()==null;
			if(!pwNull) {
				updatePw = ",password=?";
			}
			con = pool.getConnection();
			sql = "update users set name=?"+updatePw+" where email = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, _vo.getName());
			if(!pwNull) {
				pstmt.setString(2, _vo.getPassword());
				pstmt.setString(3, _vo.getEmail());
			}else {
				pstmt.setString(2, _vo.getEmail());
			}
			
			if(pstmt.executeUpdate()==1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	
	//탈퇴
	public void deleteUser(String _email) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;

		try {
			con = pool.getConnection();
			sql = "delete from users where email=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,  _email);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}
}
