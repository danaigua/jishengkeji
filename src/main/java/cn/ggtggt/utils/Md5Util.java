package cn.ggtggt.utils;

import org.apache.shiro.crypto.hash.Md5Hash;

public class Md5Util {
	public static void main(String[] args) {
		System.out.println(Md5Util.md5("admin123", "jishengkeji"));
	}
	public static String md5(String str, String salt) {
		return new Md5Hash(str, salt).toString();
	}
}
