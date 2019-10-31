package kr.co.link.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kr.co.link.vo.Band;
import kr.co.link.vo.BandContentText;
import kr.co.link.vo.BandHistory;
import kr.co.link.vo.BandHomeContent;
import kr.co.link.vo.BandJoin;
import kr.co.link.vo.BandLogoImg;
import kr.co.link.vo.BandNbbang;
import kr.co.link.vo.BandTodo;
import kr.co.link.vo.User;
import kr.co.link.vo.BandVote;
import kr.co.link.vo.BandWritePhoto;

public interface BandService {

	// 등록시 이미지리스트
	public List<BandLogoImg> getAllLogoImg(int begin, int end);
	
	// 밴드 추가
	public void addBand(Band band);
	
	// 가입한 밴드 리스트, 메인화면 출력
	public List<Band> bandJoinList(String userId);
	
	// 밴드 홈 정보 출력
	public Band getBandByNo(int bandNo);
	
	// 밴드 이름 검색
	public Band getBandByName(String name);
	
	// 밴드 내용등록
	public void addContents(Map<String, Object> bandMap);
	
	// 밴드 Write 등록
	public int addWrite(BandHomeContent write);
	
	// 밴드 등록 취소시 삭제
	public void delWriteCancel(int writeNo);
	
	// 밴드 글작성 시 투표 생성
	public BandVote addVoteStart(BandVote bandVote);
	
	// 밴드 글씨기에서 투표 삭제하기
	public void bandWriteDelVote(int voteNo);
	
	// 밴드 글작성 시 ToDo 생성
	public BandTodo addTodoStart(BandTodo bandTodo);
	
	// 밴드 글작성 Todo 삭제하기
	public void bandWriteDelTodo(int todoNo);
	
	// 밴드 글작성 참가신청서 추가
	public BandJoin addJoinStart(BandJoin bandJoin);
	
	// 밴드 글작성시 join 삭제하기
	public void bandWriteDelJoin(int joinNo);
	
	// 밴드 글작성 nbbang 생성하기
	//public BandNbbang addNbbangStart(BandNbbang bandNbbang);
	
	// 밴드 글작성시 nbbang 삭제하기
	public void bandWriteDelNbbang(int nbbNo);
	
	// 밴드 글작성 완료 버튼시 진짜 등록
	public void updateBandHomeWriteByWriteNoToStart(BandHomeContent bandHomeContent);
	
	// 밴드 번호로 글 상세정보 가져오기
	public BandHomeContent getBandHomeWriteByWriteNo(int writeNo);
	
	// 밴드 가입여부 확인
	public String getJoinYn(String userId, int bandNo);
	
	// 가입하지 않은 밴드 보여주기
	public List<Band> getNotJoinBandByUserId(String userId);
	
	// 밴드 가입하기
	public void bandJoin(int BandNo, String userId);
	
	// 밴드 가입한 멤버 모두 가져오기
	public List<User> getJoinMembers(int bandNo);
	
	// 밴드 가입한 사람 이름으로 검색하기
	public List<User> getJoinMemberByNameAndBandNo(String userName, int bandNo);
	
	// 밴드 엔빵 추가하기
	public int addNbbangStart(int writeNo);
	
	// 밴드 엔빵 작성중 취소시 삭제
	public void bandWriteDelOnlyNbbang(int writeNo);
	
	// 밴드 엔빵 items 추가하기, 카운터 수 구하기
	public BandNbbang addNbbangItemsStart(BandNbbang nbbang);
	
	// 벤드 엔빵 업데이트 및 어드
	public BandNbbang addUpdateNbbang(int nbbNo, int price);
	
	// 밴드 글 불러오기
	public List<BandHomeContent> getBandHomeWriteByBandNo(int bandNo);
	
	// 밴드 글 디테일 보이기
	public Map<String, Object> bandContentDetailView(String type, int no);
	
	// 밴드 사진첩 출력
	public List<BandHomeContent> getBandHomeContentPhotoByBandNo(int bandNo);
	
	// 밴드 사진첩 추가
	public void addBandWritePhoto(int writeNo, String fileName, int bandNo);
	
	// 밴드 사진첩 출력
	public List<BandWritePhoto> getbandWritePhotoByBandNo (int bandNo);
}
