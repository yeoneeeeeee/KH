package com.kh.chap01_list.part01_arrayList.model.compare;

import java.util.Comparator;

import com.kh.chap01_list.part01_arrayList.model.vo.Music;

public class MusicTitleAscending2 implements Comparator<Music> {

	// 가수이름 내림차순
	
	@Override
	public int compare(Music s1, Music s2 ) {
		return s2.getArtist().compareTo(s1.getArtist());
	}
	
	
	
	
	
	
}
