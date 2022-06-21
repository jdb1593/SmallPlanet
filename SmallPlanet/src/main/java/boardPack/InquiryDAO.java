package boardPack;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.ConMgr;
import common.UtilMgr;

public class InquiryDAO {
		private ConMgr pool;
		private static final String  SAVEFOLDER = "C:/Users/admin/Desktop/SmallPlanet/SmallPlanet/fileUpload";
		private static final String ENCTYPE = "utf-8";
		private static int MAXSIZE = 5*1024*1024;
		
		public InquiryDAO() {
			try {
				pool = ConMgr.getInstance();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		
		//게시물 목록
		public Vector<InquiryVO> getInquiryList(int _start,int _end){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<InquiryVO> vlist = new Vector<InquiryVO>();
			
			try {
				con = pool.getConnection();
				sql = "select * from inquiryBoard order by seq desc limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, _start);
				pstmt.setInt(2, _end);
				
				rs = pstmt.executeQuery();
				while (rs.next()) {
					InquiryVO vo = new InquiryVO();
					vo.setSeq(rs.getInt("seq"));
					vo.setTitle(rs.getString("title"));
					vo.setWriter(rs.getString("writer"));
					vo.setUploadDate(rs.getString("uploadDate"));
					vlist.add(vo);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist;
		}
		
		//총 게시물 수
		public int getTotalInquiry(String _board,String _keyField,String _keyWord){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			int total = 0;
			
			try {
				con = pool.getConnection();
				if (_keyWord.equals("null") || _keyWord.equals("")) {
					//no search
					sql = "select count(seq) from "+_board;
					pstmt = con.prepareStatement(sql);
				}else {
					//at search
					sql = "select count(seq) from "+_board+" where "+_keyField+" like ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%" + _keyWord + "%");
				}
				
				rs = pstmt.executeQuery();
				if (rs.next()) {
					total = rs.getInt(1);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return total;
		}
		
		//게시물 등록
		public void insertInquiry(HttpServletRequest _req,HttpServletResponse response) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			InquiryVO vo = new InquiryVO();
			MultipartRequest multi = null;
			int fileSize = 0;
			String fileName = null;
			
			try {
				multi = new MultipartRequest(_req, SAVEFOLDER,MAXSIZE,ENCTYPE,
						new DefaultFileRenamePolicy());
				
				con = pool.getConnection();
				
				//file
				File file = new File(SAVEFOLDER);
				if(!file.exists()) {
					file.mkdir();
				}
				
				if(multi.getFilesystemName("fileName") != null) {
					fileName = multi.getFilesystemName("fileName");
					fileSize = (int)multi.getFile("fileName").length();
				}
				
				//content
				String content = multi.getParameter("content");
				String title = multi.getParameter("title");
//				if(title.equalsIgnoreCase("TEXT")) {
					title = UtilMgr.replace(title, "<", "&lt;");
//				}
				
				//insert
				sql = "insert inquiryBoard"
						+"(email,title,writer,content,fileName,fileSize,phoneNumber)"
						+" values(?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, multi.getParameter("email"));
				pstmt.setString(2, title);
				pstmt.setString(3, multi.getParameter("writer"));
				pstmt.setString(4, content);
				pstmt.setString(5, fileName);
				pstmt.setInt(6, fileSize);
				pstmt.setString(7, multi.getParameter("phoneNumber"));
				pstmt.executeUpdate();
				
				//리다이렉트
				response.sendRedirect("index.jsp");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
		}
		
		//게시글 읽기
		public InquiryVO getInquiry(int _seq) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			InquiryVO vo = new InquiryVO();
			
			try {
				con = pool.getConnection();
				sql = "select * from inquiryBoard where seq=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, _seq);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					vo.setSeq(rs.getInt("seq"));
					vo.setEmail(rs.getString("email"));
					vo.setTitle(rs.getString("title"));
					vo.setWriter(rs.getString("writer"));
					vo.setContent(rs.getString("content"));
					vo.setFileName(rs.getString("fileName"));
					vo.setFileSize(rs.getInt("fileSize"));
					vo.setUploadDate(rs.getString("uploadDate"));
					vo.setPhoneNumber(rs.getString("phoneNumber"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vo;
		}
		
		//게시물 삭제
		public void deleteInquiry(int _seq) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			ResultSet rs = null;

			try {
				con = pool.getConnection();
				sql = "select fileName from inquiryBoard where seq = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, _seq);
				rs = pstmt.executeQuery();
				if (rs.next() && rs.getString(1) != null) {
					if (!rs.getString(1).equals("")) {
						File file = new File(SAVEFOLDER + "/" + rs.getString(1));
						if (file.exists())//파일이 존재하면
							UtilMgr.deleteFile(SAVEFOLDER + "/" + rs.getString(1));
					}
				}
				sql = "delete from inquiryBoard where seq=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,  _seq);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
		}
}
