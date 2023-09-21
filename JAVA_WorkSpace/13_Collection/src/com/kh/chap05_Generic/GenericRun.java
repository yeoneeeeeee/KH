package com.kh.chap05_Generic;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

public class GenericRun <G , Generic> { // 글자 숫자 상관없음. 1글자로 작성하는게 관례
	
	G g; // 클래스나 메서드에 제네릭타입을 사용하게되면 해당 클래스나 내부에 들어가는 데이터 타입을 컴파일하는시점에 지정이됨
	Generic gen;
	
	public static void main(String[] args) {
		
		/*
		 * 기억할것!! ★ 제네릭을 설정하는 이유 ★
		 * 1. 명시한 타입의 객체만 저장가능하도록 타입의 제한을 두기 위해서 ==> 안정성을 확보 가능
		 * 2. 컬렉션에 저장된 객체를 꺼내서 사용할 때 매번 형변환하는 절차를 없애기 위해서. => jdk 1.5버전 이하에서는
		 * 제네릭을 지원하지 않아서 Object객체를 저장하고 , 꺼내쓸대도 강제형변환을 직접해줘야 했음==> 매우 불편했음
		 */
		
		// 제네릭 등장 이전
		List<Integer> l = new ArrayList(); // 컬렉션 안에 담긴 데이터의 실제 자료형 ? 모름
		
		Iterator i = l.iterator();
		while(i.hasNext()) {
			System.out.println( (String)i.next() ); // 꺼내쓸때 어떤 자료형인가? 몰름
			// 만약 특정 클래스안에 담긴 함수를 호출하기위해 다운캐스팅 하려고 했을때, 내부에 들어가있는 데이터타입이
			// 다운캐스팅하고자하는 클래스와 상속관계가 아닐수도 있다. ==> 형변환에러가 발생할 수 있다.
			
			// 따라서 내부적으로 들어갈 데이터 타입을 한정지울수 있는 방법을 고민하다가 Generic이 등장함.
		}
		
		/*
		 * 제네릭 <Generic>
		 * 
		 * 데이터 타입을 일반화 한다라는 의미. 여러 타입을 하나의 타입으로 일반화 시킨다.
		 * 
		 * 컬렉션과 함께 가장 많이 사용되며 저장할 객체를 제한하는 기능으로 한가지 종류의 클래스만 저장할수 있게 해놓은 기능.
		 * 
		 * 별도의 제네릭 제시 없이 컬렉션 객체를 생성하게 되면 해당 컬렉션에 다양한 타입의 데이터 값들이 담길수 있음
		 * 별도의 제네릭 설정을 <Music>하면 해당 컬렉션 안에는 오직 Music객체만 담길수 가 있다.
		 * 
		 * <E>, <T> ,<K>, <?> : 타입변수라고 부름. 내부에 들어간 알파벳 단어에는 기능이 없다.(단 개발자간의 암묵적 규칙이 존재한다)
		 *                      임의의 정해지지 않은 참조 자료형 타입을 의미. 실제 데이터 타입은 컴파일 시점에 정해진다 ★
		 *                      컴파일 시점? 제네릭클래스 객체생성, 제네릭이 붙은 매개변수 ,반환형이 있는 메서드가 호출될 때
		 *                      
		 *                      *정리*
		 *                      제네릭 타입은 그 자리에 대입되어야할 참조자료형값이 있다 라는 의미이고 들어갈 실제 타입은
		 *                      컴파일하는 시점에 내가 작성한대로 추가된다 라는 의미.
		 */
		
		GenericRun<Integer, String> gr1 = new GenericRun(); // 컴파일 되는 시점에 G == Integer, gen == String으로 변환
		gr1.g = 10;
		gr1.gen ="문자열";
		
		GenericRun<String, Integer> gr2 = new GenericRun(); // 객체생성시점에 G == String, gen == Integer타입이 변환
		gr2.g ="여기가 문자열";
		gr2.gen = 10;
		// 들어갈 데이터 타입을 미리 정의해두지 않음으로써 확장성을 크게 늘림.
		
		// 단점이 없어보이는 제네릭도 단점이 존재함.
		
		//-----------------------------------------------------------------------------
		// 객체배열을 통해 다형성에 대해 알아보기
		Integer[] arr = new Integer[] {1,2,3,4,5};
		
		Object[] oArr = new Object[5];
		
		oArr = arr;// 다형성의 원리에의해 UpCasting으로 자동형변환됨
		System.out.println(Arrays.toString(oArr));
		
		ArrayList<Integer> list = new ArrayList();
		list.add(1);
		list.add(1);
		list.add(1);
		list.add(1);
		
		ArrayList<Object> list2 = new ArrayList();
		
		// list2 = list; //제네릭 끼리는 상속관계가 적용이 안됨. ArrayList<Integer>와 ArrayList<Object>는 완전 다른
		// 별개의 클래스임. 제네릭은 정말 오직 <g>으로 전달받은 데이터 타입과 일치해야만 서로 받아줄수 있다.
		
		// 근데 문제점이 제네릭의 최대 장점이 바로 들어갈 데이터타입을 미리 정의해두지 않고 컴파일시점에 정해줌으로써
		// 확장성을 늘려준다인데 , 이러면 제네릭을 사용하는 의미가 퇴색되어버림.
		//gr1.printTest(list2); // 에러발생 , 제네릭을 추가시 오직 같은 타입변수만 추가 가능하므로 확장상이 떨어진다.
								// Object나, 그외 내가원하는 타입의 매개변수를 가진 함수를 계속 추가해줘야한다.
		
		// 해결방법으로 등장한게 <?>타입(와일드카드)
		// ?(unKnownType) : 타입이 정해지지 않은 타입. 제네릭으로 지정할 타입을 지정하지 않았다라는의미, 어떤 값이든 들어갈수있음.
		
		ArrayList<?> list3 = new ArrayList(); // 어떤 타입의 제네릭값이든 다 담을수 있게 됨.
		list3 = list2; //들어오는 데이터 타입신경쓰지않음. 아무거나 들어와! 라는 느낌이 강함.
		list3 = list;
		// any type (X) || unknown type (O)
		
		Iterator<?> it =list3.iterator();
		while(it.hasNext()) {
			//it.next(); // 꺼낸 요 데이터값의 자료형은 무엇인가?? 모름. 정해지지 않았기 때문에. 단순하게 꺼내기만 할거면 에러날 이유가 없음
			System.out.println(it.next());// 내부에 어떤 자료형의 데이터가 있는지 모르지만, 최소한 Object클랫의 먼 자손일것이기 때문에
			                              // 다형성 원리에 의해 println의 매개변수로 넣어줄수 있다.
		}
		
		// 완벽해보이는 ?도 단점이 있다.
		// ArrayList에 데이터를 추가하는 상황일때 제네릭 타입으로 ?를 설정했기때문에 아무 값이나 넣어도 상관없어보임.
		//list3.add(new Object()); // 추가시 컴파일 에러발생
		//list3.add(new ?);
		
		/*
		 * 제네릭 설정이 ? 라면 넣고자 하는 객체가 ?(unknownType)이여야함.
		 * 하지만 타입자체가 정해지지 않은게 ? 이므로, 들어가는 타입이 제네릭으로 지정한 타입인지 논리적으로 검사자체를 할수가
		 * 없기때문에 에러를 발생시킨다.
		 *  
		 * ?가 가질수있는 클래스 범위는 무한대. ?자리에는 String, Integer가올수도있꼬 Book, Student, Object 뭐가 됐든
		 * 들어올수가 있슴. 따라서 제대로 값이 들어갔는지 검사 자체가 불가능하기 때문에 컴파일 단계에서 에러가 발생한것.
		 * 
		 * list3.add("문자열"); // 만약에 ? Integer클래스였따면? 에러발생할것.
		 * list3.add(1); // 만약 ?가 String이라면 에러발생했을것
		 * list3.add(new Object()); // ?가 Object가 아닌이상 무조건 에러가 나는코드일것.
		 * 
		 * 즉 ?는 어떤 타입(any)이든 넣을수 있는 타입변수가 아니라 자료형이 정해지지 않은 뭔지모르겠는(unknown) 타입변수다.
		 * 단 , get을 사용해서 컬렉션 안에 들어가있는 값을 꺼낼때는 자료형에 대한 검사가 별도로 필요 없으므로 에러가 발생하지 않는다.
		 * 
		 * 문제점은 결국 ?가 가질수있는 자료형의 범위가 무한대이기때문에 발생한것. 
		 * 따라서 해결방안으로 ?의 자료형의 범위를 상속구조를 통해 한정짓는 방법을 찾게됨
		 * 
		 * 1. 상한 경계 설정 : 와일드카드가(?)가 가질수있는 자료형의 "최대값"을 설정하는 방법 == 상위클래스를 제한
		 *    [표현법]
		 *    클래스명< ? extends T> : ?가 가질수있는 최고 높은 자료형은 T다.T와 T의자손들만 제네릭으로 들어올수있음
		 *    (값을 꺼내쓸때 사용하는 걸 권장★)
		 * 
		 * 2. 하한 경계 설정 : 와일드카드가(?) 가질수 있는 자료형의 "최소값"을 설정하는 방법 == 하위클래스 제한
		 *    [표현법]
		 *    클래스명 <? super T> : T와 T의 조상클래스만 가능. ?가 가질수있는 가장 낮은 자료형은 T다.
		 *    (값을 추가할때 사용하는 걸 권장★)
		 */
		
		List<? extends Parent> upperBoundary = new ArrayList();
		for( Parent p  : upperBoundary) {// List에 들어가잇는 값이 뭔지 모름. 하지만 최소한 Parent클래스는 상속 받았으므로
			                             // 다형성 원리에 의해 자동형변환이 가능해지기 때문에 에러 발생하지 않는다.
			System.out.println(p);
		}
//		for( Child1 c  : upperBoundary) {// 에러발생 . Child1이 자식인건 맞지만 Parent의 자식이 Chil1, 2 3가 존재할수
		                                 // 있으므로 ?가 만약에 Child2라면 컴파일 에러가 발생할것.
//			System.out.println(p);
//		}
		//upperBoundary.add(new Parent()); //안됨. ==> ?는 Parent일수도있고 ,Child1, Child2일수도있음. 
		// 따라서 부모객체는 자동형변환이 안되기때문에 넣어줄수 ㅇ벗다.
		// upperBoundary.add(new Child1()); ?가 Parent면 무조건가능. Child2인경우 에러가 발생할수 있음.
		// upperBoundary.add(new Object()); // 당연히 안댐
		
		List<? super Parent> lowerBoundary = new ArrayList();
//		for(Parent p   :  lowerBoundary) { // 에러발생함. Parent보다 더 큰 부모타입이 와일드카드에 대입될수 있으므로 
//			
//		}
		for(Object o : lowerBoundary) { // ?에 들어가있는 타입이 뭐가됐든 Object의 자손이므로 자동형변환.
			
		}
		// 값을 출력시에는 불편함. 하한경계설정은 값을 넣어줄때 사용하는걸 권장한다.
		
		lowerBoundary.add(new Child1()); // 된다. 경계선상에 더 밑에 존재하기때문에 Upcasting발생.
		lowerBoundary.add(new Parent()); // 당연히 된다. 
		
		//lowerBoundary.add(new Object()); // 경계선상 더 위에 존재하므로 불가능.
	}

	public G test(G g) { // 메서드의 반환형, 매개변수에도 제네릭타입 지정 가능.
		return g;
	}
	
	public void printTest(ArrayList<Integer> list) {
		for( Integer i  :  list) {
			System.out.println(i);
		}
	}
	
	public void printTest2(ArrayList<Object> list) {
		for( Object i  :  list) {
			System.out.println(i);
		}
	}
	
}


class Parent {
	
}

class Child1 extends Parent{
	
}

class Child2 extends Parent{
	
}













