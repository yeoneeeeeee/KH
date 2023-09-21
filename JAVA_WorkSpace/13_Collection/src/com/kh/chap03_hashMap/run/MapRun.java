package com.kh.chap03_hashMap.run;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;
import java.util.Set;

import com.kh.chap03_hashMap.model.vo.Snack;

public class MapRun {

	public static void main(String[] args) {
		/*
		 * 계층구조를 봤을때 List나 Set계열은 Collection을 구현한 클래스 => 데이터를 추가할때
		 * 공통적으로 add 메소드 사용함.
		 * 
		 * 단, Map은 아니다. => 데이터를 추가할때 put 메소드 이용(key + value세트로 추가)
		 * 
		 * Map 특징
		 * key, value 한쌍으로 요소를 구성한다.
		 * key를 통해서 value을 얻어옴
		 * key는 중복을 허용하지 않는다. value 중복되어도 좋다.
		 * 
		 * 동일한 key로 추가 저장하면, 마지막에 추가한 value값으로 치환된다.(덮어씌우기)
		 * 
		 * ★동일한 key값인지 여부는 hashCode()함수로 판단한다.
		 */
		
		HashMap<String, Snack> hm = new HashMap();
		// 1. put(K key, V value) => map공간에 key+value 세트로 추가해주는 메소드
		hm.put("다이제", new Snack("초코맛",500));
		hm.put("칸초", new Snack("단맛",300));
		hm.put("바나나깡", new Snack("바나나맛",400));
		hm.put("씬다이제", new Snack("초코맛",500));
		
		System.out.println(hm);// 저장순서유지 x, value값이 동일해도 key값만 중복되지 않는다면
		// 데이터 추가에 문제 없다.
		
		hm.put("씬다이제" , new Snack("초코맛",300));
		// 동일한 key값의 value값으로 덮어씌워지기 된다.
		
		// 2. get(Object key) : V => 컬렉션에서 해당 키값의 value값을 돌려주는 메소드
		System.out.println(hm.get("다이제"));
		
		Snack s = (Snack) hm.get("씬다이제"); // 제네릭 미설정시 반환형 Object ==> 다운캐스팅
		
		// 3. size() => 맵에 담겨있는 객체의 개수
		System.out.println("size : "+hm.size());
		
		// 4. replace(K key, V value) => 맵에 해당 key값을 찾아서 전달받은 value값으로 변경해줌
		Snack s2 = hm.replace("바나나깡",new Snack("초코바나나",500));
		System.out.println(s2);
		System.out.println(hm);
		
		// 5. remove(Object key) => 컬렉션에 해당 key값을 찾아서 key + value 둘다 지워줌.
		hm.remove("칸초");// 반환값: 삭제된 value값이 반환
		System.out.println(hm);
		
		System.out.println("==================================================");
		
		// 순차적으로 HashMap에 담겨있는 값에 접근하고자 할때?
		// 1. keySet : hashMap에 key값들만 따로 Set에 저장시켜주는 함수
		// 2. entrySet : key값과 value값을 하나로 묶어서 set에 담아주는함수.
		
		// for each문 향상된 반복문 사용불가!!
//		for(Snack s : hm) {
//			
//		}
		
		// iterator()는 List나 Set에서만 사용되는 메소드임. 바로사용불가.
//		hm.iterator();
		
		// List와 Map은 다른 계열이기때문에 ArrayList로 담은후 출력불가능.
		//ArrayList list = new ArrayList(hm);
		
		// Map을 Set으로 바꿔즈는 메소드 2개
		// HashMap => Set 계열 => set관련 반복문 활용
		
		// 1. keySet()를 이용하는 방법
		System.out.println(hm.keySet());
		// 1) hm에 있는 key값들만 Set에 담기
		Set<String> keySet = hm.keySet();		
		
		// 2) keySET을 iterator에 담기
		Iterator<String> it =  keySet.iterator();
		
		// 3) 반복자에 담긴것들을 순차적으로 뽑기
		while(it.hasNext()) {
			String key = it.next();
			Snack value = hm.get(key);
			System.out.println("key :: "+key);
			System.out.println("value ::"+value);
		}
		
		
		// 2. entrySet() 이용하는 방법
		
		// 1) hm에 있는 key+value 모두 set에 담아줌(Entry == 집합형태)
		Set<Entry<String,Snack>> entrySet = hm.entrySet();
//		ArrayList<Entry<String,Snack>> list = new ArrayList(entrySet);
//		System.out.println(list);
		
		// 2) entrySet에 있는 것들을 Iterator에 담기
		Iterator<Entry<String, Snack>> itEntry = entrySet.iterator();
		
		// 3) 반복자 이용해서 순차적으로 값을 뽑기
		while(itEntry.hasNext()) {
			Entry<String, Snack> entry = itEntry.next();
			System.out.println("key : "+entry.getKey());
			System.out.println("value : "+entry.getValue());
		}
		
		
		
		
		
		
		
		
		
	}

}
