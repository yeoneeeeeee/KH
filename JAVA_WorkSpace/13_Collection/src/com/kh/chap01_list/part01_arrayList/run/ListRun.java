package com.kh.chap01_list.part01_arrayList.run;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Iterator;
import java.util.List;

import com.kh.chap01_list.part01_arrayList.model.compare.MusicTitleAscending;
import com.kh.chap01_list.part01_arrayList.model.vo.Music;

public class ListRun {
	/*
	 * 컬렉션(Collection)
	 * 자료구조가 내장되어있는 클래스로 자바에서제공하는 "자료구조"를 담당하는 "프레임워크"이다.
	 * 
	 * 자료구조
	 * 방대한 데이터를 효율적으로 다룰때 필요한 개념
	 * 
	 * 프레임워크
	 * 효율적인 기능들이 이미 정의되어있는 틀
	 * 
	 * 정리해보면
	 * 데이터들이 새로이 추가되거나, 삭제가 되거나, 수정이 되는 기능들(알고리즘)들이 이미 정의되어있는 틀이 있다 == 컬렉션
	 * => 다량의 데이터들을 관리하고자 할때 배열 가지고 충분히 사용가능했었음. 단, 배열의 단점을 보완한것이 컬렉션
	 * 
	 * 배열과 컬렉션의 차이점
	 * - 배열의 단점
	 * 1. 배열을 쓰고자 할 때는 먼저 크기를 지정해줘야함
	 *    => 한번 지정한 크기는 변경이 불가
	 *       새로운 값을 추가하고자 할때 크기가 오버될 경우 새로운 크기의 배열을 만들고 기존의 내용들을 복사해주는 코드를
	 *       직접 짜야함
	 * 2. 배열 중간 위치에 새로운 데이터를 추가하거나 삭제하는 경우 기존의 값들을 땡겨주는 코드도 직접 짜야함
	 * 3. 한 타입의 데이터들만 저장 가능
	 * 
	 * - 컬렉션의 장점
	 * 1. 크기에 제약이 없다
	 *   => 크기지정을 해줄 필요도 없고 만일 크기지정을 해도 알아서 크기가 늘어나면서 새로운 데이터를 추가해주는 코드가
	 *      이미 정의되어있따.
	 * 2. 중간에 값을 추가하거나 삭제하는 경우 값을 땡겨주는 코드가 이미 메소드로 정의되어 있음
	 * 3. 기본적으로 여러 타입의 데이터들을 저장할 수 있음(단, 제네릭 설정을 통해서 한 타입의 데이터들만 들어올수 있게도함)
	 * 
	 * 방대한 데이터들을 단지 담아만 두고 조회할 목적 => 배열
	 * 방대한 데이터들을 빈번하게 추가 ,삭제 ,수정할 목적 => 컬렉션
	 * 
	 * 컬렉션의 3가지 분류
	 * List 계열 : 담고자 하는 값(value)만 저장 / 값 저장시 순서 유지가됨(index 개념이 있음) / 중복값 허용
	 *         예) ArrayList, Vector, LinkedList => ArrayList가 제일많이쓰임
	 * Set  계열 : 담고자 하는 값(value)만 저장 / 값 저장할때 순서 유지가 안됨(index가 없음) / 중복값 허용x
	 *         예) HashSet, TreeSet
	 * Map  계열 : 키(Key) + 담고자 하는 값(value) 세트로 저장/ 값 저장시 순서유지 x / key값은 중복 허용x
	 *         예) HashMap , Properties
	 */
	
	public static void main(String[] args) {

		//ArrayList list = new ArrayList();
		
		// 제네릭 설정하는 이유
		// 1. 명시한 타입의 객체만 저장가능하도록 타입을 제한하기 위해서 ==> 안정성 확보 가능
		// 2. 컬렉션에 저장된 객체를 꺼내서 사용할때 매번 형변환 하는 절차를 없애기 위해서.
		//ArrayList<Music> list = new ArrayList<Music>(3);
		ArrayList<Music> list = new ArrayList<>(3); // 객체 생성시에는 생략가능(JDK 7버전이상에서만가능)
		
		System.out.println(list.toString());
		
		// <E> --> Element
		
		// 1. add(Music e) : 해당 리스트의 끝에 전달된 e를 추가시켜주는 메소드
		list.add(new Music("zero","뉴진스"));
		list.add(new Music("ditto","유진스"));
		list.add(new Music("hypeboy","가진스"));
		list.add(new Music("test","뉴생성자"));
		
		//list.add("");
		// 순서가 유지되면서 값이 추가가됨(각 index에 값이 담겨있음)
		// 크기에 제약이 없다. 다양한 타입의 값 추가 가능(권장하진 않음)
		
		System.out.println(list);
		
		// 2. add(int index , E e) : 리스트에 전달되는 index 값 위치에 전달되는 e를 추가시켜주는 메소드
		list.add(1 , new Music("바다의 왕자","박명수"));
		
		System.out.println(list);
		
		// 3. set(int index , E e) : 리스트에 해당 인덱스 값을 전달되는 e로 변경시켜주는 메소드
		list.set(0,new Music("heart","뉴진스"));
		
		System.out.println(list);
		
		// 4. remove(int index) : E e 리스트에 해당인덱스값을 삭제시켜주는 메소드
		list.remove(1);
		
		System.out.println(list);
		
		// 5. size() : 리스트에 담겨있는 데이터의 수를 반환해주는 메소드 == 배열의 length
		System.out.println("리스트에 담긴 데이터 수 : "+list.size());
		System.out.println("리스트의 마지막 인덱스 : "+(list.size()-1));
		
		// 6. get(int index) : E => 리스트에 해당 index위치의 데이터를 반환해주는 메소드
		
		// 제네릭 설정전
		//Music m = (Music) list.get(0);
		Music m = list.get(0);
		System.out.println(m);
		System.out.println(m.getTitle());
		System.out.println(list.get(1).getArtist());
		
		System.out.println("========================================================");

		ArrayList<Integer> iList = new ArrayList();
		iList.add(1);
		iList.add(2);
		iList.add(100);
		
		// 7. contains(E e) : boolean : 컬렉션안에 매개인자요소를 포함하고 있는지 검사
		System.out.println(iList.contains(2));
		
		// 8. indexOf(E e) : int : 컬렉션안에 매개인자요소가 몇번째 인덱스에 있는가?
		System.out.println(iList.indexOf(100));
		
		System.out.println("===========================================================");
		
		// 컬렉션을 반복시키는 방법 
		// 1. 기본 for 문
		// 2. for Each문 : 향상된 반복문
		for( Music mu    : list  ) {
			System.out.println(mu);
		}
		System.out.println("=================================================================");
		
		// 3. Iterator 반복자 : 컬렉션의 내부 인자들을 Iteraotr안에 담아서 관리(String의 StringTokenizer와 비슷)
		Iterator<Music> iter =list.iterator();
		while(iter.hasNext()) { // hasMoreTokens
			Music m2 = iter.next();
			System.out.println(m2);
		}
		
		System.out.println("==================================================================");
		// 9. subList(int index1, int index2) : 해당 리스트로부터 index1에서부터 index2까지 데이터의 값들을
		//                                      추출해서 새로운 List로 반환시켜주는 메소드
		
		List<Music> sub = list.subList(0, 2);
		System.out.println(sub);
		
		System.out.println("===================================================================");
		
		// 10. addAll(Collection c) : 해당리스트에 다른 컬렉션에 있는 데이터들을 통채로 추가시켜주는 메소드
		list.addAll(sub);
		System.out.println(list);
		
		// 11. isEmpty() : 해당 리스트가 비어잇는지 묻는 메소드( 비었다면 true/ 아니면 false 반환)
		System.out.println("리스트가 비어잇습니가?"+list.isEmpty());
		
		// 12. clear() : 리스트를 싹 비워주는 메소드
		//list.clear();
		System.out.println(list);
		System.out.println("리스트가 비어잇습니가?"+list.isEmpty());
		
		System.out.println("============================================================");
		
		//13. sort(List list) : 컬렉션을 정렬
		ArrayList<String> sList = new ArrayList();
		sList.add("라경민");
		sList.add("다경민");
		sList.add("가경민");
		sList.add("나경민");
		
		Collections.sort(sList);
		
		System.out.println(sList); // 기본정렬(가나다라, 1234)에 따라 정렬
		
		System.out.println("===============================================");
		
		// 역순으로 정렬
		Comparator<String> comp = Collections.reverseOrder();
		Collections.sort(sList , comp);
		
		System.out.println(sList);
		
		/*
		 * 내가 직접 정의한 객체들을 정렬하기 위해서는 정렬기준을 직접 만들어줘야한다.
		 * 객체정렬방법은 크게 2종류가 있다.
		 * 
		 * 1. Comparable 인터페이스 구현
		 *      기본정렬(한가지) 클래스내부에 직접 구현. 
		 *      compareTo메소드 오버라이딩함 --> 정렬기준은 딱 하나만 세울수 있다.
		 *      가수이름, 노래제목 
		 *      가수이름 오름차순, 가수이름 내림차순, 노래제목 오름차순, 노래제목 내림차순
		 *      
		 * 2. Comparator 인터페이스 구현
		 * 		기본정렬 외에 추가적으로 정렬기준을 제시해야 할때
		 *      별도의 Comparator구현클래스를 작성하면 된다.(정렬기준에대한 개수 제한이 없음)
		 *      compare메소드를 오벌아딩
		 * 
		 * 
		 */
		// 기본정렬 : 가수이름 오름차순
		Collections.sort(list);
		//list.sort(null);  
		
		System.out.println(list);
		
		// 추가적인 정렬기준 생성
		// 1. 제목기준 오름차순
		Collections.sort(list, new MusicTitleAscending());
		System.out.println(list);
		
		// 2. 제목기준 내림차순
		Collections.sort(list, new MusicTitleAscending().reversed());
		System.out.println(list);
		
		System.out.println("==================================================================");
		
		
		ArrayList<Integer> list2 = new ArrayList();
		list2.add(1);
		list2.add(1);
		list2.add(3);
		list2.add(3);
		list2.add(5);
		
		// 반복문을 통해 컬렉션에 담긴 요소가 1이라면 삭제하기
		System.out.println(list2);
		
		// 1. 향상된 반복문 활용하여 삭제해보기
//		for( Integer i : list2) {   // ConcurrentModificationException --> 향상된 반복문에서 중간에 요소를
//			                        // 삭제하고자한다면 발생. 
//			                        // 삭제시 index가 변경이되면서 반복이 제대로 진행되지 않기때문에 발생하는 에러
//			if(i == 1) {
//				list2.remove(i);
//			}
//		}
		
		// 2. 기본 loop문
//		for(int i =0; i<list2.size(); i++) {
//			if(list2.get(i) == 1 ) { 
//				list2.remove(i); // 삭제가 되는 순간 size의 사이즈가 1 작아져 버림.
//				i--;// 이걸로 해결가능하긴하나 생각하기 어렵고 , 경우에따라서 놓치는 경우가 있음
//			}
//		}
		
		// 3. Iterator 사용하기 *가장 좋은 방법
		Iterator<Integer> iter2= list2.iterator();
		while(iter2.hasNext()) {
			int s = iter2.next();
			if(s == 1) {
				iter2.remove(); // 현재 가리키고 있는 요소를 제거해주는 함수
			}
		}
		
		System.out.println(list2);
		
		// 14. shuffle : 컬렉션의 내부요소를 랜덤하게 섞어줌. (섞다) 
		Collections.shuffle(list);
		System.out.println(list);
		
		
		
	}

}
