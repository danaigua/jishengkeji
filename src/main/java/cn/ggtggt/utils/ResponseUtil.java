package cn.ggtggt.utils;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

/**
 * 先页面写入信息的工具类
 * @author JOB
 *
 */
public class ResponseUtil {
	public static void write(HttpServletResponse response, Object o) throws IOException {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter writer = response.getWriter();
		writer.write(o.toString());
		writer.flush();
		writer.close();
	}
}
