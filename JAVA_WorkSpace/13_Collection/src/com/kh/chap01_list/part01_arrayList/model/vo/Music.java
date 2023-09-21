package com.kh.chap01_list.part01_arrayList.model.vo;

public class Music implements Comparable<Music> {

	private String title;
	private String artist;

	public Music() {

	}

	public Music(String title, String artist) {
		super();
		this.title = title;
		this.artist = artist;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getArtist() {
		return artist;
	}

	public void setArtist(String artist) {
		this.artist = artist;
	}

	@Override
	public String toString() {
		return "Music [title=" + title + ", artist=" + artist + "]";
	}
	
	
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((artist == null) ? 0 : artist.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Music other = (Music) obj;
		if (artist == null) {
			if (other.artist != null)
				return false;
		} else if (!artist.equals(other.artist))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		return true;
	}

	@Override
	public int compareTo(Music other) {
		// 현재 객체와, 매개변수로 전달받은 객체간의 비교 수행.
		/*
		 * 양수 : 자리유지
		 * 0   : 자리유지
		 * 음수 : 자리바꿈
		 */
		// 가수 기준으로 오름차순정렬
		return this.artist.compareTo(other.artist);
	}
	
	
	
	
	
	
	
	
	

}

