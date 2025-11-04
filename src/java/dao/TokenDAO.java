package dao;

import java.util.HashMap;
import java.util.Map;

public class TokenDAO {

    private static Map<String, String> tokenMap = new HashMap<>();
    // key = token, value = username

    public static void saveToken(String token, String username) {
        tokenMap.put(token, username);
    }

    public static String getUsernameByToken(String token) {
        return tokenMap.get(token);
    }

    public static void deleteToken(String token) {
        tokenMap.remove(token);
    }
}
