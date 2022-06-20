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
	public Vector<BoardVO> getBoardList(String _board,String _keyField,String _keySub,String _keyWord,
			int _start,int _end){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<BoardVO> vlist = new Vector<BoardVO>();
		
		try {
			con = pool.getConnection();
			if(_keySub.equals("null") || _keySub.equals("")) {
				if (_keyWord.equals("null") || _keyWord.equals("")) {
					//no search
					sql = "select * from "+_board+" where is_comment=0 order by ref desc, depth limit ?, ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setInt(1, _start);
					pstmt.setInt(2, _end);
				}else {
					//at search
					sql = "select * from "+_board+" where is_comment=0 and "+_keyField
							+" like ? order by ref desc, depth limit ?, ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%" + _keyWord + "%");
					pstmt.setInt(2, _start);
					pstmt.setInt(3, _end);
				}
			}else {
				if (_keyWord.equals("null") || _keyWord.equals("")) {
					//no search
					sql = "select * from "+_board
							+" where is_comment=0 and subject like ? order by ref desc, depth limit ?, ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%" + _keySub + "%");
					pstmt.setInt(2, _start);
					pstmt.setInt(3, _end);
				}else {
					//at search
					sql = "select * from "+_board+" where is_comment=0 and "+_keyField
							+" like ? and subject like ? order by ref desc, depth limit ?, ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%" + _keyWord + "%");
					pstmt.setString(2, "%" + _keySub + "%");
					pstmt.setInt(3, _start);
					pstmt.setInt(4, _end);
				}
			}
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				BoardVO vo = new BoardVO();
				vo.setSeq(rs.getInt("seq"));
				vo.setRef(rs.getInt("ref"));
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
	
	//총 게시물 수
	public int getTotalBoard(String _board,String _keyField,String _keySub,String _keyWord){
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int total = 0;
		
		try {
			con = pool.getConnection();
			if(_keySub.equals("null") || _keySub.equals("")) {
				if (_keyWord.equals("null") || _keyWord.equals("")) {
					//no search
					sql = "select count(seq) from "+_board+" where is_comment=0";
					pstmt = con.prepareStatement(sql);
				}else {
					//at search
					sql = "select count(seq) from "+_board+" where is_comment=0 and "
							+_keyField+" like ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%" + _keyWord + "%");
				}
			}else {
				if (_keyWord.equals("null") || _keyWord.equals("")) {
					//no search
					sql = "select count(seq) from "+_board
							+" where is_comment=0 and subject like ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%" + _keySub + "%");
				}else {
					//at search
					sql = "select count(seq) from "+_board+" where is_comment=0 and "+_keyField
							+" like ? and subject like ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1, "%" + _keyWord + "%");
					pstmt.setString(2, "%" + _keySub + "%");
				}
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
	public void insertBoard(HttpServletRequest _req,HttpServletResponse response) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BoardVO vo = new BoardVO();
		MultipartRequest multi = null;
		int fileSize = 0;
		String fileName = null;
		
		try {
			multi = new MultipartRequest(_req, SAVEFOLDER,MAXSIZE,ENCTYPE,
					new DefaultFileRenamePolicy());
			String boardName = multi.getParameter("board");
			
			con = pool.getConnection();
//			sql = "select max(seq) from "+boardName;
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
			sql = "insert "+boardName
					+"(ref,is_comment,is_comment_reply,subject,title,writer,content,fileName,fileSize,depth)"
					+" values(?,0,0,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setString(2, multi.getParameter("subject"));
			pstmt.setString(3, title);
			pstmt.setString(4, multi.getParameter("writer"));
			pstmt.setString(5, content);
			pstmt.setString(6, fileName);
			pstmt.setInt(7, fileSize);
			pstmt.setInt(8, 0);
			pstmt.executeUpdate();
			
			//ref 변경
			sql = "select max(seq) from "+boardName;
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setSeq(rs.getInt(1));
			}
			int seq = vo.getSeq();
			sql = "update "+boardName+" set ref=? where seq=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,seq);
			pstmt.setInt(2,seq);
			pstmt.executeUpdate();
			
			//리다이렉트
			response.sendRedirect("view_post.jsp?boardName="+boardName+"&seq="+seq);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}
	
	//게시글 읽기
	public BoardVO getBoard(String _boardName, int _seq) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		BoardVO vo = new BoardVO();
		
		try {
			con = pool.getConnection();
			sql = "select * from "+_boardName+" where seq=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, _seq);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo.setSeq(rs.getInt("seq"));
				vo.setRef(rs.getInt("ref"));
				vo.setSubject(rs.getString("subject"));
				vo.setTitle(rs.getString("title"));
				vo.setWriter(rs.getString("writer"));
				vo.setContent(rs.getString("content"));
				vo.setFileName(rs.getString("fileName"));
				vo.setFileSize(rs.getInt("fileSize"));
				vo.setUploadDate(rs.getString("uploadDate"));
				vo.setUpdateDate(rs.getString("updateDate"));
				vo.setCnt(rs.getInt("cnt"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vo;
	}
	
	//게시물 삭제
		public void deleteBoard(String _boardName,int _seq) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			ResultSet rs = null;

			try {
				con = pool.getConnection();
				sql = "select fileName from "+_boardName+" where seq = ?";
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
				sql = "delete from "+_boardName+" where seq=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,  _seq);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
		}
	
	//게시물 수정
		public void updateBoard(HttpServletRequest _req,HttpServletResponse response) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			MultipartRequest multi = null;

			try {
				multi = new MultipartRequest(_req, SAVEFOLDER,MAXSIZE,ENCTYPE,
						new DefaultFileRenamePolicy());
				String boardName = multi.getParameter("board");
				int seq = Integer.parseInt(multi.getParameter("seq"));
				//content
				String content = multi.getParameter("content");
				String title = multi.getParameter("title");
				String subject = multi.getParameter("subject");

				con = pool.getConnection();
				sql = "update "+boardName+" set title = ?, subject=?, content = ?, updateDate=current_timestamp where seq = ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, title);
				pstmt.setString(2, subject);
				pstmt.setString(3, content);
				pstmt.setInt(4, seq);
				pstmt.executeUpdate();
				response.sendRedirect("view_post.jsp?boardName="+boardName+"&seq="+multi.getParameter("seq"));
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
		}
		
		//답글 작성
		public void replyBoard(HttpServletRequest _req,HttpServletResponse response) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			ResultSet rs = null;
			BoardVO vo = new BoardVO();
			MultipartRequest multi = null;
			int fileSize = 0;
			String fileName = null;
			
			try {
				multi = new MultipartRequest(_req, SAVEFOLDER,MAXSIZE,ENCTYPE,
						new DefaultFileRenamePolicy());
				String boardName = multi.getParameter("board");
				int ref = Integer.parseInt(multi.getParameter("ref"));
				
				con = pool.getConnection();
				sql = "select depth from "+boardName+" where seq=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1,ref);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					vo.setDepth(rs.getInt("depth"));
				}
				int depth = vo.getDepth() + 1;
				
				sql = "insert "+boardName+"(ref,is_comment,is_comment_reply,title,subject,writer,content,depth)"
					+" values(?,?,?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, ref); //원글 참조번호
				pstmt.setInt(2, 0);
				pstmt.setInt(3, 0);
				pstmt.setString(4, multi.getParameter("title")); 
				pstmt.setString(5, multi.getParameter("subject")); //원글 머리말
				pstmt.setString(6, multi.getParameter("writer"));
				pstmt.setString(7, multi.getParameter("content"));
				pstmt.setInt(8, depth);
				pstmt.executeUpdate();
				
				//리다이렉트
				response.sendRedirect(boardName+".jsp");
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
		}
		
		//댓글 작성
		public void commentBoard(String _boardName,BoardVO _vo) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "insert "+_boardName+"(ref,is_comment,is_comment_reply,writer,content,depth)"
						+" values(?,?,?,?,?,?)";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, _vo.getRef()); //원글 참조번호
				pstmt.setInt(2, 1);
				pstmt.setInt(3, 0);
				pstmt.setString(4, _vo.getWriter()); //현재 유저
				pstmt.setString(5, _vo.getContent());
				pstmt.setInt(6, 0);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
		}
		
		//대댓글 작성?
		public void replyCommentBoard(String _boardName,BoardVO _vo) {
			Connection con = null;
			PreparedStatement pstmt = null;
			String sql = null;
			try {
				con = pool.getConnection();
				sql = "insert "+_boardName+"(ref,is_comment,is_comment_reply,title,subject,writer,content,depth)"
						+" values(?,?,?,?,?,?,?,?)";
				int depth = _vo.getDepth() + 1;
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, _vo.getRef()); //원글 참조번호
				pstmt.setInt(2, 1);
				pstmt.setInt(3, 1);
				pstmt.setString(4, _vo.getTitle()); //원글 제목
				pstmt.setString(5, _vo.getSubject()); //원글 말머리
				pstmt.setString(6, _vo.getWriter());
				pstmt.setString(7, _vo.getContent());
				pstmt.setInt(8, depth);
				pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt);
			}
		}
		
		//댓글 목록
		public Vector<BoardVO> getCommentList(String _board,int _ref){
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Vector<BoardVO> vlist = new Vector<BoardVO>();
			
			try {
				con = pool.getConnection();
				sql = "select * from "+_board+" where ref=? and is_comment=1 order by is_comment_reply, depth";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, _ref);
				
				rs = pstmt.executeQuery();
				while (rs.next()) {
					BoardVO vo = new BoardVO();
					vo.setSeq(rs.getInt("seq"));
					vo.setWriter(rs.getString("writer"));
					vo.setContent(rs.getString("content"));
					vo.setUploadDate(rs.getString("uploadDate"));
					vo.setUpdateDate(rs.getString("updateDate"));
					vlist.add(vo);
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt, rs);
			}
			return vlist;
		}
		
		//qna 상태
		public Boolean qnaStatus(int _ref) {
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = null;
			Boolean status = false;
			int reply = 0;
			
			try {
				con = pool.getConnection();
				sql = "select count(seq) from qnaBoard where ref=? and is_comment=0";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, _ref);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					reply = rs.getInt(1);
					if(reply>1) {
						status = true;
					}
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				pool.freeConnection(con, pstmt,rs);
			}
			return status;
		}
}
