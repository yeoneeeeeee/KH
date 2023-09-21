package com.kh.chap01_list.part01_arrayList.model.compare;

import java.util.Comparator;

import com.kh.chap01_list.part01_arrayList.model.vo.Music;

public class MusicTitleAscending implements Comparator<Music> {

	// 제목 기준 오름차순
	
	@Override
	public int compare(Music s1, Music s2 ) {
		return s1.getTitle().compareTo(s2.getTitle());
	}
	
	
	
	
	
	
}
