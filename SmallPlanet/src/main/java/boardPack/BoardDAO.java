package boardPack;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.ConMgr;
import common.UtilMgr;

public class BoardDAO {
	private ConMgr pool;
	private static final String  SAVEFOLDER = "C:/Users/admin/Desktop/SmallPlanet/SmallPlanet/fileUpload";
	private static final String ENCTYPE = "utf-8";
	private static int MAXSIZE = 5*1024*1024;
	
	public BoardDAO() {
		try {
			pool = ConMgr.getInstance();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	//게시물 목록
	public Vector<BoardVO> getBoardList(String _board,int _start,int _end){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BoardVO> vlist = new Vector<BoardVO>();
		
		try {
			con = pool.getConnection();
			sql = "select * from "+_board+" limit ?, ?";
			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, _board);
			pstmt.setInt(1, _start);
			pstmt.setInt(2, _end);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setSeq(rs.getInt("seq"));
				vo.setSubject(rs.getString("subject"));
				vo.setTitle(rs.getString("title"));
				vo.setWriter(rs.getString("writer"));
				vo.setUploadDate(rs.getString("uploadDate"));
				vo.setCnt(rs.getInt("cnt"));
				vlist.add(vo);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//게시물 등록
	public void insertBoard(String _boardName,HttpServletRequest _req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		MultipartRequest multi = null;
		int fileSize = 0;
		String fileName = null;
		
		try {
			con = pool.getConnection();
//			sql = "select max(seq) from "+_boardName;
//			pstmt = con.prepareStatement(sql);
//			rs = pstmt.executeQuery();
			
			int ref = 1;
//			if(rs.next()) {
//				ref = rs.getInt(1) + 1;
//			}
			
			//file
			File file = new File(SAVEFOLDER);
			if(!file.exists()) {
				file.mkdir();
			}
			multi = new MultipartRequest(_req, SAVEFOLDER,MAXSIZE,ENCTYPE,
					new DefaultFileRenamePolicy());
			if(multi.getFilesystemName("fileName") != null) {
				fileName = multi.getFilesystemName("fileName");
				fileSize = (int)multi.getFile("fileName").length();
			}
			
			//content
			String content = multi.getParameter("content");
			String title = multi.getParameter("title");
//			if(title.equalsIgnoreCase("TEXT")) {
				title = UtilMgr.replace(title, "<", "&lt;");
//			}
			
			//insert
			sql = "insert "+_boardName
					+"(ref,is_comment,is_comment_reply,subject,title,writer,content,fileName,depth)";
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}
}
