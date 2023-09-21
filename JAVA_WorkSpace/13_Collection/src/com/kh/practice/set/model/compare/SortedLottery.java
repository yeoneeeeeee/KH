package com.kh.practice.set.model.compare;

import java.util.Comparator;

import com.kh.practice.set.model.vo.Lottery;

public class SortedLottery implements Comparator<Lottery>{
	
	public int compare(Lottery o1, Lottery o2) {
		// 이름으로 오름차순 정렬하되, 이름이 같으면 번호로 오름차순 하는
		// 정렬기준을 가지고 정렬된 결과를 반환
		int result = o1.getName().compareTo(o2.getName());// 음수,양수, 0
		if( result == 0) {
			result = o1.getPhone().compareTo(o2.getPhone());
		}
		return result;
	}
	
	
	
	
}
