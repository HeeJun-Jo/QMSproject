package com.qms.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/download")
public class FileDownload extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}	
	private void doHandle(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String file_repo="C:/workspace/uploadfile";
		String filePath = (String)request.getParameter("filePath"); 
		String fileName = (String)request.getParameter("fileName"); 
		System.out.println("fileName="+fileName);
		OutputStream out = response.getOutputStream(); 
		String downFile = file_repo+filePath;
		File f=new File(downFile);
	
		String downloadName = null;
		if(request.getHeader("user-agent").indexOf("MSIE")==-1) {
			downloadName = new String(fileName.getBytes("UTF-8"), "8859_1");
		}else {
			downloadName = new String(fileName.getBytes("EUC-KR"),"8859_1");
		}
		
		response.setContentType("application/octet-stream");
        response.setHeader("Cache-Control", "no-cache");
        response.addHeader("Content-disposition", "attachment; filename=\"" + downloadName + "\"");
		FileInputStream in=new FileInputStream(f);
		
        byte[] buffer=new byte[1024*8];
		while(true) {
			int count=in.read(buffer);
			if(count==-1)
				break;
			out.write(buffer,0,count);
		}
		in.close();
		out.close();
	}

}
