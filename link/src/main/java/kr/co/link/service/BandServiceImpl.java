package kr.co.link.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.link.dao.BandDao;
import kr.co.link.vo.Band;
import kr.co.link.vo.BandContentText;
import kr.co.link.vo.BandHistory;
import kr.co.link.vo.BandHomeContent;
import kr.co.link.vo.BandJoin;
import kr.co.link.vo.BandLogoImg;
import kr.co.link.vo.BandNbbang;
import kr.co.link.vo.BandTodo;
import kr.co.link.vo.BandVote;
import kr.co.link.vo.BandWritePhoto;
import kr.co.link.vo.User;
@Service
public class BandServiceImpl implements BandService{

	@Autowired
	private BandDao bandDao;
	
	@Override	// 밴드 추가 사진 리스트
	public List<BandLogoImg> getAllLogoImg(int begin, int end) {
		Map<String, Object> num = new HashMap<String, Object>();
		num.put("begin", begin);
		num.put("end", end);
		return bandDao.getAllLogoImg(num);
	}
	
	@Override // 밴드 추가
	public void addBand(Band band) {
		
		bandDao.addBand(band);
		
		Band bandinfo = bandDao.getBandByName(band.getName());
		
		BandHistory his = new BandHistory();
		his.setBandNo(bandinfo.getNo());
		his.setUserId(band.getUser().getId());
		his.setMasterYn("Y");
		
		bandDao.addBandHistory(his);
	}
	
	@Override	// 밴드 가입 리스트 
	public List<Band> bandJoinList(String userId) {
		List<Band> joinBands = bandDao.getAllJoinBand(userId);
		for(Band band : joinBands) {
			band.setJoinCount(bandDao.getJoinCount(band.getNo()));
		}
		
		return joinBands;
	}
	
	@Override // 밴드 홈페이지 정보 가져오기
	public Band getBandByNo(int bandNo) {
		Band band = bandDao.getBandByNo(bandNo);
		band.setJoinCount(bandDao.getJoinCount(band.getNo()));
		
		return band;
	}
	
	@Override	// 밴드 이름 검색
	public Band getBandByName(String name) {
		return bandDao.getBandByName(name);
	}
	
	@Override	// 밴드 글 등록
	public void addContents(Map<String, Object> bandMap) {
		// 1. writeNo를 출력하는 dao실행
		int writeNo = bandDao.getBandHomeWriteSeq();
		// 2. text 인덱스 생성
		int textIndex = 0;
		
		// 3. BandHomeContent를 bandMap에서 추출 
		BandHomeContent homeWrite = (BandHomeContent)bandMap.get("bandHomeWtire");
		// 4. BandWrite에 writeNo를 입력
		homeWrite.setWriteNo(writeNo);
		// 5. BandWrite를 dao등록
		bandDao.addBandHomeWriteStart(homeWrite);
		
		// 6. BandHomeWriteContent 리스트를 출력
		List<BandHomeContent> homeWriteContent = (List<BandHomeContent>)bandMap.get("bandHomeWriteContent");
		// 7. BandHomeWriteText 리스트 출력
		List<BandContentText> bandText = (List<BandContentText>)bandMap.get("bandText");

		// 8. BandWriteContent for문으로 반복 실행 
		for(BandHomeContent content : homeWriteContent) {

			// 9. contentNo 추출하는 dao실행
			int writeContentNo = bandDao.getBandHomeWriteContentSeq();
			
			// 10. BandWriteContent에 WriteNo 입력
			content.setWriteNo(writeNo);
			// 11. BandWriteContent에 ContentNo 입력
			content.setContentNo(writeContentNo);
			
			// 12. BandWriteContent를 Dao에 추가
			bandDao.addBandHomeWriteContent(content);
			
			// 13. 만약 Content Type가 TEXT이면
			if(content.getContentType().equals("TEXT")) {
				// 14. BandWriteContentText에 ContentNo입력
				bandText.get(textIndex).setContentNo(writeContentNo);
				// 15. BandWriteContentText를 dao등록
				bandDao.addBandContentsText(bandText.get(textIndex));
			} 
					
		}
		
	}
	
	@Override	// write 등록
	public int addWrite(BandHomeContent write) {
		int writeSeq = bandDao.getBandHomeWriteSeq();
		
		write.setWriteNo(writeSeq);
		bandDao.addBandHomeWriteStart(write);
		
		return writeSeq;
	}
	
	@Override	// bandWrite취소시 전체 삭제
	public void delWriteCancel(int writeNo) {
		bandDao.delBandVoteItemCancel(writeNo);
		bandDao.delBandVoteCancel(writeNo);
		bandDao.delBandTodoItemCancel(writeNo);
		bandDao.delBandTodoCancel(writeNo);
		bandDao.delBandJoinItemsCancel(writeNo);
		bandDao.delBandJoinCancel(writeNo);
		bandDao.delBandNbbangItemsCancel(writeNo);
		bandDao.delBandNbbangCancel(writeNo);
		bandDao.delbandWriteCancel(writeNo);
	}
	
	@Override	// band 처음 작성시 투표 등록
	public BandVote addVoteStart(BandVote bandVote) {
		int voteSeq = bandDao.getVoteSeq();
		bandVote.setVoteNo(voteSeq);
		
		if(bandVote.getMultipleYn() == null) {
			bandVote.setMultipleYn("N");
		}
		if(bandVote.getEveryOneAdd() == null) {
			bandVote.setEveryOneAdd("N");
		}
		
		bandDao.addBandVoteStart(bandVote);
		for(String hangmoc : bandVote.getHangmoc()) {
			bandVote.setHangmocSamll(hangmoc);
			
			bandDao.addBandVoteItemStart(bandVote);
		}
		
		return bandDao.getBandVoteByWriteNo(bandVote.getWriteNo());
	}
	
	@Override	// 밴드 작성 스마트에디터에서 삭제 누를때 삭제하기
	public void bandWriteDelVote(int voteNo) {
		bandDao.delBandVoteItemsByVoteNo(voteNo);
		bandDao.delBandVoteByVoteNo(voteNo);
	}
	
	@Override	// 밴드 글 작성시 todo 등록
	public BandTodo addTodoStart(BandTodo bandTodo) {
		int todoSeq = bandDao.getTodoSeq();
		
		if(bandTodo.getEverybody() == null) {
			bandTodo.setEverybody("N");
		}
		bandTodo.setTodoNo(todoSeq);
		
		bandDao.addBandTodoStart(bandTodo);
		
		for(String hang : bandTodo.getHangmoc()) {
			bandTodo.setHangmocSmall(hang);
			bandDao.addBandTodoItemsStart(bandTodo);
		}
		
		return bandDao.getBandTodoByWriteNo(bandTodo.getWriteNo());
	}
	
	@Override	// 스마트에디터에서 todo 삭제 버튼 클릭시 발동
	public void bandWriteDelTodo(int todoNo) {
		bandDao.delBandTodoItemsByTodoNo(todoNo);
		bandDao.delBandTodoByTodoNo(todoNo);
	}
	
	@Override	// 밴드 글잗성에서 join 추가시 실행
	public BandJoin addJoinStart(BandJoin bandJoin) {
		int joinSeq = bandDao.getJoinSeq();
		
		bandJoin.setJoinNo(joinSeq);
		
		if(bandJoin.getEndTimeCheck() == null) {
			bandJoin.setEndTimeCheck("N");
		}
		if(bandJoin.getPepleLimit() == null) {
			bandJoin.setPepleLimit(0);
		}
		
		bandDao.addBandJoinStart(bandJoin);
		
		for(String h : bandJoin.getHangmoc()) {
			bandJoin.setHangmocSmall(h);
			bandDao.addBandJoinItemsStart(bandJoin);
		}
		
		return bandDao.getBandJoinByWriteNo(bandJoin.getWriteNo());
	}
	
	@Override	// 스마트 에디터에서 삭제버튼 누를시 join삭제버튼
	public void bandWriteDelJoin(int joinNo) {
		bandDao.delBandJoinItemsByJoinNo(joinNo);
		bandDao.delBandJoinByJoinNo(joinNo);
	}
	
	/*
	@Override	// 밴드 글작성시 밴드 추가
	public BandNbbang addNbbangStart(BandNbbang bandNbbang) {
		int nbbSeq = bandDao.getNbbangSeq();
		
		bandNbbang.setNbbNo(nbbSeq);
		
		bandDao.addBandNbbangStrart(bandNbbang);
		
		for(String p : bandNbbang.getPeople()) {
			bandNbbang.setPerson(p);
			bandDao.addBandNbbangItemsStart(bandNbbang);
		}
		
		return bandDao.getBandNbbangByWriteNo(bandNbbang.getWriteNo());
	}
	*/
	
	@Override	// 스마트에디터에 삭제버튼 누를시
	public void bandWriteDelNbbang(int nbbNo) {
		bandDao.delBandNbbangItemsByNbbNo(nbbNo);
		bandDao.delBandNbbangByNbbNo(nbbNo);
	}
	
	@Override	// 완전한 글작성 완료후 등록되는것
	public void updateBandHomeWriteByWriteNoToStart(BandHomeContent bandHomeContent) {
		bandHomeContent.setDisplaylYn("Y");
		if(bandHomeContent.getNoticeYn() == null) {
			bandHomeContent.setNoticeYn("N");
		}
		
		bandDao.updateBandHomeWriteByWriteNoToStart(bandHomeContent);
	}
	
	@Override	// 글번호로 글 상세번호 가져오기
	public BandHomeContent getBandHomeWriteByWriteNo(int writeNo) {
		return bandDao.getBandHomeWriteByWriteNo(writeNo);
	}
	
	@Override	// 가입하지 않은 밴드가져오기
	public List<Band> getNotJoinBandByUserId(String userId) {
		return bandDao.getNotJoinBandByUserId(userId);
	}
	
	@Override	// 가입여부 저장하기
	public String getJoinYn(String userId, int bandNo) {
		List<BandHistory> bandHis = bandDao.getJoinBands(userId);
		
		for(BandHistory his:bandHis) {
			if(bandNo == his.getBandNo()) {
				his.setJoinYn("Y");
				return "Y";
			}
		}
		return "N";
	}
	
	@Override	// 밴드 가입하기
	public void bandJoin(int BandNo, String userId) {
		BandHistory his = new BandHistory();
		
		his.setMasterYn("N");
		his.setBandNo(BandNo);
		his.setUserId(userId);
		
		bandDao.addBandHistory(his);
	}
	
	@Override	// 밴드 가입한 사람들
	public List<User> getJoinMembers(int bandNo) {
		return bandDao.getJoinMembers(bandNo);
		
	}
	
	@Override	// 밴드 가입한사람 이름으로 검색
	public List<User> getJoinMemberByNameAndBandNo(String userName, int bandNo) {
		
		HashMap<String, Object> bandMap = new HashMap<String, Object>();
		bandMap.put("userName", userName);
		bandMap.put("bandNo", bandNo);
		
		return bandDao.getJoinMemberByNameAndBandNo(bandMap);
	}
	
	@Override	// 밴드 엔빵 클릭시 엔빵 추가
	public int addNbbangStart(int writeNo) {
		int nbbSeq = bandDao.getNbbangSeq();
		
		BandNbbang nbb = new BandNbbang();
		nbb.setPrice(0);
		nbb.setWriteNo(writeNo);
		nbb.setNbbNo(nbbSeq);
		
		bandDao.addBandNbbangStrart(nbb);
		
		return nbbSeq;
	}
	
	@Override	// 밴드 엔빵테이블만 삭제
	public void bandWriteDelOnlyNbbang(int nbbSeq) {
		bandDao.delBandNbbangItemsByNbbNo(nbbSeq);
		bandDao.delBandNbbangByNbbNo(nbbSeq);
	}
	
	@Override	// 밴드 엔빵 아이템즈 추가하기
	public BandNbbang addNbbangItemsStart(BandNbbang nbbang) {
		for(String p : nbbang.getPeople()) {
			nbbang.setPerson(p);
			bandDao.addBandNbbangItemsStart(nbbang);
		}
		nbbang.setPersonCount(bandDao.getNbbangItemsCountByNbbNo(nbbang.getNbbNo()));
		List<User> users = bandDao.getNbbangMemberBySelect(nbbang.getNbbNo());
		nbbang.getPeople().clear();
		
		for(User u : users) {
			nbbang.getPeople().add(u.getName());
		}
		
		return nbbang;
	}

	@Override	// 밴드 엔빵 에드 업데이트
	public BandNbbang addUpdateNbbang(int nbbNo, int price) {
		BandNbbang nbbang = new BandNbbang();
		nbbang.setNbbNo(nbbNo);
		nbbang.setPrice(price);
		
		bandDao.updateNbbangByNbbNo(nbbang);
		return bandDao.getBandNbbangByNbbNo(nbbNo);
	}
	
	@Override	// 밴드 홈에서 글불러오기
	public List<BandHomeContent> getBandHomeWriteByBandNo(int bandNo) {
		return bandDao.getBandHomeWriteByBandNo(bandNo);
	}
	
	@Override	// 밴드 디테일 가져오기
	public Map<String, Object> bandContentDetailView(String type, int no) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		if(type.equals("vote")) {
			BandVote vote = bandDao.getBandVoteByVoteNo(no);
			List<BandVote> voteItems = bandDao.getBandVoteItemByVoteNo(no);
			
			map.put("main", vote);
			map.put("sub", voteItems);
			
		} else if(type.equals("todo")) {
			BandTodo todo = bandDao.getBandTodoByTodoNo(no);
			List<BandTodo> todoItems = bandDao.getBandTodoItemsByTodoNo(no);
			
			map.put("main", todo);
			map.put("sub", todoItems);
		
		} else if(type.equals("join")) {
			BandJoin join = bandDao.getBandJoinByJoinNo(no);
			List<BandJoin> joinItems = bandDao.getBandJoinItemByJoinNo(no);
			
			map.put("main", join);
			map.put("sub", joinItems);
		
		} else if(type.equals("nbb")) {
			BandNbbang nbb = bandDao.getBandNbbangByNbbNo(no);
			List<BandNbbang> nbbItem = bandDao.getBandNbbangItemByNbbNo(no);
			nbb.setPersonCount(bandDao.getNbbangItemsCountByNbbNo(no));
			
			map.put("main", nbb);
			map.put("sub", nbbItem);
		}
		
		
		return map;
	}
	
	@Override
	public List<BandHomeContent> getBandHomeContentPhotoByBandNo(int bandNo) {
		return bandDao.getBandWriteContentImgByBandNo(bandNo);
	}
	
	@Override
	public void addBandWritePhoto(int writeNo, String fileName, int bandNo) {
		BandWritePhoto writePhoto = new BandWritePhoto();
		writePhoto.setWriteNo(writeNo);
		writePhoto.setPhotoName(fileName);
		writePhoto.setBandNo(bandNo);
		
		bandDao.addBandWritePhoto(writePhoto);
	}
	
	@Override
	public List<BandWritePhoto> getbandWritePhotoByBandNo(int bandNo) {
		return bandDao.getbandWritePhotoByBandNo(bandNo);
	}
}
