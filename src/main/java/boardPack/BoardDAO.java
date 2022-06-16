package boardPack;

import java.util.Vector;

import common.ConMgr;

public class BoardDAO {
	private ConMgr pool;
	
	public BoardDAO() {
		try {
			pool = ConMgr.getInstance();
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	
//	public Vector<BoardVO> getBoardList(){}
}
