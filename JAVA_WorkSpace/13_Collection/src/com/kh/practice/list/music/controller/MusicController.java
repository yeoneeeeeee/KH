package com.kh.practice.list.music.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.kh.practice.list.music.model.compare.AscTitle;
import com.kh.practice.list.music.model.vo.Music;

public class MusicController {
	private List<Music> list = new ArrayList();
	// ArrayList 객체 생성
	public int addList(Music music) {
		int result = 0;
		try {
			list.add(music);
			result = 1;
		} catch(Exception e) {
		}
		
		return result;
	}	
	
	public int addAtZero(Music music) {
		list.add(0 , music);
		return 1;
	}
	public List printAll() {
		return list;
	}
	public Music searchMusic(String title) {
		Music m = null;
		
		for(int i =0; i< list.size(); i++) {
			if(list.get(i).getTitle().equals(title)) {
				m = list.get(i);
			}
		}
		return m;
	}
	public Music removeMusic(String title) {
		Music m = null;
		
		for(int i=0; i<list.size(); i++) {
			if(list.get(i).getTitle().equals(title)) {
				m = list.remove(i);
				break;
			}
		}
		return m;
	}
	public Music setMusic(String title, Music music) {
		Music m = null;
		
		for(int i =0; i<list.size(); i++) {
			
			if(list.get(i).getTitle().equals(title)) {
				m = list.get(i);
				list.set(i, music);
			}
		}
		return m;
	}
	public int ascTitle() {
		Collections.sort(list , new AscTitle());
		// 리스트 곡 명 오름차순 정렬, 제목이 같으면 가수 명으로 오름차순 정렬, 1 리턴
		return 1;
	}
	public int descSinger() {
		// 리스트 가수 명 내림차순 정렬, 1 리턴
		Collections.sort(list);
		
		return 1;		
	}
	
	
}
