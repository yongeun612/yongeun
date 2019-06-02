package vo;

public class QuizRankVO {
	
	private int rankNum; //순위
	private int rank_idx; //순위 인덱스
	private int rank_select_score; //선택형 퀴즈 점수
	private int rank_ox_score; //OX 퀴즈 점수
	private String rank_user; //순위 유저아이디
	
	
	public int getRank_ox_score() {
		return rank_ox_score;
	}
	public void setRank_ox_score(int rank_ox_score) {
		this.rank_ox_score = rank_ox_score;
	}
	public int getRankNum() {
		return rankNum;
	}
	public void setRankNum(int rankNum) {
		this.rankNum = rankNum;
	}
	public int getRank_idx() {
		return rank_idx;
	}
	public void setRank_idx(int rank_idx) {
		this.rank_idx = rank_idx;
	}
	public int getRank_select_score() {
		return rank_select_score;
	}
	public void setRank_select_score(int rank_select_score) {
		this.rank_select_score = rank_select_score;
	}
	public String getRank_user() {
		return rank_user;
	}
	public void setRank_user(String rank_user) {
		this.rank_user = rank_user;
	}
	
	
}
