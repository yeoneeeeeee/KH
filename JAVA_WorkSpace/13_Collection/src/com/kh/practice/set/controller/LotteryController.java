package com.kh.practice.set.controller;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.HashSet;
import java.util.TreeSet;

import com.kh.practice.set.model.compare.SortedLottery;
import com.kh.practice.set.model.vo.Lottery;

public class LotteryController {
	private HashSet<Lottery> lottery = new HashSet();
	private HashSet<Lottery> win = new HashSet();

	public boolean insertObject(Lottery l) {
		// 1. 방법
		// return lottery.add(l);
		
		// 2. 반복문을 활용하는 방법
//		for(Lottery lot : lottery) {
////			if(lot.equals(l)) {
////				return true;
////			}
//			if(lot.hashCode() == l.hashCode()) {
//				return true;
//			}
//		}
//		lottery.add(l);
//		return false;
		// 3. 사이즈 체크
		int before_size = lottery.size();
		
		lottery.add(l);
		
		int after_size = lottery.size();
		if(before_size == after_size) {
			return true;
		}
		return false;
		// 전달 받은 l을 lottery에 추가 후, 추가 결과인 boolean 값 반환
	}

	public boolean deleteObject(Lottery l) {
		// 전달 받은 l을 lottery에서 삭제
		boolean result = true;
		int before = lottery.size();
		
		lottery.remove(l);
		
		int after = lottery.size();
		
		result = before != after;
		
		if(result && win !=null) {
			win.remove(l);
		}
		
		return result;
	}

	public HashSet winObject() {
		ArrayList<Lottery> list = new ArrayList(lottery);// 5
		//list.addAll(lottery);
		if(list.size() < 4) {
			return null;
		}
		while(win.size() < 4) {
			int randomIndex = (int)(Math.random() * list.size());// 0 <= r <=4 
			win.add(list.get(randomIndex));
		}
		return win;
	}

	public TreeSet sortedWinObject() {
		// 이름으로 오름차순 정렬하되, 이름이 같으면 번호로 오름차순 하는
		// 정렬기준을 가지고 정렬된 결과를 반환
		// 이 때, 미리 만들어진 win을 가지고 정렬하기 때문에
		// 당첨 대상 확인을 꼭 먼저 해야함
		winObject();
		
		TreeSet<Lottery> ts = new TreeSet(new SortedLottery());
		ts.addAll(win);
		
		return ts;
	}

	public boolean searchWinner(Lottery l) {
		// 전달 받은 l을 win에서 찾고 찾은 결과인 boolean 값 반환
		
		for(Lottery lot  : win) {
//			if(lot.equals(l)) {
//				return true;
//			}
			if(lot.hashCode() == l.hashCode()) {
				return true;
			}
		}
		return false;
		
		
		
	}
}
