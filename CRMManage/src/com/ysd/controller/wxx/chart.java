package com.ysd.controller.wxx;

import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.PathParam;
import javax.websocket.server.ServerEndpoint;


import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.CopyOnWriteArraySet;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;

@ServerEndpoint("/chat/{name}")
public class chart{
	private static Map<String, chart> map=new HashMap<>();
	private Session session=null;
	private String name;
	private static int count=0;
	@OnOpen
	public void onopen(@PathParam("name")String name,Session session) {
		System.out.println(session);
		this.session=session;
		this.name=name;
		map.put(name, this);
		count++;
		System.out.println("���ӽ�����"+name);
	}
	@OnMessage
	public void onmessage(String message) {
		System.out.println(message);
		String[] split = message.split(",");
		String formName=split[0];
		String tomName=split[1];
		String content=split[2];
		System.out.println(tomName);
		if(map.containsKey(tomName)) {
			//��������
			map.get(tomName).session.getAsyncRemote().sendText(content);
		}else {
			//������Ϣ
		}
		
		
	}
	@OnClose
	public void onclose() {
		System.out.println("�����˳���");
		map.remove(name);
		count--;
	}
	@OnError
	public void onerror(Session session,Throwable throwable) {}
	
}
