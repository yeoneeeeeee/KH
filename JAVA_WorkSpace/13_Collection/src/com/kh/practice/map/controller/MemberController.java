package com.kh.practice.map.controller;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;
import java.util.TreeMap;

import com.kh.practice.map.model.vo.Member;

public class MemberController {
	private HashMap<String, Member> map = new HashMap();

	public boolean joinMembership(String id, Member m) {
		if(map.get(id) == null) {
			map.put(id, m);
			return true;
		}
		return false;
	}

	public String logIn(String id, String password) {
		if(map.get(id) != null && map.get(id).getPassword().equals(password)) {
			return map.get(id).getName();
		}
		return null;
	}

	public boolean changePassword(String id, String oldPw, String newPw) {
		Member m = map.get(id); // Member [name="민경민", pass=1234]
		if(m != null && m.getPassword().equals(oldPw)) {
			m.setPassword(newPw);
			return true;
		}
		return false;
	}

	public void changeName(String id, String newName) {
		map.get(id).setName(newName);
	}

	public TreeMap sameName(String name) {
		TreeMap<String, Member> tm = new TreeMap();
		
		Set<String> keySet = map.keySet();
		Iterator<String> it = keySet.iterator();
		while(it.hasNext()) {
			String id =it.next();
			if(map.get(id).getName().equals(name)) {
				tm.put(id, map.get(id));
			}
			
		}
		return tm;
	}

}
